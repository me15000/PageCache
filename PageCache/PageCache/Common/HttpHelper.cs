using System;
using System.Collections.Specialized;
using System.Linq;
using System.Net;
using System.Net.Sockets;
using System.Text;

namespace PageCache.Common
{

    public class HttpDataInfo
    {

        public HttpDataInfo()
        {
            headers = new NameValueCollection();
        }

        public int StatusCode { get; set; }
        public string StatusDescription { get; set; }
        public string Scheme { get; set; }


        NameValueCollection headers;
        public NameValueCollection Headers
        {
            get { return headers; }
        }

        public string HeadersStrings { get; set; }
    }

    public class HttpData : HttpDataInfo
    {
        public byte[] BodyData { get; set; }
    }



    public class HttpHelper
    {
        static Encoding ASCII = Encoding.ASCII;

        public Log Log
        {
            get;
            set;
        }



        //ReceiveTimeout SendTimeout
        int receiveTimeout = 10000;

        /// <summary>
        /// 接收超时默认10秒
        /// </summary>
        public int ReceiveTimeout
        {
            get { return receiveTimeout; }
            set { receiveTimeout = value; }
        }

        int sendTimeout = 3000;

        /// <summary>
        /// 发送超时默认3秒
        /// </summary>
        public int SendTimeout
        {
            get { return sendTimeout; }
            set { sendTimeout = value; }
        }

        const string HEADER_END_SIGN = "\r\n\r\n";



        /// <summary>
        /// 根据接收到的Http Headers 字符串解析为 HttpHeadersStatus
        /// </summary>
        /// <param name="headersStringText"></param>
        /// <returns></returns>
        public static HttpDataInfo GetHeaders(string headersStringText)
        {


            int splitIndex = headersStringText.IndexOf(HEADER_END_SIGN);

            if (splitIndex > 0)
            {
                headersStringText = headersStringText.Substring(0, splitIndex);
            }

            string headersSplitSign = "\r\n";

            string[] headersStrings = headersStringText.Split(new string[] { headersSplitSign }, StringSplitOptions.None);

            if (headersStrings.Length > 0)
            {
                HttpDataInfo hhs = new HttpDataInfo();

                hhs.HeadersStrings = headersStringText;



                //hhs.Headers = new Dictionary<string, string>();

                string firstLine = headersStrings[0].Trim();

                if (!string.IsNullOrEmpty(firstLine))
                {
                    int inx_space1 = firstLine.IndexOf(' ');

                    int inx_space2 = firstLine.IndexOf(' ', inx_space1 + 1);

                    if (inx_space2 > inx_space1 && inx_space1 > 0)
                    {
                        string codeString = firstLine.Substring(inx_space1 + 1, inx_space2 - inx_space1);

                        int code = 0;

                        if (int.TryParse(codeString, out code))
                        {
                            hhs.StatusCode = code;
                        }

                        hhs.Scheme = firstLine.Substring(0, inx_space1);

                        hhs.StatusDescription = firstLine.Substring(inx_space2 + 1);
                    }
                }


                string headerSplitSign = ": ";

                if (headersStrings.Length > 1)
                {
                    for (int i = 1; i < headersStrings.Length; i++)
                    {
                        string header = headersStrings[i].Trim();

                        //01234567890123456789
                        //key: value\r\n

                        int signIndex = header.IndexOf(headerSplitSign);

                        int valueIndex = signIndex + headerSplitSign.Length;

                        if (signIndex > 0 && valueIndex < header.Length)
                        {
                            string key = header.Substring(0, signIndex);
                            string value = header.Substring(valueIndex);

                            //if (!BeFilterHeader(key))
                            //{
                            hhs.Headers[key] = value;
                            //}

                        }

                    }
                }


                return hhs;
            }

            return null;
        }














        public HttpDataInfo GetHeadersByHEAD(IPEndPoint address, string uri, params string[] httpHeadersLines)
        {
            return GetHeadersByHEAD(address, new Uri(uri), httpHeadersLines);
        }


