using System.Collections.Generic;

namespace PageCache.Store
{
    public class LastReadDataList
    {

        List<StoreData> datalist = null;

        int capacity = 10;
        public int Capacity
        {
            get { return capacity; }
        }



        public LastReadDataList(int capacity)
        {
            this.capacity = capacity;
            this.datalist = new List<StoreData>(capacity);
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



        public void Add(StoreData data)
        {
            var foundEntity = Get(data.Type, data.Key);

            if (foundEntity != null)
            {
                this.datalist.Remove(foundEntity);
            }

            this.datalist.Add(data);

            Clear();
        }



        bool isClearing = false;
        /// <summary>
        /// 清理缓存
        /// </summary>
        void Clear()
        {
            if (isClearing)
            {
                return;
            }

            isClearing = true;

            if (this.datalist.Count >= this.capacity)
            {
                this.datalist.RemoveAt(0);
            }

            isClearing = false;
        }





    }
}
