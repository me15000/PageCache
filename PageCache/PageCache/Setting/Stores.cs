using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PageCache.Setting
{
    public class Stores
    {
        Setting setting;
        public Setting Setting
        {
            get { return setting; }
        }


        IDictionary<string, Store.IStore> stores;
        public IDictionary<string, Store.IStore> Items
        {
            get { return stores; }
        }


        public Stores(Setting setting)
        {
            this.setting = setting;

            stores = new Dictionary<string, Store.IStore>(setting.Config.Stores.Count);


            for (int i = 0; i < setting.Config.Stores.Count; i++)
            {
                Config.Store configStore = setting.Config.Stores[i];

                Store.IStore store = Store.Factory.CreateInstance(configStore);

                stores.Add(configStore.Name, store);
            }
        }



        public Store.IStore Get(string storeName)
        {
            return stores[storeName];
        }


        public Store.IStore GetRandom()
        {
            string storeName = null;

            if (setting.Config.Stores.Count == 1)
            {
                storeName = setting.Config.Stores[0].Name;
            }
            else if (setting.Config.Stores.Count > 1)
            {
                int weight_max = 100;
                Random r = new Random();
                int weight = r.Next(0, weight_max);

                int left = 0;
                for (int i = 0; i < setting.Config.Stores.Count; i++)
                {
                    var item = setting.Config.Stores[i];

                    int right = left + (item.Weight > 0 ? item.Weight : weight_max - left);


                    if (weight >= left && weight < right)
                    {
                        storeName = item.Name;
                        break;
                    }

                    left = right;
                }

                if (storeName == null)
                {
                    storeName = setting.Config.Stores[setting.Config.Stores.Count - 1].Name;
                }
            }

            return Get(storeName);

        }





    }
}