        public HttpDataInfo GetHeadersByHEAD(IPEndPoint address, Uri uri, params string[] httpHeadersLines)
        {
            StringBuilder requestStringBuilder = new StringBuilder();

            requestStringBuilder.AppendFormat("{0} {1} {2}/1.1\r\n", "HEAD", uri.ToString(), uri.Scheme.ToUpper());

            if (address.Port == 80)
            {
                requestStringBuilder.AppendFormat("Host: {0}\r\n", uri.Host);
            }
            else
            {
                requestStringBuilder.AppendFormat("Host: {0}:{1}\r\n", uri.Host, address.Port);
            }



            for (int i = 0; i < httpHeadersLines.Length; i++)
            {
                requestStringBuilder.AppendLine(httpHeadersLines[i]);
            }

            requestStringBuilder.Append("\r\n");

            string requestString = requestStringBuilder.ToString();

            byte[] rHeadersData = ASCII.GetBytes(requestString);



            int bufferSize = 64;

            StringBuilder headersStringBuilder = new StringBuilder();
            Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);


            try
            {

                socket.Connect(address.Address, address.Port);


                socket.ReceiveTimeout = receiveTimeout;
                socket.SendTimeout = sendTimeout;

                socket.Send(rHeadersData);




                while (true)
                {



                    byte[] buffer = new byte[bufferSize];
                    int receiveCount = socket.Receive(buffer, buffer.Length, SocketFlags.None);




                    if (receiveCount > 0)
                    {
                        headersStringBuilder.Append(ASCII.GetString(buffer));
                    }

                    if (receiveCount == 0)
                    {
                        break;
                    }
                }

                socket.Shutdown(SocketShutdown.Both);
                socket.Disconnect(true);

                return GetHeaders(headersStringBuilder.ToString());

            }
            catch (Exception ex)
            {

                if (socket != null)
                {
                    if (socket.Connected)
                    {
                        socket.Close();
                    }

                    socket.Dispose();
                }

                if (this.Log != null)
                {
                    this.Log.Write("HttpHelper.GetHeadersByHEAD : " + ex.Message);
                }

            }

            return null;
        }








        public HttpDataInfo GetHeaders(IPEndPoint address, byte[] headersData)
        {

            int bufferSize = 16;

            StringBuilder headersStringBuilder = new StringBuilder();

            Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

            try
            {

                socket.Connect(address.Address, address.Port);


                socket.ReceiveTimeout = receiveTimeout;
                socket.SendTimeout = sendTimeout;
                socket.Send(headersData);

                int HEADER_END_SIGN_INDEX = -1;

                byte[] buffer = new byte[bufferSize];

                byte[] bufferDouble = new byte[bufferSize * 2];


                while (true)
                {
                    int receiveCount = socket.Receive(buffer, bufferSize, SocketFlags.None);

                    headersStringBuilder.Append(ASCII.GetString(buffer));

                    for (int i = 0; i < bufferSize; i++)
                    {
                        bufferDouble[i] = bufferDouble[bufferSize + i];
                    }

                    for (int i = 0; i < receiveCount; i++)
                    {
                        bufferDouble[bufferSize + i] = buffer[i];
                    }

                    if (bufferSize > receiveCount)
                    {
                        for (int i = receiveCount; i < bufferSize; i++)
                        {
                            bufferDouble[bufferSize + i] = 0;
                        }
                    }

                    HEADER_END_SIGN_INDEX = ASCII.GetString(bufferDouble).IndexOf(HEADER_END_SIGN);

                    if (HEADER_END_SIGN_INDEX >= 0)
                    {
                        break;
                    }

                    if (receiveCount == 0)
                    {
                        break;
                    }
                }

                socket.Shutdown(SocketShutdown.Both);
                socket.Disconnect(true);

                string headersStringText = headersStringBuilder.ToString();

                return GetHeaders(headersStringText);

            }
            catch (Exception ex)
            {
                if (socket != null)
                {
                    if (socket.Connected)
                    {
                        socket.Close();
                    }

                    socket.Dispose();
                }
                if (this.Log != null)
                {
                    this.Log.Write("HttpHelper.GetHeaders : " + ex.Message);
                }
            }


            return null;



        }






