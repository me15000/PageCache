using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading;
using System.Web;

namespace PageCache.Store
{
    public class LastReadDataList
    {



        public List<StoreData> DataList
        {
            get
            {

                var cacheData = GetCacheData();
                var cacheKeyList = GetCacheKeyList();

                string[] keys = cacheKeyList.ToArray();

                List<StoreData> list = new List<StoreData>(keys.Length);

                for (int i = 0; i < keys.Length; i++)
                {
                    string key = keys[i];

                    object cacheObject = cacheData[key];

                    if (cacheObject != null)
                    {
                        StoreData entity = cacheObject as StoreData;

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


        const string CACHE_KEY_LIST_KEY = "LastReadDataList_KEY_LIST";
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


        const string CACHE_DATA_KEY = "LastReadDataList_DATA";
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




        StoreData Find(string type, string key)
        {
            string dk = GetDataKey(type, key);

            var cacheData = GetCacheData();

            object cacheObject = cacheData[dk];

            if (cacheObject != null)
            {
                return cacheObject as StoreData;
            }

            return null;
        }



        public LastReadDataList(int capacity)
        {
            this.capacity = capacity;
        }

        public StoreData Get(string type, string key)
        {
            return Find(type, key);
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


        public void Add(StoreData data)
        {
            var cacheData = GetCacheData();
            var cacheKeyList = GetCacheKeyList();

            if (cacheData == null || cacheKeyList == null)
            {
                return;
            }

            string dk = GetDataKey(data.Type, data.Key);

            lock (this)
            {
                cacheKeyList.Remove(dk);
            }

            cacheData[dk] = data;

            cacheKeyList.Add(dk);


            if (isClearing)
            {
                return;
            }


            if (cacheData.Count >= this.capacity || cacheKeyList.Count >= this.capacity)
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

            var cacheData = GetCacheData();

            var cacheKeyList = GetCacheKeyList();

            if (cacheData == null || cacheKeyList == null)
            {
                return;
            }

            isClearing = true;

            try
            {
                //cacheKeyList 有多余
                if (cacheKeyList.Count > this.capacity)
                {
                    var array = cacheKeyList.ToArray();
                    int removeCount = array.Length - this.capacity;
                    //清理掉多余的
                    if (removeCount > 0)
                    {
                        for (int i = 0; i < removeCount; i++)
                        {
                            string key = array[i];

                            cacheData.Remove(key);
                            cacheKeyList.Remove(key);
                        }
                    }
                }

                //cacheData 有多余
                if (cacheData.Count > this.capacity)
                {
                    foreach (object key in cacheData.Keys)
                    {
                        string k = key.ToString();

                        if (!cacheKeyList.Contains(k))
                        {
                            cacheData.Remove(key);
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
