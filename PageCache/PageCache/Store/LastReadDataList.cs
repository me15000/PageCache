using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Threading;

namespace PageCache.Store
{
    public class LastReadDataList
    {
        public ICollection<StoreData> DataList
        {
            get
            {
                var datalist = this.datalist; //GetCacheData();

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
        

        ConcurrentDictionary<string, StoreData> datalist;
        public LastReadDataList(int cclevel, int capacity)
        {
            this.cclevel = cclevel;
            this.capacity = capacity;

            this.datalist = new ConcurrentDictionary<string, StoreData>(this.cclevel, this.capacity);
        }

        /*
        const string CACHE_KEY = "PageCache_LastReadDataList_DATA";
        ConcurrentDictionary<string, StoreData> GetCacheData()
        {
            ConcurrentDictionary<string, StoreData> datalist = null;

            object cacheObject = HttpRuntime.Cache.Get(CACHE_KEY);

            if (cacheObject == null)
            {
                datalist = new ConcurrentDictionary<string, StoreData>(this.cclevel, this.capacity);

                HttpRuntime.Cache.Insert(CACHE_KEY, datalist);
            }
            else
            {
                datalist = cacheObject as ConcurrentDictionary<string, StoreData>;
            }
            return datalist;
        }*/


        string GetDataKey(string type, string key)
        {
            return type + "_" + key;
        }


        StoreData Find(string type, string key)
        {
            var datalist = this.datalist; //GetCacheData();

            if (datalist == null)
            {
                return null;
            }


            string dk = GetDataKey(type, key);

            StoreData cacheData;


            if (datalist.TryGetValue(dk, out cacheData))
            {
                return cacheData;
            }

            return null;
        }

        public StoreData Get(string type, string key)
        {
            return Find(type, key);
        }

        public void Delete(string type, string key)
        {
            var datalist = this.datalist;//GetCacheData();

            if (datalist == null)
            {
                return;
            }

            string dk = GetDataKey(type, key);

            StoreData cacheData;

            datalist.TryRemove(dk, out cacheData);
        }



        public void Add(StoreData data)
        {
            var datalist = this.datalist;//GetCacheData();

            if (datalist == null)
            {
                return;
            }

            string dk = GetDataKey(data.Type, data.Key);


            datalist.AddOrUpdate(dk, data, (string k, StoreData oldData) =>
            {
                return data;
            });

            if (datalist.Count >= this.capacity)
            {

                ThreadPool.QueueUserWorkItem(ClearAsync, null);
            }
        }

        bool isClearing = false;

        void ClearAsync(object o)
        {
            if (isClearing)
            {
                return;
            }

            var datalist = this.datalist;// GetCacheData();

            if (datalist == null)
            {
                return;
            }


            isClearing = true;

            try
            {
                int removeCount = datalist.Count - this.capacity;

                if (removeCount > 0)
                {
                    StoreData cacheData;

                    for (int i = 0; i < removeCount; i++)
                    {
                        var enu = datalist.Keys.GetEnumerator();

                        if (enu != null)
                        {
                            datalist.TryRemove(enu.Current, out cacheData);
                        }
                    }
                }
            }
            catch (Exception ex)
            {

            }

            isClearing = false;
        }




    }
}
