﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Net;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Serialization;

namespace PageCache.Config
{

    public static class ConfigBuilder
    {

        public static bool TryParseConfig(string xmlpath, out Config config)
        {
            config = null;

            bool success = false;


            XmlSerializer serializer = new XmlSerializer(typeof(Config));

            try
            {
                //网络地址
                if (xmlpath.IndexOf("://") > 0)
                {
                    WebClient wc = new WebClient();
                    byte[] data = wc.DownloadData(xmlpath);
                    wc.Dispose();

                    using (MemoryStream stream = new MemoryStream(data))
                    {
                        stream.Seek(0, SeekOrigin.Begin);

                        config = (Config)serializer.Deserialize(stream);

                        success = true;

                        stream.Close();
                        stream.Dispose();
                    }

                }
                else
                {
                    //本地
                    if (File.Exists(xmlpath))
                    {
                        using (var fs = File.OpenRead(xmlpath))
                        {
                            config = (Config)serializer.Deserialize(fs);
                            success = true;

                            fs.Close();
                            fs.Dispose();
                        }
                    }
                }

            }
            catch (Exception ex)
            {

            }


            if (success)
            {

                if (string.IsNullOrEmpty(config.StatusKey))
                {
                    config.StatusKey = "__status__";
                }

                if (config.LastReadBufferSize <= 0)
                {
                    config.LastReadBufferSize = 1000;
                }

                if (config.StoreBufferSize <= 0)
                {
                    config.StoreBufferSize = 100;
                }

                if (config.CCLevel <= 0)
                {

                    config.CCLevel = 5;
                }
            }


            return success;
        }
    }

    [Serializable]
    [XmlRoot("pageCache")]
    public class Config
    {

        #region 属性



        [XmlAttribute("enable"), DefaultSettingValue("false")]
        public bool Enable { get; set; }

        [XmlAttribute("readOnly"), DefaultSettingValue("false")]
        public bool ReadOnly { get; set; }

        [XmlAttribute("typePrefix")]
        public string TypePrefix { get; set; }

        [XmlAttribute("hashHostName"), DefaultSettingValue("false")]
        public bool HashHostName { get; set; }

        [XmlAttribute("refreshKey")]
        public string RefreshKey { get; set; }

        [XmlAttribute("statusKey"), DefaultSettingValue("__status__")]
        public string StatusKey { get; set; }

        [XmlAttribute("errorLogPath")]
        public string ErrorLogPath { get; set; }

        [XmlAttribute("accessLogPath")]
        public string AccessLogPath { get; set; }


        [XmlAttribute("netReceiveTimeout"), DefaultSettingValue("5000")]
        public int NetReceiveTimeout { get; set; }

        [XmlAttribute("netSendTimeout"), DefaultSettingValue("3000")]
        public int NetSendTimeout { get; set; }

        [XmlAttribute("headersFilters"), DefaultSettingValue("X-")]
        public string HeadersFilters { get; set; }


        [XmlAttribute("storeBufferSize"), DefaultSettingValue("100")]
        public int StoreBufferSize { get; set; }

        [XmlAttribute("lastReadBufferSize"), DefaultSettingValue("1000")]
        public int LastReadBufferSize { get; set; }

        /// <summary>
        /// 并发级别
        /// </summary>
        [XmlAttribute("cclevel"), DefaultSettingValue("5")]
        public int CCLevel { get; set; }

        #endregion



        [XmlArray("expires")]
        public List<Expire> Expires { get; set; }


        [XmlArray("stores")]
        public List<Store> Stores { get; set; }


        [XmlArray("hosts")]
        public List<Host> Hosts { get; set; }

        /*
        [XmlElement("memoryRule")]
        public MemoryRule MemoryRule { get; set; }
        */


        [XmlArray("rules")]
        public List<Rule> Rules { get; set; }
    }


    [Serializable]
    [XmlType(TypeName = "expire")]
    public class Expire
    {
        [XmlAttribute("code")]
        public string Code { get; set; }

        [XmlAttribute("seconds")]
        public int Seconds { get; set; }
    }


    [Serializable]
    [XmlType(TypeName = "store")]
    public class Store
    {
        [XmlAttribute("name")]
        public string Name { get; set; }

