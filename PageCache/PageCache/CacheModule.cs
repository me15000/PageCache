using System;
using System.Configuration;
using System.Web;

namespace PageCache
{
    public class CacheModule : IHttpModule
    {
        const string CACHE_KEY = "PAGECACHE_CacheService";

        CacheService service = null;

        public void Init(HttpApplication context)
        {
            if (InitSetting())
            {
                context.BeginRequest += new EventHandler(OnBeginRequest);
            }
        }
        //初始化设置
        public bool InitSetting()
        {
            var cache = HttpContext.Current.Cache;

            object cacheObject = cache.Get(CACHE_KEY);

            if (cacheObject != null)
            {
                service = cacheObject as CacheService;
            }
            else
            {

                string configPath = ConfigurationManager.AppSettings["PageCache:Config"] ?? "PageCache.Config";

                if (configPath.IndexOf("://") == -1)
                {
                    configPath = AppDomain.CurrentDomain.BaseDirectory + configPath;
                }

                Config.Config config = null;
                if (Config.ConfigBuilder.TryParseConfig(configPath, out config))
                {
                    Setting.Setting setting = new Setting.Setting(config);

                    if (setting != null)
                    {
                        if (setting.Config.Enable)
                        {
                            service = new CacheService(setting, this);

                            if (service != null)
                            {
                                if (configPath.IndexOf("://") > 0)
                                {
                                    cache.Insert(CACHE_KEY, service);
                                }
                                else
                                {
                                    cache.Insert(CACHE_KEY, service, new System.Web.Caching.CacheDependency(configPath));
                                }

                            }
                        }
                    }
                }
            }


            if (service != null)
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

            try
            {
                service.Process(context);
            }
            catch (Exception ex)
            {
                service.ErrorLog.Write(ex.Message);
            }
        }


        public void Dispose()
        {

        }
    }
}
