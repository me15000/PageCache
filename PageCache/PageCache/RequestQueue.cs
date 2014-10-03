using System.Collections.Generic;

namespace PageCache
{
    /// <summary>
    /// 请求队列
    /// </summary>
    public class RequestQueue
    {

        Dictionary<string, int> dict;

        public RequestQueue()
        {
            dict = new Dictionary<string, int>();
        }

        string GetKey(RequestInfo info)
        {
            return info.Key + ":" + info.Type;
        }

        public void In(RequestInfo info)
        {
            string key = GetKey(info);


            if (dict.ContainsKey(key))
            {
                dict[key]++;
            }
            else
            {
                dict.Add(key, 1);
            }
        }


        public void Out(RequestInfo info)
        {
            string key = GetKey(info);


            if (dict.ContainsKey(key))
            {
                int c = dict[key]--;

                if (c == 0)
                {
                    dict.Remove(key);
                }
            }

        }

        public int GetCount(RequestInfo info)
        {
            string key = GetKey(info);
            if (dict.ContainsKey(key))
            {
                return dict[key];
            }
            return 0;
        }
    }
}
