using System;
using System.Collections.Generic;
using System.Threading;

namespace PageCache.Store
{


    public class MemoryDataEntity : StoreData
    {
        public DateTime LastReadDate { get; set; }
    }


    public class MemoryDataList
    {

        List<MemoryDataEntity> datalist = null;

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
            this.datalist = new List<MemoryDataEntity>(capacity);

            this.clearSeconds = clearSeconds;
            this.removeSeconds = removeSeconds;


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



        public void Add(StoreData data)
        {


            var foundEntity = Find(data.Type, data.Key);

            if (foundEntity != null)
            {
                this.datalist.Remove(foundEntity);
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


            this.datalist.Add(entity);

            Clear();
        }


        DateTime prevClearTime = DateTime.Now;

        /// <summary>
        /// 清理缓存
        /// </summary>
        void Clear()
        {
            if (isClearing)
            {
                return;
            }

            DateTime now = DateTime.Now;

            double ts = (now - prevClearTime).TotalSeconds;

            if (ts > clearSeconds || this.datalist.Count >= this.capacity)
            {

                ThreadPool.QueueUserWorkItem(ClearAsync, null);
                //ClearAsync(null);
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

            for (int i = 0; i < datalist.Count; i++)
            {
                var entity = datalist[i];

                double its = (now - entity.LastReadDate).TotalSeconds;

                if (its > removeSeconds || entity.ExpiresAbsolute < now)
                {
                    this.datalist.Remove(entity);
                }
            }


            isClearing = false;
        }






        MemoryDataEntity Find(string type, string key)
        {
            for (int i = 0; i < datalist.Count; i++)
            {
                var entity = datalist[i];
                if (entity.Key.Equals(key) && entity.Type.Equals(type))
                {
                    return entity;
                }
            }
            return null;
        }



    }
}
