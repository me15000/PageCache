using System;
using System.Configuration;
using System.IO;

namespace PageCache.Common
{
    public class Log
    {
        string logPath = null;
        public Log(string logPath)
        {
            this.logPath = logPath;
        }

        public void Write(string message)
        {

            if (!string.IsNullOrEmpty(logPath))
            {
                DateTime now = DateTime.Now;

                string folderPath = logPath + @"\" + now.Year + @"\" + now.Month.ToString("D2") + @"\" + now.Day.ToString("D2") + @"\";

                string filePath = folderPath + now.ToString("yyyy-MM-dd HH-mm-ss") + ".log";

                try
                {
                    if (!Directory.Exists(folderPath))
                    {
                        Directory.CreateDirectory(folderPath);
                    }

                    if (File.Exists(filePath))
                    {
                        using (StreamWriter sw = File.AppendText(filePath))
                        {

                            sw.WriteLine("\r\n\r\n----------" + now.ToString() + "\r\n");
                            //sw.WriteLine(System.Web.HttpContext.Current.Request.Url.ToString());

                            sw.Write(message);
                            sw.WriteLine("\r\n\r\n----------end\r\n");
                            sw.Close();
                            sw.Dispose();
                        }
                    }
                    else
                    {
                        using (StreamWriter sw = File.CreateText(filePath))
                        {


                            sw.WriteLine("\r\n\r\n----------" + now.ToString() + "\r\n");
                            //sw.WriteLine(System.Web.HttpContext.Current.Request.Url.ToString());

                            sw.Write(message);
                            sw.WriteLine("\r\n\r\n----------end\r\n");
                            sw.Close();
                            sw.Dispose();
                        }
                    }
                }
                catch
                {

                }
            }
        }

    }
}
