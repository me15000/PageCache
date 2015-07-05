using System;
using System.Linq;
using System.Text;
using System.Web;

namespace PageCache
{
    public class CacheService
    {
        #region 私有字段

        Setting.Setting setting;

        //Store.MemoryDataList memoryDataList = null;

        Store.LastReadDataList lastReadDataList = null;

        Store.StoreDataList storeDataList = null;

        //RequestQueue requestQueue = null;

        Common.HttpClient httpClient;

        Common.Log errorLog = null;

        public Common.Log ErrorLog
        {
            get { return errorLog; }
        }

        Common.Log accessLog = null;
        public Common.Log AccessLog
        {
            get { return accessLog; }
        }



        CacheModule module = null;

        Config.Config config = null;

        //List<string> creatingKeyList = null;


        #endregion

        /// <summary>
        /// 初始化
        /// </summary>
        /// <param name="setting"></param>
        /// <param name="module"></param>
        public CacheService(Setting.Setting setting, CacheModule module)
        {

            this.setting = setting;

            this.module = module;

            config = setting.Config;

            //this.memoryDataList = new Store.MemoryDataList(config.MemoryRule.Capacity, config.MemoryRule.ClearSeconds, config.MemoryRule.RemoveSeconds);

            this.lastReadDataList = new Store.LastReadDataList(config.CCLevel, config.LastReadBufferSize);

            this.storeDataList = new Store.StoreDataList(config.CCLevel, config.StoreBufferSize);

            //this.creatingKeyList = new List<string>();

            //this.requestQueue = new RequestQueue();

            this.httpClient = new Common.HttpClient();

            this.httpClient.ReceiveTimeout = config.NetReceiveTimeout;

            this.httpClient.SendTimeout = config.NetSendTimeout;

            if (!string.IsNullOrEmpty(config.ErrorLogPath))
            {
                this.errorLog = new Common.Log(config.ErrorLogPath);

                this.httpClient.ErrorLog = this.errorLog;
            }

            if (!string.IsNullOrEmpty(config.AccessLogPath))
            {
                this.accessLog = new Common.Log(config.AccessLogPath);
            }

        }

        /// <summary>
        /// 输出PageCache当前状态
        /// </summary>
        /// <param name="context"></param>
        public void EchoStatus(HttpContext context)
        {

            context.Response.ContentType = "text/plain";

            string type = context.Request.QueryString["type"] ?? "all";


            if (type.IndexOf("all") >= 0 || type.IndexOf("last") >= 0)
            {

                var keylist = lastReadDataList.KeyList;

                context.Response.Write("[lastReadKeyList,Count:" + keylist.Count + ",Capacity:" + lastReadDataList.Capacity + "]:\r\n");

                foreach (var item in keylist)
                {
                    context.Response.Write("key:" + item + "\r\n");
                }


                var datalist = lastReadDataList.DataList;
                context.Response.Write("[lastReadDataList,Count:" + datalist.Count + ",Capacity:" + lastReadDataList.Capacity + "]:\r\n");

                foreach (var item in datalist)
                {
                    context.Response.Write("key:" + item.Key + ",type:" + item.Type + ",expires:" + item.ExpiresAbsolute.ToString() + ",size:" + item.BodyData.Length + "\r\n");
                }
            }

            if (type.IndexOf("all") >= 0 || type.IndexOf("store") >= 0)
            {
                var datalist = storeDataList.DataList;

                context.Response.Write("[storeDataList,Count:" + datalist.Count + ",Capacity:" + storeDataList.Capacity + "]:\r\n");

                foreach (var item in datalist)
                {
                    context.Response.Write("key:" + item.Data.Key + ",type:" + item.Data.Type + ",expires:" + item.Data.ExpiresAbsolute.ToString() + ",size:" + item.Data.BodyData.Length + "\r\n");
                }
            }

            context.ApplicationInstance.CompleteRequest();
        }

