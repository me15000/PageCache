using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading;
using System.Web;

namespace PageCache.Store
{


    public class MemoryDataEntity : StoreData
    {
        public DateTime LastReadDate { get; set; }
    }


    public class MemoryDataList
    {
        public List<MemoryDataEntity> DataList
        {
            get
            {
                var cacheData = GetCacheData();
                var cacheKeyList = GetCacheKeyList();

                string[] keys = cacheKeyList.ToArray();

                List<MemoryDataEntity> list = new List<MemoryDataEntity>(keys.Length);

                for (int i = 0; i < keys.Length; i++)
                {
                    string key = keys[i];

                    object cacheObject = cacheData[key];

                    if (cacheObject != null)
                    {
                        MemoryDataEntity entity = cacheObject as MemoryDataEntity;

                        if (entity != null)
                        {
                            list.Add(entity);
                        }
                    }
                }
                return list;
            }
        }

        int capacity = 10;
        public int Capacity
        {
            get { return capacity; }
        }


        int removeSeconds = 30;
        public int RemoveSeconds
        {
            get { return removeSeconds; }
            set { removeSeconds = value; }

        }


        int clearSeconds = 30;
        public int ClearSeconds
        {
            get { return clearSeconds; }
            set { clearSeconds = value; }

        }

        public MemoryDataList(int capacity, int clearSeconds, int removeSeconds)
        {
            this.capacity = capacity;
            this.clearSeconds = clearSeconds;
            this.removeSeconds = removeSeconds;
        }


        const string CACHE_KEY_LIST_KEY = "MemoryDataList_KEY_LIST";
        List<string> GetCacheKeyList()
        {
            List<string> datalist = null;


            object cacheObject = HttpContext.Current.Cache.Get(CACHE_KEY_LIST_KEY);

            if (cacheObject == null)
            {
                datalist = new List<string>(this.capacity);

                HttpContext.Current.Cache.Insert(CACHE_KEY_LIST_KEY, datalist);
            }
            else
            {
                datalist = cacheObject as List<string>;
            }

            return datalist;
        }


        const string CACHE_DATA_KEY = "MemoryDataList_DATA";
        Hashtable GetCacheData()
        {
            Hashtable datalist = null;

            object cacheObject = HttpContext.Current.Cache.Get(CACHE_DATA_KEY);

            if (cacheObject == null)
            {
                datalist = new Hashtable(this.capacity);

                HttpContext.Current.Cache.Insert(CACHE_DATA_KEY, datalist);
            }
            else
            {
                datalist = cacheObject as Hashtable;
            }

            return datalist;
        }


        string GetDataKey(string type, string key)
        {
            return type + "_" + key;
        }

        public void Delete(string type, string key)
        {
            var cacheData = GetCacheData();
            var cacheKeyList = GetCacheKeyList();

            if (cacheData == null || cacheKeyList == null)
            {
                return;
            }

            string dk = GetDataKey(type, key);


            lock (this)
            {
                cacheKeyList.Remove(dk);

                cacheData.Remove(dk);
            }
        }


        public StoreData Get(string type, string key)
        {
            MemoryDataEntity entity = Find(type, key);

            if (entity != null)
            {
                entity.LastReadDate = DateTime.Now;
            }

            return entity;
        }

        MemoryDataEntity Find(string type, string key)
        {
            string dk = GetDataKey(type, key);

            var hashdata = GetCacheData();

            object cacheObject = hashdata[dk];

            if (cacheObject != null)
            {
                return cacheObject as MemoryDataEntity;
            }

            return null;
        }



        DateTime prevClearTime = DateTime.Now;
        public void Add(StoreData data)
        {
            var cacheData = GetCacheData();
            var cacheKeyList = GetCacheKeyList();

            if (cacheData == null || cacheKeyList == null)
            {
                return;
            }



            MemoryDataEntity entity = new MemoryDataEntity
            {

                BodyData = data.BodyData
                ,
                CreatedDate = data.CreatedDate
                ,
                ExpiresAbsolute = data.ExpiresAbsolute
                ,
                HeadersData = data.HeadersData
                ,
                Key = data.Key
                ,
                Seconds = data.Seconds
                ,
                Type = data.Type
                ,
                LastReadDate = DateTime.Now

            };


            string dk = GetDataKey(data.Type, data.Key);

            lock (this)
            {
                cacheKeyList.Remove(dk);
            }

            cacheData[dk] = entity;

            cacheKeyList.Add(dk);

            if (isClearing)
            {
                return;
            }

            DateTime now = DateTime.Now;

            double ts = (now - prevClearTime).TotalSeconds;

            if (ts > clearSeconds || cacheKeyList.Count >= this.capacity)
            {
                //ThreadPool.QueueUserWorkItem(ClearAsync, null);

                ClearAsync(null);
            }
        }

        bool isClearing = false;
        void ClearAsync(object o)
        {
            if (isClearing)
            {
                return;
            }

            isClearing = true;

            DateTime now = DateTime.Now;

            prevClearTime = now;

            var cacheData = GetCacheData();
            var cacheKeyList = GetCacheKeyList();



            if (cacheData != null && cacheKeyList != null)
            {
                string[] keys = cacheKeyList.ToArray();

                lock (this)
                {
                    for (int i = 0; i < keys.Length; i++)
                    {
                        string key = keys[i];

                        object cacheObject = cacheData[key];
                        if (cacheObject != null)
                        {
                            MemoryDataEntity entity = cacheObject as MemoryDataEntity;

                            if (entity != null)
                            {
                                double its = (now - entity.LastReadDate).TotalSeconds;

                                if (its > removeSeconds || entity.ExpiresAbsolute < now)
                                {

                                    cacheData.Remove(key);
                                    cacheKeyList.Remove(key);
                                }
                            }

                        }

                    }
                }

            }




            isClearing = false;
        }


    }
}
