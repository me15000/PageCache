using System;
using System.Collections.Generic;

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

            /*
            if (setting.Config.Stores.Count > 0)
            {
                for (int i = 0; i < setting.Config.Stores.Count; i++)
                {
                    Config.Store configStore = setting.Config.Stores[i];

                    if (configStore.Name.Equals(storeName, StringComparison.OrdinalIgnoreCase))
                    {
                        return Store.Factory.CreateInstance(configStore);
                    }
                }

                return Store.Factory.CreateInstance(setting.Config.Stores[0]);
            }

            return null;*/

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
                //配置值为1到100 包含100

                int max = 101;

                Random r = new Random();
                int rnd = r.Next(1, max);

                int left = 1;

                for (int i = 0; i < setting.Config.Stores.Count; i++)
                {
                    var item = setting.Config.Stores[i];

                    int weight = item.Weight;

                    if (weight > 0 && weight < max)
                    {
                        //参与随机

                        int right = left + weight;

                        if (rnd >= left && rnd < right)
                        {
                            storeName = item.Name;
                            break;
                        }

                        left = right;
                    }
                }

                if (storeName == null)
                {
                    storeName = setting.Config.Stores[0].Name;
                }
            }

            return Get(storeName);

        }





    }
}
