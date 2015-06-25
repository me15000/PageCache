using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Threading;

namespace PageCache.Store
{
    public class StoreDataEntity
    {
        public IStore Store { get; set; }
        public StoreData Data { get; set; }
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
            this.datalist = new ConcurrentDictionary<string, StoreDataEntity>(this.cclevel, this.capacity * 2);
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
            var entity = Find(type, key);

            if (entity != null)
            {

                return entity.Data;

            }

            return null;
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
                Store = store
                ,
                Data = data
            };

            string dk = GetDataKey(data.Type, data.Key);


            datalist.AddOrUpdate(dk, entity, (string k, StoreDataEntity oldData) =>
            {
                return entity;
            });


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
                        if (entity.Data.ExpiresAbsolute > now)
                        {
                            if (entity.Store != null)
                            {
                                entity.Store.Save(entity.Data);
                            }
                        }
                    }

                    datalist.TryRemove(kv.Key, out cacheData);

                }
            }
            catch (Exception ex)
            {

            }



            isSaving = false;
        }



    }
}
