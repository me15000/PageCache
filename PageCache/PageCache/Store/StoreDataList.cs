using System;
using System.Collections.Concurrent;
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


        public ICollection<StoreDataEntity> DataList
        {
            get
            {
                var datalist = this.datalist;// GetCacheData();

                if (datalist == null)
                {
                    return null;
                }

                return datalist.Values;
            }
        }

        int capacity = 10;
        public int Capacity
        {
            get { return capacity; }
        }

        int cclevel = 5;
        public int CCLevel
        {
            get { return cclevel; }
        }

        ConcurrentDictionary<string, StoreDataEntity> datalist;

        public StoreDataList(int cclevel, int capacity)
        {
            this.cclevel = cclevel;
            this.capacity = capacity;
            this.datalist = new ConcurrentDictionary<string, StoreDataEntity>(this.cclevel, this.capacity);
        }

        /*
        const string CACHE_KEY = "PageCache_StoreDataList_DATA";
        ConcurrentDictionary<string, StoreDataEntity> GetCacheData()
        {
            ConcurrentDictionary<string, StoreDataEntity> datalist = null;

            object cacheObject = HttpRuntime.Cache.Get(CACHE_KEY);

            if (cacheObject == null)
            {
                datalist = new ConcurrentDictionary<string, StoreDataEntity>(this.cclevel, this.capacity);

                HttpRuntime.Cache.Insert(CACHE_KEY, datalist);
            }
            else
            {
                datalist = cacheObject as ConcurrentDictionary<string, StoreDataEntity>;
            }
            return datalist;
        }

        */

        public StoreData Get(string type, string key)
        {
            return Find(type, key);
        }

        StoreDataEntity Find(string type, string key)
        {

            var datalist = this.datalist;//GetCacheData();

            if (datalist == null)
            {
                return null;
            }


            string dk = GetDataKey(type, key);

            StoreDataEntity cacheData;
            if (datalist.TryGetValue(dk, out cacheData))
            {
                return cacheData;
            }

            return null;
        }

        string GetDataKey(string type, string key)
        {
            return type + "_" + key;
        }


        public void Add(IStore store, StoreData data)
        {

            var datalist = this.datalist;//GetCacheData();

            if (datalist == null)
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

            datalist.AddOrUpdate(dk, entity, null);

            if (datalist.Count >= this.capacity)
            {
                ThreadPool.QueueUserWorkItem(SaveAsync, null);
            }
        }


        bool isSaving = false;


        void SaveAsync(object o)
        {
            if (isSaving)
            {
                return;
            }

            var datalist = this.datalist;//GetCacheData();

            if (datalist == null)
            {
                return;
            }



            isSaving = true;

            DateTime now = DateTime.Now;

            try
            {
                StoreDataEntity cacheData;

                var array = datalist.ToArray();

                foreach (var kv in array)
                {
                    var entity = kv.Value;
                    if (entity != null)
                    {
                        if (entity.ExpiresAbsolute > now)
                        {
                            if (entity.Store != null)
                            {
                                entity.Store.Save(entity);
                            }
                        }
                    }

                    string dk = GetDataKey(entity.Type, entity.Key);

                    datalist.TryRemove(dk, out cacheData);
                }
            }
            catch (Exception ex)
            {

            }



            isSaving = false;
        }



    }
}
