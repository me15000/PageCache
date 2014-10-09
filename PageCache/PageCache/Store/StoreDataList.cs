using System;
using System.Collections.Generic;
using System.Threading;

namespace PageCache.Store
{

    public class StoreDataEntity : StoreData
    {
        public IStore Store { get; set; }

    }

    public class StoreDataList
    {

        List<StoreDataEntity> datalist = null;

        int capacity = 10;
        public int Capacity
        {
            get { return capacity; }
        }


        public StoreDataList(int capacity)
        {
            this.capacity = capacity;
            this.datalist = new List<StoreDataEntity>(capacity);
        }


        public StoreData Get(string type, string key)
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


        public void Add(IStore store, StoreData data)
        {
            var foundEntity = Find(data.Type, data.Key);

            if (foundEntity != null)
            {
                this.datalist.Remove(foundEntity);
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


          

            this.datalist.Add(entity);

            Save();
        }

        void Save()
        {
            if (isSaving)
            {
                return;
            }


            if (this.datalist.Count >= capacity)
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

            isSaving = true;



            DateTime date = DateTime.Now;


            for (int i = 0; i < datalist.Count; i++)
            {
                StoreDataEntity entity = datalist[i];

                if (entity.ExpiresAbsolute > date)
                {
                    entity.Store.Save(entity);
                }

                datalist.Remove(entity);
            }


            isSaving = false;
        }



        StoreDataEntity Find(string type, string key)
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