        [XmlAttribute("weight")]
        public int Weight { get; set; }

        [XmlAttribute("connectionString")]
        public string ConnectionString { get; set; }

        [XmlAttribute("assemblyName")]
        public string AssemblyName { get; set; }

        [XmlAttribute("fullTypeName")]
        public string FullTypeName { get; set; }
    }


    [Serializable]
    [XmlType(TypeName = "host")]
    public class Host
    {
        #region 属性

        [XmlAttribute("name")]
        public string Name { get; set; }

        [XmlAttribute("domain")]
        public string Domain { get; set; }

        [XmlAttribute("scheme"), DefaultSettingValue("http")]
        public string Scheme { get; set; }
        #endregion



        [XmlElement("address")]
        public List<Address> Addresses { get; set; }



    }


    [Serializable]
    [XmlType(TypeName = "address")]
    public class Address
    {

        [XmlAttribute("name")]
        public string Name { get; set; }


        [XmlAttribute("weight")]
        public int Weight { get; set; }


        [XmlAttribute("ip"), DefaultSettingValue("127.0.0.1")]
        public string IP { get; set; }


        [XmlAttribute("port"), DefaultSettingValue("80")]
        public int Port { get; set; }
    }


    /*
    [Serializable]
    public class MemoryRule
    {
        [XmlAttribute("name")]
        public string Name { get; set; }


        [XmlAttribute("removeSeconds")]
        public int RemoveSeconds { get; set; }

        [XmlAttribute("clearSeconds")]
        public int ClearSeconds { get; set; }


        [XmlAttribute("capacity")]
        public int Capacity { get; set; }

        [XmlAttribute("queueCount")]
        public int QueueCount { get; set; }

    }

    */


    [Serializable]
    [XmlType(TypeName = "rule")]
    public class Rule
    {
        [XmlAttribute("name")]
        public string Name { get; set; }

        [XmlAttribute("match")]
        public string Match { get; set; }

        [XmlAttribute("ignoreCase"), DefaultSettingValue("true")]
        public bool IgnoreCase { get; set; }


        [XmlAttribute("skip")]
        public string Skip { get; set; }


        [XmlAttribute("action")]
        public string Action { get; set; }

        [XmlAttribute("host"), DefaultSettingValue("default")]
        public string Host { get; set; }

        [XmlAttribute("cacheSeconds")]
        public int CacheSeconds { get; set; }

        /*
        [XmlAttribute("memoryEnable"), DefaultSettingValue("false")]
        public bool MemoryEnable { get; set; }
        */

        [XmlAttribute("createFirst"), DefaultSettingValue("true")]
        public bool CreateFirst { get; set; }


        [XmlAttribute("storeName")]
        public string StoreName { get; set; }

        [XmlArray("params")]
        public List<Param> Params { get; set; }
        /*
        Regex matchRegex = null;
        public Regex MatchRegex
        {
            get
            {
                if (this.matchRegex == null)
                {
                    if (!string.IsNullOrEmpty(this.Match))
                    {
                        this.matchRegex = new Regex(this.Match, this.IgnoreCase ? RegexOptions.IgnoreCase : RegexOptions.None);
                    }
                }
                return this.matchRegex;
            }
        }*/
    }


    [Serializable]
    [XmlType(TypeName = "param")]
    public class Param
    {
        [XmlAttribute("name")]
        public string Name { get; set; }

        [XmlAttribute("type")]
        public ParamType Type { get; set; }

        [XmlAttribute("pattern")]
        public string Pattern { get; set; }


        [XmlAttribute("ignoreCase"), DefaultSettingValue("true")]
        public bool IgnoreCase { get; set; }


        [XmlAttribute("value")]
        public string Value { get; set; }

        Regex patternRegex = null;
        public Regex PatternRegex
        {
            get
            {
                if (this.patternRegex == null)
                {
                    if (!string.IsNullOrEmpty(this.Pattern))
                    {
                        this.patternRegex = new Regex(this.Pattern, this.IgnoreCase ? RegexOptions.IgnoreCase : RegexOptions.None);
                    }
                }

                return this.patternRegex;
            }
        }

    }


    public enum ParamType
    {
        GET, POST, HEADER
    }







}
