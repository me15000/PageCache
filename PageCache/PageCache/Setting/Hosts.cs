using System;
using System.Collections.Generic;
using System.Net;

namespace PageCache.Setting
{
    public class Hosts
    {
        Setting setting;
        public Setting Setting
        {
            get { return setting; }
        }


        IDictionary<string, Host> hosts;


        public Hosts(Setting setting)
        {
            this.setting = setting;

            int c = setting.Config.Hosts.Count;

            hosts = new Dictionary<string, Host>(c);

            for (int i = 0; i < c; i++)
            {
                var host = setting.Config.Hosts[i];

                hosts.Add(host.Name, new Host(this, host));
            }

        }


        public Host Get(string hostName)
        {
            return hosts[hostName];
        }
    }

    public class Host
    {
        Config.Host configHost;
        public Config.Host ConfigHost
        {
            get { return configHost; }

        }

        Hosts hosts;
        public Hosts Hosts
        {
            get { return hosts; }
        }





        public Host(Hosts hosts, Config.Host configHost)
        {
            this.hosts = hosts;
            this.configHost = configHost;
        }



        public IPEndPoint GetHostAddress()
        {

            Config.Address address = null;

            if (configHost != null)
            {
                if (configHost.Addresses.Count == 1)
                {
                    address = configHost.Addresses[0];

                }
                else if (configHost.Addresses.Count > 1)
                {

                    int weight_max = 100;
                    Random r = new Random();
                    int weight = r.Next(0, weight_max);

                    int left = 0;
                    for (int i = 0; i < configHost.Addresses.Count; i++)
                    {
                        var addr = configHost.Addresses[i];

                        int right = left + (addr.Weight > 0 ? addr.Weight : weight_max - left);


                        if (weight >= left && weight < right)
                        {
                            address = addr;
                            break;
                        }

                        left = right;
                    }

                    if (address == null)
                    {
                        address = configHost.Addresses[configHost.Addresses.Count - 1];
                    }
                }
            }


            IPEndPoint endPoint = null;

            if (address != null)
            {
                endPoint = new IPEndPoint(IPAddress.Parse(address.IP ?? "127.0.0.1"), address.Port > 0 ? address.Port : 80);
            }


            if (endPoint == null)
            {
                endPoint = new IPEndPoint(IPAddress.Parse("127.0.0.1"), 80);
            }


            return endPoint;

        }




    }
}