        //无法解析 Transfer-Encoding chunked 分段 
        public HttpData GetHttpData(IPEndPoint address, byte[] headersData)
        {
            int bufferSize = 16;

            Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

            try
            {

                socket.Connect(address.Address, address.Port);


                socket.ReceiveTimeout = receiveTimeout;
                socket.SendTimeout = sendTimeout;
                socket.Send(headersData);

                StringBuilder headersStringBuilder = new StringBuilder();

                byte[] buffer = new byte[bufferSize];

                byte[] bufferDouble = new byte[bufferSize * 2];

                int HEADER_END_SIGN_INDEX = -1;


                while (true)
                {
                    int receiveCount = socket.Receive(buffer, bufferSize, SocketFlags.None);

                    headersStringBuilder.Append(ASCII.GetString(buffer));

                    for (int i = 0; i < bufferSize; i++)
                    {
                        bufferDouble[i] = bufferDouble[bufferSize + i];
                    }

                    for (int i = 0; i < receiveCount; i++)
                    {
                        bufferDouble[bufferSize + i] = buffer[i];
                    }

                    if (bufferSize > receiveCount)
                    {
                        for (int i = receiveCount; i < bufferSize; i++)
                        {
                            bufferDouble[bufferSize + i] = 0;
                        }
                    }

                    HEADER_END_SIGN_INDEX = ASCII.GetString(bufferDouble).IndexOf(HEADER_END_SIGN);

                    if (HEADER_END_SIGN_INDEX >= 0)
                    {
                        break;
                    }

                    if (receiveCount == 0)
                    {
                        break;
                    }
                }

                string headersStringText = headersStringBuilder.ToString();

                HttpData info = new HttpData();

                HttpDataInfo hhs = GetHeaders(headersStringText);

                info = (HttpData)hhs;


                if (hhs == null)
                {
                    throw new Exception("ERROR : headers is null");
                }


                if (info.Headers.AllKeys.Contains("Content-Length"))
                {
                    int contentLength = int.Parse(info.Headers["Content-Length"]);

                    byte[] bodyData = new byte[contentLength];

                    //获取body data

                    int nowContentLength = 0;

                    while (true)
                    {
                        int receiveCount = socket.Receive(buffer, bufferSize, SocketFlags.None);

                        if (receiveCount > 0)
                        {
                            for (int i = 0; i < receiveCount; i++)
                            {
                                bodyData[nowContentLength + i] = buffer[i];
                            }
                        }

                        nowContentLength += receiveCount;

                        if (receiveCount == 0)
                        {
                            break;
                        }
                    }


                    //拼上header 多截取的字符
                    if (nowContentLength < contentLength)
                    {
                        int len = contentLength - nowContentLength;

                        if (len < bufferSize)
                        {
                            for (int i = 0; i < nowContentLength; i++)
                            {
                                bodyData[contentLength - i - 1] = bodyData[contentLength - i - 1 - len];
                            }

                            for (int i = 0; i < len; i++)
                            {
                                bodyData[i] = bufferDouble[bufferSize * 2 - len + i];
                            }
                        }


                    }

                    info.BodyData = bodyData;



                }
                else if (info.Headers["Transfer-Encoding"] == "chunked")
                {

                    //后期完善 使用自制



                    //if (HEADER_END_SIGN_INDEX >= 0)
                    //{

                    //}

                    throw new Exception("提示：暂不支持无Content-Length头的页面！");
                }

                socket.Shutdown(SocketShutdown.Both);
                socket.Disconnect(true);

                return info;
            }
            catch (Exception ex)
            {
                if (socket != null)
                {
                    if (socket.Connected)
                    {
                        socket.Close();
                    }

                    socket.Dispose();
                }
                if (this.Log != null)
                {
                    this.Log.Write("HttpHelper.GetHttpData : " + ex.Message);
                }
            }

            return null;
        }







    }
}