        const string SYSTEM_ERROR_MESSAGE = "The system is busy now. Please try later.";


        /// <summary>
        /// 入口
        /// </summary>
        /// <param name="context"></param>
        /// <param name="info"></param>
        public void Process(HttpContext context, out RequestInfo info)
        {
            info = null;

            if (context.Request.RawUrl.IndexOf(this.config.StatusKey) >= 0)
            {
                EchoStatus(context);
                return;
            }

            var rule = setting.Rules.Get(context);

            if (rule != null)
            {
                if (EchoClientCache(context, rule.ConfigRule.CacheSeconds))
                {
                    context.ApplicationInstance.CompleteRequest();
                    return;
                }

                context.Response.AddHeader("PageCache", "Powered by https://github.com/me15000");

                info = RequestInfo.Create(context, rule);

                if (info != null)
                {
                    //requestQueue.In(info);

                    if (accessLog != null)
                    {
                        accessLog.Write(info.ToString());
                    }

                    if (!EchoData(info))
                    {
                        context.Response.StatusCode = 504;

                        if (errorLog != null)
                        {
                            errorLog.Write(SYSTEM_ERROR_MESSAGE + info.ToString());
                        }

                    }

                    context.ApplicationInstance.CompleteRequest();
                    //requestQueue.Out(info);
                }
            }
        }

        bool EchoData(RequestInfo info)
        {


            Store.StoreData olddata = null;

            //强制刷新缓存
            bool hasRefreshKey = info.Context.Request.RawUrl.IndexOf(setting.Config.RefreshKey) >= 0
                                    || info.Context.Request.Headers.AllKeys.Contains(setting.Config.RefreshKey);

            //没有强制刷新的时候 从缓存读取
            #region 从缓存读取
            if (!hasRefreshKey)
            {
                //尝试从最后的数据列中读取缓存
                if (true)
                {
                    Store.StoreData data = lastReadDataList.Get(info.Type, info.Key);

                    if (data != null)
                    {

                        if (data.BodyData != null)
                        {
                            olddata = data;

                            if (setting.Config.ReadOnly)
                            {
                                if (EchoData(info.Context, data))
                                {
                                    return true;
                                }
                            }

                            if (data.ExpiresAbsolute > DateTime.Now)
                            {
                                if (EchoData(info.Context, data))
                                {
                                    return true;
                                }
                            }
                        }

                    }
                }

                //尝试从StoreDataList 中读取缓存
                if (true)
                {
                    Store.StoreData data = storeDataList.Get(info.Type, info.Key);

                    if (data != null)
                    {
                        if (data.BodyData != null)
                        {
                            olddata = data;

                            if (setting.Config.ReadOnly)
                            {
                                if (EchoData(info.Context, data))
                                {
                                    return true;
                                }
                            }

                            if (data.ExpiresAbsolute > DateTime.Now)
                            {
                                if (EchoData(info.Context, data))
                                {
                                    return true;
                                }
                            }
                        }

                    }
                }



                //Store
                if (info.Store != null)
                {
                    Store.StoreData data = info.Store.GetData(info.Type, info.Key);

                    if (data != null)
                    {

                        if (data.BodyData != null)
                        {
                            olddata = data;

                            if (setting.Config.ReadOnly)
                            {
                                if (EchoData(info.Context, data))
                                {
                                    return true;
                                }
                            }

                            if (data.ExpiresAbsolute > DateTime.Now)
                            {
                                lastReadDataList.Add(data);

                                if (EchoData(info.Context, data))
                                {
                                    return true;
                                }
                            }
                        }

                    }
                }
            }

            #endregion


            //创建优先
            if (info.Rule.CreateFirst)
            {
                return TryCreateAndEchoData(info, olddata);
            }
            else
            {
                return TryEchoAndCreateData(info, olddata);
            }
        }




