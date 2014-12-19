using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading;
using System.Web;

namespace PageCache.Store
{

    public class StoreDataEntity : StoreData
    {
        public IStore Store { get; set; }

    }

    public class StoreDataList
    {



        public List<StoreDataEntity> DataList
        {
            get
            {
                var cacheData = GetCacheData();
                var cacheKeyList = GetCacheKeyList();

                string[] keys = cacheKeyList.ToArray();

                List<StoreDataEntity> list = new List<StoreDataEntity>(keys.Length);

                for (int i = 0; i < keys.Length; i++)
                {
                    string key = keys[i];

                    object cacheObject = cacheData[key];

                    if (cacheObject != null)
                    {
                        StoreDataEntity entity = cacheObject as StoreDataEntity;

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

        public StoreDataList(int capacity)
        {
            this.capacity = capacity;
        }

        public StoreData Get(string type, string key)
        {
            return Find(type, key);
        }

        StoreDataEntity Find(string type, string key)
        {
            string dk = GetDataKey(type, key);

            var cacheData = GetCacheData();

            object cacheObject = cacheData[dk];

            if (cacheObject != null)
            {
                return cacheObject as StoreDataEntity;
            }

            return null;
        }


        const string CACHE_KEY_LIST_KEY = "StoreDataList_KEY_LIST";
        List<string> GetCacheKeyList()
        {
            List<string> datalist = null;

            object cacheObject = HttpRuntime.Cache.Get(CACHE_KEY_LIST_KEY);

            if (cacheObject == null)
            {
                datalist = new List<string>(this.capacity);

                HttpRuntime.Cache.Insert(CACHE_KEY_LIST_KEY, datalist);
            }
            else
            {
                datalist = cacheObject as List<string>;
            }

            return datalist;
        }


        const string CACHE_DATA_KEY = "StoreDataList_DATA";
        Hashtable GetCacheData()
        {
            Hashtable datalist = null;

            object cacheObject = HttpRuntime.Cache.Get(CACHE_DATA_KEY);

            if (cacheObject == null)
            {
                datalist = new Hashtable(this.capacity);

                HttpRuntime.Cache.Insert(CACHE_DATA_KEY, datalist);
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



        bool isSaving = false;

        public void Add(IStore store, StoreData data)
        {

            var cacheData = GetCacheData();
            var cacheKeyList = GetCacheKeyList();

            if (cacheData == null || cacheKeyList == null)
            {
                return;
            }


            StoreDataEntity entity = new StoreDataEntity
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
                Store = store
                ,
                Type = data.Type

            };


            string dk = GetDataKey(data.Type, data.Key);

            lock (this)
            {
                cacheKeyList.Remove(dk);
            }

            cacheData[dk] = entity;

            cacheKeyList.Add(dk);



            if (cacheData.Count >= capacity)
            {
                ThreadPool.QueueUserWorkItem(SaveAsync, null);
                //SaveAsync(null);
            }
        }




        void SaveAsync(object o)
        {
            if (isSaving)
            {
                return;
            }

            var cacheData = GetCacheData();
            var cacheKeyList = GetCacheKeyList();


            if (cacheData == null || cacheKeyList == null)
            {
                return;
            }


            isSaving = true;


            DateTime date = DateTime.Now;


            try
            {

                //清理掉不匹配的


                if (true)
                {
                    var keys = cacheKeyList.ToArray();

                    lock (this)
                    {
                        for (int i = 0; i < keys.Length; i++)
                        {
                            string k = keys[i];

                            if (!cacheData.ContainsKey(k))
                            {
                                cacheKeyList.Remove(k);
                            }
                        }
                    }
                }


                if (true)
                {
                    var keys = cacheData.Keys;

                    foreach (string k in keys)
                    {
                        if (!cacheKeyList.Contains(k))
                        {
                            cacheData.Remove(k);
                        }
                    }
                }


                //存储
                if (true)
                {
                    string[] keys = cacheKeyList.ToArray();

                    lock (this)
                    {
                        cacheKeyList.Clear();
                    }

                    for (int i = 0; i < keys.Length; i++)
                    {
                        string key = keys[i];

                        object cacheObject = cacheData[key];

                        if (cacheObject != null)
                        {
                            StoreDataEntity entity = cacheObject as StoreDataEntity;
                            if (entity != null)
                            {
                                if (entity.ExpiresAbsolute > date)
                                {
                                    if (entity.Store != null)
                                    {
                                        entity.Store.Save(entity);
                                    }
                                }
                            }
                        }


                        cacheData.Remove(key);
                    }
                }
            


            }
            catch (Exception ex)
            {

            }



            isSaving = false;
        }


    }
}
