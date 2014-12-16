using System;
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

        const string CACHE_KEY = "StoreDataList";

        // List<StoreDataEntity> datalist = null;

        public List<StoreDataEntity> DataList
        {
            get { return GetCacheDataList(); }
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
            var datalist = GetCacheDataList();
            return Find(datalist, type, key);
        }

        StoreDataEntity Find(List<StoreDataEntity> datalist, string type, string key)
        {
            if (datalist == null)
            {
                return null;
            }

            for (int i = 0; i < datalist.Count; i++)
            {
                var entity = datalist[i];
                if (entity != null)
                {
                    if (entity.Key.Equals(key, StringComparison.OrdinalIgnoreCase) && entity.Type.Equals(type, StringComparison.OrdinalIgnoreCase))
                    {
                        return entity;
                    }
                }

            }
            return null;
        }


        List<StoreDataEntity> GetCacheDataList()
        {
            List<StoreDataEntity> datalist = null;

            object cacheObject = HttpContext.Current.Cache.Get(CACHE_KEY);

            if (cacheObject == null)
            {
                datalist = new List<StoreDataEntity>(this.capacity);

                HttpContext.Current.Cache.Insert(CACHE_KEY, datalist);
            }
            else
            {
                datalist = (List<StoreDataEntity>)cacheObject;
            }

            return datalist;
        }


        bool isSaving = false;

        public void Add(IStore store, StoreData data)
        {
            var datalist = GetCacheDataList();

            if (datalist == null)
            {
                return;
            }

            var foundEntity = Find(datalist, data.Type, data.Key);

            if (foundEntity != null)
            {
                datalist.Remove(foundEntity);
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

            datalist.Add(entity);

            if (datalist.Count >= capacity)
            {
                StoreDataEntity[] array = datalist.ToArray();
                ThreadPool.QueueUserWorkItem(SaveAsync, array);
                datalist.Clear();
                //SaveAsync(datalist);
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

            StoreDataEntity[] array = (StoreDataEntity[])o;

            if (array != null)
            {
                try
                {
                    for (int i = 0; i < array.Length; i++)
                    {
                        StoreDataEntity entity = array[i];

                        if (entity.ExpiresAbsolute > date)
                        {
                            if (entity.Store != null)
                            {
                                entity.Store.Save(entity);

                            }
                        }
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
