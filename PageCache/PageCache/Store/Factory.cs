using System;
using System.Reflection;

namespace PageCache.Store
{
    public class Factory
    {
        public static IStore CreateInstance(Config.Store configStore)
        {
            if (!string.IsNullOrEmpty(configStore.FullTypeName))
            {
                if (configStore.FullTypeName.IndexOf("PageCache.Store.SQLServer") >= 0)
                {
                    return new SQLServer.SQLServerStore(configStore.ConnectionString);
                }
                else if (configStore.FullTypeName.IndexOf("PageCache.Store.Disk") >= 0)
                {
                    return new Disk.DiskStore(configStore.ConnectionString);
                }
                else if (!string.IsNullOrEmpty(configStore.AssemblyName))
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
