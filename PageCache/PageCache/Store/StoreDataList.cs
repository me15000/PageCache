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
                        StoreDataEntity entity = (StoreDataEntity)cacheObject;

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
                return (StoreDataEntity)cacheObject;
            }

            return null;
        }


        const string CACHE_KEY_LIST_KEY = "StoreDataList_KEY_LIST";
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
                datalist = (List<string>)cacheObject;
            }

            return datalist;
        }


        const string CACHE_DATA_KEY = "StoreDataList_DATA";
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
                datalist = (Hashtable)cacheObject;
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

            cacheKeyList.Remove(dk);

            cacheData[dk] = entity;

            cacheKeyList.Add(dk);


            if (cacheData.Count >= capacity)
            {
                //ThreadPool.QueueUserWorkItem(SaveAsync, null);
                SaveAsync(null);
            }
        }




        void SaveAsync(object o)
        {
            if (isSaving)
            {
                return;
            }

            isSaving = true;


            DateTime date = DateTime.Now;

            var cacheData = GetCacheData();
            var cacheKeyList = GetCacheKeyList();

            if (cacheData != null && cacheKeyList != null)
            {
                try
                {
                    string[] keys = cacheKeyList.ToArray();

                    for (int i = 0; i < keys.Length; i++)
                    {
                        string key = keys[i];

                        object cacheObject = cacheData[key];

                        if (cacheObject != null)
                        {
                            StoreDataEntity entity = (StoreDataEntity)cacheObject;
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

                        cacheKeyList.Remove(key);
                        cacheData.Remove(key);
                    }


                }
                catch (Exception ex)
                {

                }
            }


            isSaving = false;
        }


    }
}
