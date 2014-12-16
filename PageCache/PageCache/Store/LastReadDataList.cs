using System;
using System.Collections.Generic;
using System.Web;

namespace PageCache.Store
{
    public class LastReadDataList
    {

        const string CACHE_KEY = "LastReadDataList";



        // List<StoreData> datalist = null;
        public List<StoreData> DataList
        {
            get { return GetCacheDataList(); }
        }


        int capacity = 10;
        public int Capacity
        {
            get { return capacity; }
        }


        List<StoreData> GetCacheDataList()
        {
            List<StoreData> datalist = null;

            object cacheObject = HttpContext.Current.Cache.Get(CACHE_KEY);

            if (cacheObject == null)
            {
                datalist = new List<StoreData>(this.capacity);

                HttpContext.Current.Cache.Insert(CACHE_KEY, datalist);
            }
            else
            {
                datalist = (List<StoreData>)cacheObject;
            }

            return datalist;
        }


        StoreData Find(string type, string key)
        {
            List<StoreData> datalist = GetCacheDataList();

            return Find(datalist, type, key);
        }

        StoreData Find(List<StoreData> datalist, string type, string key)
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


        public LastReadDataList(int capacity)
        {
            this.capacity = capacity;
            //this.datalist = new List<StoreData>(capacity);
        }

        public StoreData Get(string type, string key)
        {
            return Find(type, key);
        }

        public void Delete(string type, string key)
        {
            var datalist = GetCacheDataList();

            if (datalist != null)
            {
                var entity = Find(datalist, type, key);

                if (entity != null)
                {
                    datalist.Remove(entity);
                }
            }
        }

        bool isClearing = false;

        public void Add(StoreData data)
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

            datalist.Add(data);

            if (isClearing)
            {
                return;
            }

            isClearing = true;
            if (datalist.Count >= this.capacity)
            {
                datalist.RemoveAt(0);
            }
            isClearing = false;
        }







    }
}
