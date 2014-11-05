using System;
using System.Collections.Specialized;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace PageCache
{
    public class RequestInfo
    {
        public HttpContext Context
        {
            get;
            set;
        }


        string uriString;
        public string UriString
        {
            get { return this.uriString; }
            set { this.uriString = value; }
        }


        NameValueCollection queryString = new NameValueCollection();
        public NameValueCollection QueryString
        {
            get { return this.queryString; }
            set { this.queryString = value; }
        }

        NameValueCollection form = new NameValueCollection();
        public NameValueCollection Form
        {
            get { return this.form; }
            set { this.form = value; }
        }

        NameValueCollection headers = new NameValueCollection();
        public NameValueCollection Headers
        {
            get { return this.headers; }
            set { this.headers = value; }
        }


        public string Type { get; set; }

        public string Key { get; set; }

        public Setting.Rule Rule
        {
            get;
            set;
        }


        public Config.Host Host
        {
            get;
            set;
        }

        public IPEndPoint HostAddress
        {
            get;
            set;
        }

        public Store.IStore Store
        {
            get;
            set;
        }


        public override string ToString()
        {
            return ToString(this);
        }


        public static RequestInfo Create(HttpContext context, Setting.Rule rule)
        {
            RequestInfo info = new RequestInfo();

            info.Context = context;

            info.Rule = rule;

            info.Host = rule.Host.ConfigHost;

            info.HostAddress = rule.Host.GetHostAddress();


            string ae = context.Request.Headers.Get("Accept-Encoding") ?? string.Empty;

            info.Headers["Accept-Encoding"] = ae.IndexOf("gzip") >= 0 ? "gzip" : string.Empty;


            info.Store = rule.GetStore();


            if (rule.ConfigRule.Params != null)
            {

                if (rule.ConfigRule.Params.Count > 0)
                {
                    if (rule.ConfigRule.Params.Exists(w => w.Name.Trim() == "*" && w.Type == Config.ParamType.GET))
                    {
                        info.QueryString = context.Request.QueryString;
                    }

                    if (rule.ConfigRule.Params.Exists(w => w.Name.Trim() == "*" && w.Type == Config.ParamType.POST))
                    {
                        info.Form = context.Request.Form;
                    }

                    if (rule.ConfigRule.Params.Exists(w => w.Name.Trim() == "*" && w.Type == Config.ParamType.HEADER))
                    {
                        info.Headers = context.Request.Headers;
                    }




                    for (int i = 0; i < rule.ConfigRule.Params.Count; i++)
                    {
                        var param = rule.ConfigRule.Params[i];
                        switch (param.Type)
                        {
                            case Config.ParamType.GET:

                                if (!string.IsNullOrEmpty(param.Value))
                                {
                                    info.QueryString[param.Name] = GetMatchUrlValue(rule, context, param.Value) ?? string.Empty;
                                }
                                else
                                {
                                    string v = context.Request.QueryString[param.Name];
                                    if (v != null)
                                    {
                                        info.QueryString[param.Name] = GetParamRegexValue(param.PatternRegex, v);
                                    }

                                }


                                break;

                            case Config.ParamType.POST:

                                if (!string.IsNullOrEmpty(param.Value))
                                {
                                    info.Form[param.Name] = GetMatchUrlValue(rule, context, param.Value) ?? string.Empty;
                                }
                                else
                                {
                                    string v = context.Request.Form[param.Name];

                                    if (v != null)
                                    {
                                        info.Form[param.Name] = GetParamRegexValue(param.PatternRegex, v);
                                    }

                                }


                                break;

                            case Config.ParamType.HEADER:

                                if (!string.IsNullOrEmpty(param.Value))
                                {
                                    info.Headers[param.Name] = GetMatchUrlValue(rule, context, param.Value);
                                }
                                else
                                {
                                    string v = context.Request.Headers[param.Name];
                                    if (v != null)
                                    {
                                        info.Headers[param.Name] = GetParamRegexValue(param.PatternRegex, v);
                                    }

                                }

                                break;
                        }
                    }
                }
            }


            var host = info.Host;
            var address = info.HostAddress;

            string scheme = null;

            string domain = null;

            if (!string.IsNullOrWhiteSpace(host.Scheme))
            {
                scheme = host.Scheme;
            }

            if (!string.IsNullOrWhiteSpace(host.Domain))
            {
                domain = host.Domain;
            }


            Uri uri = context.Request.Url;

            if (string.IsNullOrWhiteSpace(scheme))
            {
                scheme = uri.Scheme;
            }

            if (string.IsNullOrWhiteSpace(domain))
            {
                domain = uri.Host;
            }


            StringBuilder genkeyUri = new StringBuilder();

            genkeyUri.Append(uri.Scheme);
            genkeyUri.Append("://");
            genkeyUri.Append(uri.Host);
            genkeyUri.Append(":" + uri.Port);
            genkeyUri.Append(uri.AbsolutePath);

            StringBuilder uriStringBuilder = new StringBuilder(scheme);
            uriStringBuilder.Append("://");
            uriStringBuilder.Append(domain);

            if (address.Port > 0 && address.Port != 80)
            {
                uriStringBuilder.Append(":");
                uriStringBuilder.Append(address.Port);
            }


            string action = rule.ConfigRule.Action;
            if (!string.IsNullOrEmpty(action))
            {
                var m = rule.MatchRegex.Match(uri.AbsolutePath);
                if (m.Success)
                {
                    if (m.Groups.Count > 0)
                    {
                        for (int i = 0; i < m.Groups.Count; i++)
                        {
                            action = action.Replace("$" + i, m.Groups[i].Value);
                        }
                    }
                }

                if (action.IndexOf('/') != 0)
                {
                    uriStringBuilder.Append("/");
                }

                uriStringBuilder.Append(action);
            }
            else
            {
                uriStringBuilder.Append(uri.AbsolutePath);
            }

            if (info.QueryString.Count > 0)
            {

                if (action.IndexOf("?") >= 0)
                {
                    uriStringBuilder.Append("&");

                    genkeyUri.Append("&");
                }
                else
                {
                    uriStringBuilder.Append("?");

                    genkeyUri.Append("?");
                }


                bool isfirst = true;

                for (int i = 0; i < info.QueryString.Keys.Count; i++)
                {
                    string key = info.QueryString.Keys[i];

                    string value = info.QueryString[key];


                    if (value != null)
                    {
                        if (!isfirst)
                        {
                            uriStringBuilder.Append("&");
                        }

                        isfirst = false;

                        uriStringBuilder.Append(key);
                        uriStringBuilder.Append("=");

                        uriStringBuilder.Append(HttpUtility.UrlEncode(value));


                        genkeyUri.Append(key);
                        genkeyUri.Append("=");
                        genkeyUri.Append(value);
                    }


                }
            }



            info.UriString = uriStringBuilder.ToString();


            info.Key = GenKey(genkeyUri.ToString(), info.Form, info.Headers);

            info.Type = rule.Setting.Config.TypePrefix + rule.ConfigRule.Name;

            return info;
        }

        public static string ToString(RequestInfo info)
        {

            StringBuilder sb = new StringBuilder();


            sb.AppendLine(info.HostAddress.ToString());

            sb.Append("UriString:");
            sb.Append(info.UriString);
            sb.Append("\r\n");


            sb.AppendLine(info.Key);
            sb.AppendLine(info.Type);
            sb.AppendLine(info.Context.Request.Url.ToString());

            sb.AppendLine("[QueryString]");

            for (int i = 0; i < info.QueryString.Keys.Count; i++)
            {
                string k = info.QueryString.Keys[i];

                sb.Append(k);
                sb.Append(":\t\t");
                sb.Append(info.QueryString[k]);
                sb.Append("\r\n");
            }

            sb.Append("\r\n");

            sb.AppendLine("[Form]");
            for (int i = 0; i < info.Form.Keys.Count; i++)
            {
                string k = info.Form.Keys[i];

                sb.Append(k);
                sb.Append(":\t\t");
                sb.Append(info.Form[k]);
                sb.Append("\r\n");
            }

            sb.Append("\r\n");

            sb.AppendLine("[Headers]");

            for (int i = 0; i < info.Headers.Keys.Count; i++)
            {
                string k = info.Headers.Keys[i];
                sb.Append(k);
                sb.Append(":\t\t");
                sb.Append(info.Headers[k]);
                sb.Append("\r\n");
            }


            return sb.ToString();
        }

        static string GenKey(string uri, NameValueCollection form, NameValueCollection headers)
        {
            StringBuilder keyStrings = new StringBuilder(uri);

            keyStrings.Append("&");

            for (int i = 0; i < form.Keys.Count; i++)
            {
                string k = form.Keys[i];
                if (i > 0)
                {
                    keyStrings.Append("&");
                }
                keyStrings.Append(k);
                keyStrings.Append("=");
                keyStrings.Append(form[k]);
            }

            for (int i = 0; i < headers.Keys.Count; i++)
            {
                string k = headers.Keys[i];
                if (i > 0)
                {
                    keyStrings.Append("&");
                }
                keyStrings.Append(k);
                keyStrings.Append("=");
                keyStrings.Append(headers[k]);

            }

            return MD5(keyStrings.ToString());
        }

        static string MD5(string str)
        {
            System.Security.Cryptography.MD5CryptoServiceProvider md = new System.Security.Cryptography.MD5CryptoServiceProvider();
            byte[] value, hash;
            value = System.Text.Encoding.UTF8.GetBytes(str);
            hash = md.ComputeHash(value);
            md.Clear();

            StringBuilder temp = new StringBuilder();

            for (int i = 0, len = hash.Length; i < len; i++)
            {
                temp.Append(hash[i].ToString("x").PadLeft(2, '0'));
            }

            return temp.ToString().ToLower();
        }

        static string GetParamRegexValue(Regex regex, string val)
        {
            string v = val;
            if (regex != null && !string.IsNullOrEmpty(v))
            {

                var m = regex.Match(v);

                if (m.Success)
                {
                    if (m.Groups.Count > 0)
                    {
                        var g = m.Groups["val"];
                        if (g != null && !string.IsNullOrEmpty(g.Value))
                        {
                            v = g.Value;
                        }
                        else
                        {
                            v = m.Groups[0].Value;
                        }
                    }
                    else
                    {
                        v = m.Value;
                    }
                }
                else
                {
                    v = string.Empty;
                }
            }

            return v;
        }

        static string GetMatchUrlValue(Setting.Rule rule, HttpContext context, string paramValue)
        {
            string v = paramValue;

            if (!string.IsNullOrEmpty(v))
            {
                Uri uri = context.Request.Url;
                var m = rule.MatchRegex.Match(uri.AbsolutePath);
                if (m.Success)
                {
                    for (int j = 0; j < m.Groups.Count; j++)
                    {
                        v = v.Replace("$" + j, m.Groups[j].Value);
                    }
                }
            }
            return v;

        }
    }
}
