using System;
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

        const string CACHE_KEY = "MemoryDataList";



        //List<MemoryDataEntity> datalist = null;


        public List<MemoryDataEntity> DataList
        {
            get { return GetCacheDataList(); }
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
            //this.datalist = new List<MemoryDataEntity>(capacity);

            this.clearSeconds = clearSeconds;
            this.removeSeconds = removeSeconds;
        }

        List<MemoryDataEntity> GetCacheDataList()
        {
            List<MemoryDataEntity> datalist = null;

            object cacheObject = HttpContext.Current.Cache.Get(CACHE_KEY);

            if (cacheObject == null)
            {
                datalist = new List<MemoryDataEntity>(this.capacity);

                HttpContext.Current.Cache.Insert(CACHE_KEY, datalist);
            }
            else
            {
                datalist = (List<MemoryDataEntity>)cacheObject;
            }

            return datalist;
        }



        public void Delete(string type, string key)
        {
            List<MemoryDataEntity> datalist = GetCacheDataList();
            if (datalist != null)
            {
                var entity = Find(datalist, type, key);

                if (entity != null)
                {
                    datalist.Remove(entity);
                }
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
            List<MemoryDataEntity> datalist = GetCacheDataList();

            return Find(datalist, type, key);
        }

        MemoryDataEntity Find(List<MemoryDataEntity> datalist, string type, string key)
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
                    if (entity.Key.Equals(key) && entity.Type.Equals(type))
                    {
                        return entity;
                    }
                }

            }
            return null;
        }



        DateTime prevClearTime = DateTime.Now;
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

            //MemoryDataEntity entity = (MemoryDataEntity)data;

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


            datalist.Add(entity);

            if (isClearing)
            {
                return;
            }

            DateTime now = DateTime.Now;

            double ts = (now - prevClearTime).TotalSeconds;

            if (ts > clearSeconds || datalist.Count >= this.capacity)
            {
                ThreadPool.QueueUserWorkItem(ClearAsync, datalist);
                // ClearAsync(null);
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

            var datalist = (List<MemoryDataEntity>)o;

            if (datalist != null)
            {
                for (int i = 0; i < datalist.Count; i++)
                {
                    var entity = datalist[i];

                    double its = (now - entity.LastReadDate).TotalSeconds;

                    if (its > removeSeconds || entity.ExpiresAbsolute < now)
                    {
                        datalist.Remove(entity);
                    }
                }
            }


            isClearing = false;
        }


    }
}
