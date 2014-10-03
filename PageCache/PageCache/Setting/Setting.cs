using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;

namespace PageCache.Setting
{
    public class Setting
    {




        #region 属性



        Stores stores;
        public Stores Stores
        {
            get { return stores; }
        }




        Hosts hosts;
        public Hosts Hosts
        {
            get { return hosts; }
        }



        Rules rules;
        public Rules Rules
        {
            get { return rules; }
        }


        Config.Config config;
        public Config.Config Config
        {
            get { return config; }
        }

        #endregion

        public Setting(Config.Config config)
        {
            this.config = config;
            stores = new Stores(this);
            hosts = new Hosts(this);
            rules = new Rules(this);
        }
    }


}
