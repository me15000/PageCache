using System;
using System.Configuration;
using System.Web;

namespace PageCache
{
    public class CacheModule : IHttpModule
    {
        const string CACHE_KEY = "PAGECACHE";

        CacheService service = null;
        int scriptTimeout = 10;

        public void Init(HttpApplication context)
        {
            if (InitSetting())
            {
                context.BeginRequest += new EventHandler(OnBeginRequest);
            }
        }

        public Config.Config GetCacheConfig()
        {
            string cache_key = CACHE_KEY + "_Config";


            Config.Config config = null;

            var cache = HttpRuntime.Cache;


            object cacheObject = cache.Get(cache_key);

            if (cacheObject != null)
            {
                config = cacheObject as Config.Config;
            }
            else
            {
                string configPath = ConfigurationManager.AppSettings["PageCache:Config"] ?? "PageCache.Config";

                if (configPath.IndexOf("://") == -1)
                {
                    configPath = AppDomain.CurrentDomain.BaseDirectory + configPath;
                }


                if (Config.ConfigBuilder.TryParseConfig(configPath, out config))
                {
                    if (configPath.IndexOf("://") > 0)
                    {
                        cache.Insert(cache_key, config);
                    }
                    else
                    {
                        cache.Insert(cache_key, config, new System.Web.Caching.CacheDependency(configPath));
                    }
                }
            }

            return config;
        }

        public Setting.Setting GetCacheSetting()
        {
            string cache_key = CACHE_KEY + "_Setting";

            Setting.Setting setting = null;

            var cache = HttpRuntime.Cache;

            object cacheObject = cache.Get(cache_key);

            if (cacheObject != null)
            {
                setting = cacheObject as Setting.Setting;
            }
            else
            {

                var config = GetCacheConfig();

                if (config != null)
                {
                    setting = new Setting.Setting(config);

                    if (setting != null)
                    {
                        this.scriptTimeout = Convert.ToInt32(Math.Ceiling((decimal)(setting.Config.NetReceiveTimeout + setting.Config.NetSendTimeout) / (decimal)1000));

                        if (this.scriptTimeout <= 0)
                        {
                            this.scriptTimeout = 10;
                        }

                        cache.Insert(cache_key, setting);
                    }
                }
            }

            return setting;
        }

        public CacheService GetCacheService()
        {
            string cache_key = CACHE_KEY + "_Service";

            CacheService service = null;

            var cache = HttpRuntime.Cache;

            object cacheObject = cache.Get(cache_key);

            if (cacheObject != null)
            {
                service = cacheObject as CacheService;
            }
            else
            {

                var setting = GetCacheSetting();

                if (setting != null)
                {
                    if (setting.Config.Enable)
                    {
                        service = new CacheService(setting, this);

                        cache.Insert(cache_key, service);
                    }
                }

            }

            return service;
        }

        //初始化设置
        public bool InitSetting()
        {
            this.service = GetCacheService();

            if (this.service != null)
            {
                return true;
            }

            return false;
        }

        //当用户请求时触发
        public void OnBeginRequest(Object source, EventArgs e)
        {
            HttpApplication application = source as HttpApplication;

            HttpContext context = application.Context;



            context.Server.ScriptTimeout = this.scriptTimeout;

            RequestInfo info = null;

            try
            {
                this.service.Process(context, out info);
            }
            catch (Exception ex)
            {
                if (this.service.ErrorLog != null)
                {
                    this.service.ErrorLog.Write("CacheModule: " + ex.Message + "\r\n" + ex.ToString() + "\r\n----------\r\n" + (info == null ? string.Empty : info.ToString()));
                }
            }
        }


        public void Dispose()
        {

        }
    }
}
