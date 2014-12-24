using System;
using System.Reflection;
using PageCache.Store.SQLServer;

namespace PageCache.Store
{
    public class Factory
    {
        public static IStore CreateInstance(Config.Store configStore)
        {
            if (!string.IsNullOrEmpty(configStore.FullTypeName) && !string.IsNullOrEmpty(configStore.AssemblyName))
            {
                if (configStore.FullTypeName.IndexOf("PageCache.Store.SQLServer") >= 0)
                {
                    return new SQLServerStore(configStore.ConnectionString);
                }
                else
                {
                    Assembly assembly = Assembly.Load(configStore.AssemblyName);

                    if (assembly != null)
                    {
                        Type type = assembly.GetType(configStore.FullTypeName);


                        if (type != null)
                        {

                            object storeObject = Activator.CreateInstance(type, configStore.ConnectionString);

                            if (storeObject != null)
                            {
                                IStore store = (IStore)storeObject;
                                return store;
                            }
                        }
                        else
                        {
                            throw new Exception(configStore.Name);

                        }
                    }
                }
            }



            return null;
        }
    }
}
