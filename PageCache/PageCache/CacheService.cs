using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;

namespace PageCache
{
    public class CacheService
    {
        Setting.Setting setting;

        Store.MemoryDataList memoryDataList = null;

        Store.LastReadDataList lastReadDataList = null;

        Store.StoreDataList storeDataList = null;

        RequestQueue requestQueue = null;

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


        public CacheService(Setting.Setting setting, CacheModule module)
        {
            this.setting = setting;

            this.module = module;

            var config = setting.Config;

            this.memoryDataList = new Store.MemoryDataList(config.MemoryRule.Capacity, config.MemoryRule.ClearSeconds, config.MemoryRule.RemoveSeconds);

            this.lastReadDataList = new Store.LastReadDataList(config.StoreBufferSize);

            this.storeDataList = new Store.StoreDataList(config.StoreBufferSize);



            this.requestQueue = new RequestQueue();

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


        public void ReloadSetting()
        {
            if (this.module != null)
            {
                this.module.InitSetting();
            }
        }


        public void Process(HttpContext context)
        {
            var rule = setting.Rules.Get(context);

            if (rule != null)
            {
                if (EchoClientCache(context, rule.ConfigRule.CacheSeconds))
                {
                    context.ApplicationInstance.CompleteRequest();
                    return;
                }

                context.Response.AddHeader("PageCache", "Powered by https://github.com/me15000");

                var info = RequestInfo.Create(context, rule);

                if (info != null)
                {
                    requestQueue.In(info);

                    if (accessLog != null)
                    {
                        accessLog.Write(info.ToString());
                    }

                    if (!EchoData(info))
                    {
                        context.Response.Write("The system is busy now. Please try later.");

                        if (errorLog != null)
                        {
                            errorLog.Write("The system is busy now. Please try later.");
                        }
                    }

                    context.ApplicationInstance.CompleteRequest();
                    requestQueue.Out(info);
                }
            }
        }

        bool EchoData(RequestInfo info)
        {

            Store.StoreData olddata = null;
            Store.StoreData data = null;
            //强制刷新缓存
            bool hasRefreshKey = info.Context.Request.RawUrl.IndexOf(setting.Config.RefreshKey) >= 0
                                    || info.Context.Request.Headers.AllKeys.Contains(setting.Config.RefreshKey);

            //没有强制刷新的时候 从缓存读取
            #region 从缓存读取
            if (!hasRefreshKey)
            {
                //尝试从内存中读缓存

                if (info.Rule.ConfigRule.MemoryEnable)
                {
                    data = memoryDataList.Get(info.Type, info.Key);


                    if (data != null)
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



                //尝试从最后的数据列中读取缓存

                data = lastReadDataList.Get(info.Type, info.Key);

                if (data != null)
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


                //尝试从StoreDataList 中读取缓存

                data = storeDataList.Get(info.Type, info.Key);

                if (data != null)
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


                //Store
                if (info.Store != null)
                {
                    data = info.Store.GetData(info.Type, info.Key);

                    if (data != null)
                    {
                        olddata = data;


                        lastReadDataList.Add(data);
                        //如果启用了内存并且达到并发数量时,使用内存缓存
                        if (info.Rule.ConfigRule.MemoryEnable)
                        {
                            int n = requestQueue.GetCount(info);

                            if (n >= setting.Config.MemoryRule.QueueCount)
                            {
                                memoryDataList.Add(data);
                            }
                        }


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
                        else
                        {
                            //info.Store.Delete(info.Type, info.Key);
                        }
                    }

                }
                else
                {
                    if (errorLog != null)
                    {
                        errorLog.Write("store is null");
                    }
                }
            }

            #endregion

            Store.StoreData outdata = null;

            if (TryCreateData(info, olddata, out outdata))
            {

                if (info.Store != null)
                {
                    info.Store.Delete(info.Type, info.Key);
                }


                this.lastReadDataList.Delete(info.Type, info.Key);

                this.memoryDataList.Delete(info.Type, info.Key);


                if (accessLog != null)
                {
                    accessLog.Write("TryCreateData success");
                }
            }


            if (outdata != null)
            {
                if (EchoData(info.Context, outdata))
                {
                    return true;
                }
            }

            return false;
        }


        Hashtable creatingDataList = new Hashtable(100);

        //Dictionary<string, Store.StoreData> creatingDataList = new Dictionary<string, Store.StoreData>(100);

        bool TryCreateData(RequestInfo info, Store.StoreData olddata, out Store.StoreData outdata)
        {
            outdata = null;

            bool createResult = false;

            string creatingKey = info.Key + ":" + info.Type;

            if (creatingDataList.ContainsKey(creatingKey))
            {
                object data = creatingDataList[creatingKey];

                if (data != null)
                {
                    outdata = (Store.StoreData)data;
                }
                else
                {
                    outdata = olddata;
                }

                return false;
            }

            creatingDataList[creatingKey] = olddata;


            Store.StoreData newdata = CreateData(info);

            if (newdata != null)
            {
                outdata = newdata;

                lastReadDataList.Add(newdata);

                if (info.Rule.ConfigRule.MemoryEnable)
                {
                    if (memoryDataList.Get(info.Type, info.Key) != null)
                    {
                        memoryDataList.Add(newdata);
                    }
                }

                createResult = true;
            }
            else
            {
                outdata = olddata;
            }

            if (creatingDataList.ContainsKey(creatingKey))
            {
                creatingDataList.Remove(creatingKey);
            }

            return createResult;
        }

        Store.StoreData CreateData(RequestInfo info)
        {
            byte[] rheadersData = GetRequestHeadersData(info);

            try
            {

                //Common.HttpClient httpClient = new Common.HttpClient();

                //httpClient.ReceiveTimeout = this.setting.Config.NetReceiveTimeout;

                //httpClient.SendTimeout = this.setting.Config.NetSendTimeout;                

                //httpClient.ErrorLog = this.errorLog;


                Common.HttpData httpdata = httpClient.GetData(info.HostAddress, rheadersData);

                if (httpdata != null)
                {
                    if (httpdata.BodyData != null && httpdata.Headers != null)
                    {
                        var data = ConvertToStoreData(info, httpdata);

                        if (data != null)
                        {
                            if (data.HeadersData != null && data.BodyData != null)
                            {
                                if (data.HeadersData.Length > 0)
                                {
                                    if (data.Seconds > 0 && data.BodyData.Length >= 0)
                                    {
                                        this.storeDataList.Add(info.Store, data);
                                    }

                                    return data;
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {

                if (errorLog != null)
                {

                    StringBuilder exBuilder = new StringBuilder();
                    exBuilder.AppendLine(ex.Message);
                    exBuilder.AppendLine(ex.ToString());

                    exBuilder.AppendLine(RequestInfo.ToString(info));

                    errorLog.Write(exBuilder.ToString());

                }
            }

            return null;
        }



        bool EchoData(HttpContext context, Store.StoreData data)
        {
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

            EchoBrowserCache(context, data);

            var response = context.Response;
            response.BufferOutput = false;

            if (data.BodyData != null)
            {
                using (var memoryStream = new MemoryStream(data.BodyData))
                {
                    using (var outputStream = response.OutputStream)
                    {

                        byte[] buffer = new byte[256];
                        int count;

                        try
                        {
                            while ((count = memoryStream.Read(buffer, 0, buffer.Length)) != 0)
                            {
                                outputStream.Write(buffer, 0, count);

                                if (response.IsClientConnected)
                                {
                                    outputStream.Flush();
                                }
                                else
                                {
                                    break;
                                }

                            }
                        }
                        catch (Exception ex)
                        {
                            /*
                            if (errorLog != null)
                            {
                                errorLog.Write(context.Request.Url.ToString() + "\r\n\r\n" + ex.Message);
                            }
                            */
                        }

                        outputStream.Close();
                        outputStream.Dispose();
                    }

                    memoryStream.Close();
                    memoryStream.Dispose();
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

        void EchoBrowserCache(HttpContext context, Store.StoreDataInfo inf)
        {
            if (inf != null)
            {
                string time = inf.CreatedDate.ToString("r");
                TimeSpan ts = TimeSpan.FromSeconds(inf.Seconds);
                DateTime now = DateTime.Now;
                DateTime expDate = now.Add(ts);

                context.Response.Cache.SetCacheability(HttpCacheability.Public);
                context.Response.Cache.SetExpires(expDate);
                context.Response.Cache.SetMaxAge(ts);//cdn 缓存时间
                context.Response.Cache.SetLastModified(inf.CreatedDate);
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

            string if_modified_since = context.Request.Headers["If-Modified-Since"] ?? string.Empty;

            DateTime if_date;
            if (DateTime.TryParse(if_modified_since, out if_date))
            {
                if (if_date.AddSeconds(cacheSeconds) > DateTime.Now)
                {
                    browserCacheNotExpired = true;
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

            requestStringBuilder.AppendFormat("{0} {1} {2}/1.1\r\n"
                , info.Context.Request.HttpMethod.ToUpper()
                , uri.ToString(), uri.Scheme.ToUpper());


            if (info.HostAddress.Port == 80)
            {
                requestStringBuilder.AppendFormat("Host: {0}\r\n", uri.Host);
            }
            else
            {
                requestStringBuilder.AppendFormat("Host: {0}:{1}\r\n", uri.Host, info.HostAddress.Port);
            }

            requestStringBuilder.AppendFormat("Connection: Close\r\n");

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

            var encoding = info.Context.Request.ContentEncoding;
            if (encoding == null)
            {
                encoding = Encoding.UTF8;
            }

            byte[] rHeadersData = encoding.GetBytes(requestString);

            return rHeadersData;
        }


        Store.StoreData ConvertToStoreData(RequestInfo info, Common.HttpData httpdata)
        {

            Store.StoreData data = new Store.StoreData();
            data.CreatedDate = DateTime.Now;
            data.Key = info.Key;
            data.Type = info.Type;

            string data_accept_encoding = httpdata.Headers["Content-Encoding"] ?? string.Empty;

            bool echoGZip = IsClientProvidedGZip(info.Context);

            if (httpdata.BodyData != null)
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
                if (errorLog != null)
                {
                    errorLog.Write("ConvertToStoreData httpdata.BodyData is null ");
                }
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
