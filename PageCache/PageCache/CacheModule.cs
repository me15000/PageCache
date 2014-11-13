using System;
using System.Configuration;
using System.Web;

namespace PageCache
{
    public class CacheModule : IHttpModule
    {
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
            string configPath = AppDomain.CurrentDomain.BaseDirectory + ConfigurationManager.AppSettings["PageCache:Config"] ?? "PageCache.Config";

            Config.Config config;

            if (Config.ConfigBuilder.TryParseConfig(configPath, out config))
            {
                if (!config.Enable)
                {
                    return false;
                }

                Setting.Setting setting = new Setting.Setting(config);
                this.service = new CacheService(setting, this);
                return true;
            }

            return false;
        }



        //当用户请求时触发
        public void OnBeginRequest(Object source, EventArgs e)
        {
            HttpApplication application = (HttpApplication)source;
            HttpContext context = application.Context;


            service.Process(context);
        }


        public void Dispose()
        {

        }
    }
}