        bool TryCreateAndEchoData(RequestInfo info, Store.StoreData olddata)
        {

            Store.StoreData outdata = null;

            if (TryCreateAndSaveData(info, out outdata))
            {

                if (EchoData(info.Context, outdata))
                {
                    return true;
                }
            }


            //上述步骤执行失败，输出老缓存
            if (olddata != null)
            {
                if (olddata.BodyData != null)
                {
                    if (EchoData(info.Context, olddata))
                    {
                        return true;
                    }
                }

            }



            return false;
        }

        bool TryEchoAndCreateData(RequestInfo info, Store.StoreData olddata)
        {

            //优先输出老缓存，再创建保存缓存
            if (olddata != null)
            {


                if (EchoData(info.Context, olddata))
                {
                    Store.StoreData outdata;

                    TryCreateAndSaveData(info, out outdata);

                    return true;
                }
            }
            else
            {


                Store.StoreData outdata = null;

                if (TryCreateAndSaveData(info, out outdata))
                {
                    if (EchoData(info.Context, outdata))
                    {
                        return true;
                    }
                }
            }

            return false;
        }


        void TryCreateDataAsync(object o)
        {
            RequestInfo info = o as RequestInfo;

            //创建并存储缓存
            Store.StoreData outdata = null;

            TryCreateAndSaveData(info, out outdata);
        }

        bool TryCreateAndSaveData(RequestInfo info, out Store.StoreData outdata)
        {
            outdata = CreateData(info);

            if (outdata != null)
            {

                if (outdata.HeadersData != null)
                {
                    //存入store
                    if (outdata.Seconds > 0 && outdata.HeadersData.Length >= 0)
                    {
                        storeDataList.Add(info.Store, outdata);
                    }

                    //存入 lastRead
                    lastReadDataList.Add(outdata);

                    return true;
                }
            }





            return false;
        }


        Store.StoreData CreateData(RequestInfo info)
        {
            Store.StoreData storeData = null;


            byte[] rheadersData = GetRequestHeadersData(info);

            /*
            var method = Common.HttpClient.HTTPMethod.GET;

            string client_method = info.HttpMethod;

            switch (client_method)
            {
                case "GET":
                    method = Common.HttpClient.HTTPMethod.GET;
                    break;
                case "POST":
                    method = Common.HttpClient.HTTPMethod.POST;
                    break;
                case "HEAD":
                    method = Common.HttpClient.HTTPMethod.HEAD;
                    break;
                default:
                    break;
            }
            */

            Common.HttpData http_data = null;

            http_data = httpClient.GetData(info.HostAddress, rheadersData);

            /*
            try
            {
               

                
            }
            catch (Exception ex)
            {

                if (errorLog != null && http_data == null)
                {
                    errorLog.Write("CreateData failed! " + ex.Message + "\r\n----------\r\n" + info.ToString());
                }
            }

            */


            if (http_data != null)
            {
                var store_data = ConvertHttpDataToStoreData(info, http_data);

                if (store_data != null)
                {
                    if (store_data.HeadersData != null)
                    {
                        storeData = store_data;
                    }
                }
            }




            return storeData;
        }


        const int CHUNKED_SIZE = 1024 * 128;

        bool EchoData(HttpContext context, Store.StoreData data)
        {

            if (data == null)
            {
                return false;
            }

            bool echoGZip = IsClientProvidedGZip(context);

            string headerstrings = Encoding.ASCII.GetString(data.HeadersData);

            Common.HttpDataInfo hhs = Common.HttpClient.ParseHeaderString(headerstrings);

            if (hhs != null)
            {
                context.Response.StatusCode = hhs.StatusCode;

                context.Response.StatusDescription = hhs.StatusDescription;

                foreach (string k in hhs.Headers.Keys)
                {
                    string v = hhs.Headers[k];

                    context.Response.AddHeader(k, v);
                    if (!echoGZip)
                    {
                        if (k == "Content-Type")
                        {
                            EchoContentEncodingCharset(context, v);
                        }
                    }
                }
            }


            if (context.Response.StatusCode >= 100 && context.Response.StatusCode < 400)
            {
                EchoBrowserCache(context, data);
            }


            var response = context.Response;

            var bodyData = data.BodyData;

            if (bodyData != null)
            {
                int totalCount = bodyData.Length;

                if (totalCount > CHUNKED_SIZE)
                {

                    response.BufferOutput = false;

                    var outputStream = response.OutputStream;

                    try
                    {
                        int nowCount = 0;

                        while (nowCount < totalCount)
                        {
                            int leftCount = totalCount - nowCount;

                            if (leftCount < CHUNKED_SIZE)
                            {
                                outputStream.Write(bodyData, nowCount, leftCount);
                                outputStream.Flush();
                                nowCount += leftCount;
                            }
                            else
                            {
                                outputStream.Write(bodyData, nowCount, CHUNKED_SIZE);
                                outputStream.Flush();
                                nowCount += CHUNKED_SIZE;
                            }
                        }
                    }
                    catch (Exception ex)
                    {

                    }
                    finally
                    {
                        outputStream.Close();
                        outputStream.Dispose();
                    }

                }
                else
                {
                    response.BinaryWrite(bodyData);
                }
            }




            return true;
        }

        bool IsClientProvidedGZip(HttpContext context)
        {
            string client_accept_encoding = context.Request.Headers.Get("Accept-Encoding") ?? string.Empty;
            //支持GZip
            if (client_accept_encoding.IndexOf("gzip", StringComparison.OrdinalIgnoreCase) >= 0)
            {
                return true;
            }
            return false;
        }

        void EchoBrowserCache(HttpContext context, Store.StoreData data)
        {
            if (data != null)
            {
                string time = data.CreatedDate.ToString("r");
                TimeSpan ts = TimeSpan.FromSeconds(data.Seconds);
                DateTime now = DateTime.Now;
                DateTime expDate = now.Add(ts);

                context.Response.Cache.SetCacheability(HttpCacheability.Public);
                context.Response.Cache.SetExpires(expDate);
                context.Response.Cache.SetMaxAge(ts);//cdn 缓存时间
                context.Response.Cache.SetLastModified(data.CreatedDate);
            }
        }

        void EchoContentEncodingCharset(HttpContext context, string contentType)
        {
            if (!string.IsNullOrEmpty(contentType))
            {
                string sign = "charset=";
                int charsetIndex = contentType.IndexOf(sign);
                int charsetValueIndex = charsetIndex + sign.Length;
                if (charsetIndex > 0 && charsetValueIndex < contentType.Length)
                {
                    string charset = contentType.Substring(charsetValueIndex);

                    context.Response.ContentEncoding = Encoding.GetEncoding(charset);

                    context.Response.Charset = charset;
                }
            }
        }

        //输出浏览器缓存
        bool EchoClientCache(HttpContext context, int cacheSeconds)
        {
            bool browserCacheNotExpired = false;
            string if_modified_since = null;

            try
            {
                if_modified_since = context.Request.Headers["If-Modified-Since"] ?? string.Empty;
            }
            catch (Exception ex)
            {
                if (ErrorLog != null)
                {
                    ErrorLog.Write(context.Request.RawUrl + "\r\n" + ex.ToString());
                }
            }

            if (!string.IsNullOrEmpty(if_modified_since))
            {
                DateTime if_date;
                if (DateTime.TryParse(if_modified_since, out if_date))
                {
                    if (if_date.AddSeconds(cacheSeconds) > DateTime.Now)
                    {
                        browserCacheNotExpired = true;
                    }
                }
            }

            if (browserCacheNotExpired)
            {
                context.Response.StatusCode = (int)System.Net.HttpStatusCode.NotModified;
                context.Response.StatusDescription = "from PageCache";
                return true;
            }

            return false;
        }


        bool BeFilterHeader(string headerKey)
        {
            string headersFilters = this.setting.Config.HeadersFilters;

            if (string.IsNullOrEmpty(headersFilters))
            {
                return false;
            }

            if (headersFilters.IndexOf(',') > 0)
            {
                string[] prefixs = headersFilters.Split(',');
                for (int i = 0; i < prefixs.Length; i++)
                {
                    string prefix = prefixs[i];

                    if (headerKey.IndexOf(headersFilters) >= 0)
                    {
                        return true;
                    }
                }
            }
            else
            {
                return headerKey.IndexOf(headersFilters) >= 0;
            }

            return false;
        }

        int GetStatusCacheSeconds(int statusCode)
        {
            int returnCacheSecond = -1;

            int outStatusCode = 0;
            for (int i = 0; i < this.setting.Config.Expires.Count; i++)
            {
                var expire = this.setting.Config.Expires[i];

                if (!string.IsNullOrEmpty(expire.Code))
                {
                    if (expire.Code.IndexOf("-") > 0)
                    {
                        int rangeSignIndex = expire.Code.IndexOf('-');

                        int maxIndex = rangeSignIndex + 1;

                        if (rangeSignIndex > 0 && maxIndex < expire.Code.Length)
                        {

                            string minString = expire.Code.Substring(0, rangeSignIndex);

                            string maxString = expire.Code.Substring(maxIndex);

                            int min, max;

                            if (int.TryParse(minString, out min) && int.TryParse(maxString, out max))
                            {

                                if (min <= statusCode && statusCode <= max)
                                {
                                    returnCacheSecond = expire.Seconds;
                                    break;
                                }
                            }
                        }

                    }
                    else if (int.TryParse(expire.Code, out outStatusCode))
                    {
                        if (outStatusCode == statusCode)
                        {
                            returnCacheSecond = expire.Seconds;
                            break;
                        }


                    }
                    else if (expire.Code == "*")
                    {
                        returnCacheSecond = expire.Seconds;
                    }
                }

            }

            return returnCacheSecond;
        }


        byte[] GetRequestHeadersData(RequestInfo info)
        {
            Uri uri = new Uri(info.UriString);

            StringBuilder requestStringBuilder = new StringBuilder();

            requestStringBuilder.AppendFormat("{0} {1} HTTP/1.1\r\n", info.HttpMethod, uri.PathAndQuery);


            if (info.HostAddress.Port == 80)
            {
                requestStringBuilder.AppendFormat("Host: {0}\r\n", uri.Host);
            }
            else
            {
                requestStringBuilder.AppendFormat("Host: {0}:{1}\r\n", uri.Host, info.HostAddress.Port);
            }

            //http 1.1 中所有的连接都是 keep-alive
            //requestStringBuilder.AppendFormat("Connection: keep-alive\r\n");
            requestStringBuilder.AppendFormat("Connection: close\r\n");

            foreach (string k in info.Headers.Keys)
            {
                if (!string.IsNullOrEmpty(k))
                {
                    requestStringBuilder.AppendFormat("{0}: {1}\r\n", k, info.Headers[k]);
                }
            }

            requestStringBuilder.Append("\r\n");

            //form data
            if (info.Form.Count > 0)
            {
                string boundary = "----------------------------" + DateTime.Now.Ticks.ToString("x");

                string line = "\r\n--" + boundary + "\r\n";

                string format = "\r\n--" + boundary + "\r\nContent-Disposition: form-data; name=\"{0}\";\r\n\r\n{1}";
                foreach (string key in info.Form.Keys)
                {
                    requestStringBuilder.Append(line);
                    requestStringBuilder.AppendFormat("Content-Disposition: form-data; name=\"{0}\";\r\n\r\n{1}", key, info.Form[key]);
                }

                requestStringBuilder.Append(line);

            }

            string requestString = requestStringBuilder.ToString();

            if (accessLog != null)
            {
                accessLog.Write(requestString);
            }

            Encoding encoding = null;


            try
            {
                encoding = info.Context.Request.ContentEncoding;
                if (encoding == null)
                {
                    encoding = Encoding.UTF8;
                }
            }
            catch (Exception)
            {
                encoding = Encoding.UTF8;
            }

            byte[] rHeadersData = encoding.GetBytes(requestString);

            return rHeadersData;
        }


        Store.StoreData ConvertHttpDataToStoreData(RequestInfo info, Common.HttpData httpdata)
        {

            Store.StoreData data = new Store.StoreData();
            data.CreatedDate = DateTime.Now;
            data.Key = info.Key;
            data.Type = info.Type;

            string data_accept_encoding = httpdata.Headers["Content-Encoding"] ?? string.Empty;

            bool echoGZip = IsClientProvidedGZip(info.Context);

            if (httpdata.BodyData != null && httpdata.ContentLength > 0)
            {
                if (data_accept_encoding.IndexOf("gzip", StringComparison.OrdinalIgnoreCase) >= 0)
                {
                    if (echoGZip)
                    {
                        data.BodyData = httpdata.BodyData;
                    }
                    else
                    {
                        data.BodyData = Common.GZip.GZipDecompress(httpdata.BodyData);
                    }
                }
                else
                {
                    if (echoGZip)
                    {
                        data.BodyData = Common.GZip.GZipCompress(httpdata.BodyData);
                    }
                    else
                    {
                        data.BodyData = httpdata.BodyData;
                    }
                }
            }
            else
            {
                data.BodyData = new byte[0];
            }




            if (httpdata.Headers.AllKeys.Contains("Server"))
            {
                httpdata.Headers.Remove("Server");
            }

            if (httpdata.Headers.AllKeys.Contains("Connection"))
            {
                httpdata.Headers.Remove("Connection");
            }

            if (httpdata.Headers.AllKeys.Contains("Content-Length"))
            {
                httpdata.Headers.Remove("Content-Length");
            }

            if (httpdata.Headers.AllKeys.Contains("Date"))
            {
                httpdata.Headers.Remove("Date");
            }

            if (echoGZip)
            {
                httpdata.Headers["Content-Encoding"] = "gzip";
            }

            StringBuilder headers = new StringBuilder();
            headers.Append(httpdata.Scheme);
            headers.Append(" ");
            headers.Append(httpdata.StatusCode.ToString());
            headers.Append(" ");
            headers.Append(httpdata.StatusDescription);
            headers.Append("\r\n");

            foreach (string k in httpdata.Headers.Keys)
            {

                if (BeFilterHeader(k))
                {
                    continue;
                }

                string v = httpdata.Headers[k];
                headers.Append(k);
                headers.Append(": ");
                headers.Append(v);
                headers.Append("\r\n");
            }

            byte[] headersData = Encoding.ASCII.GetBytes(headers.ToString());

            int statusCacheSeconds = GetStatusCacheSeconds(httpdata.StatusCode);

            data.HeadersData = headersData;

            //设置了自定义缓存时间，并且状态值为200

            //正确的状态值
            if (httpdata.StatusCode >= 100 && httpdata.StatusCode < 400)
            {
                int cacheSeconds = info.Rule.ConfigRule.CacheSeconds;

                if (cacheSeconds <= 0)
                {
                    cacheSeconds = statusCacheSeconds;
                }

                if (cacheSeconds > 0)
                {
                    data.ExpiresAbsolute = data.CreatedDate.AddSeconds(cacheSeconds);

                    data.Seconds = cacheSeconds;

                }
                else
                {
                    data.ExpiresAbsolute = data.CreatedDate;
                }
            }
            else
            {
                if (statusCacheSeconds > 0)
                {
                    data.ExpiresAbsolute = data.CreatedDate.AddSeconds(statusCacheSeconds);
                    data.Seconds = statusCacheSeconds;
                }
            }

            return data;
        }
    }
}
