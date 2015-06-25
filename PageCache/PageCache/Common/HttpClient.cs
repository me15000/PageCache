using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.IO;
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
            set { headers = value; }
        }

        public string HeadersStrings { get; set; }

        public int ContentLength { get; set; }
    }

    public class HttpData : HttpDataInfo
    {
        public byte[] BodyData { get; set; }
    }


    public class HttpClient
    {

        public enum HTTPMethod
        {
            GET,
            POST,
            HEAD
        };

        const string CONTENT_LENGTH_HEADER = "Content-Length";
        const int HEADER_RECEIVE_SIZE = 1;
        const string HEADER_END_SIGN = "\r\n\r\n";
        const string HEADER_SINGLE_END_SIGN = "\r\n";
        const int NONE_DATA_LENGTH = -1;

        const int Receive_Buffer_Size = 1024 * 8;

        const string TRANSFER_ENCODING = "chunked";

        public string ReceiveHeaderString(Socket socket)
        {

            StringBuilder header = new StringBuilder();

            string headerSting = null;

            while (true)
            {
                byte[] data = new byte[HEADER_RECEIVE_SIZE];

                int receiveCount = socket.Receive(data, HEADER_RECEIVE_SIZE, SocketFlags.None);

                if (receiveCount > 0)
                {
                    char c = (char)data[0];

                    header.Append(c);

                    headerSting = header.ToString();

                    if (headerSting.IndexOf(HEADER_END_SIGN) >= 0)
                    {
                        break;
                    }
                }
                else
                {
                    break;
                }
            }

            return headerSting;
        }

        const int BUFFER_SIZE = 16;

        public byte[] ReceiveBodyData(Socket socket, int contentLength)
        {

            int nowContentLength = 0;

            byte[] data = new byte[contentLength];

            if (contentLength > 0)
            {
                int zero_times = 0;
                int zero_max = 3;

                try
                {
                    while (true)
                    {
                        byte[] buffer = new byte[BUFFER_SIZE];

                        int receiveCount = socket.Receive(buffer, BUFFER_SIZE, SocketFlags.None);

                        if (receiveCount > 0)
                        {
                            zero_times = 0;

                            Array.Copy(buffer, 0, data, nowContentLength, receiveCount);

                            nowContentLength += receiveCount;
                        }

                        if (nowContentLength >= contentLength)
                        {
                            break;
                        }
                        else
                        {
                            if (receiveCount == 0)
                            {
                                zero_times++;
                                if (zero_times >= zero_max)
                                {
                                    break;
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception("ReceiveBodyData : " + ex.Message);
                }
            }

            if (nowContentLength == contentLength && nowContentLength >= 0)
            {
                return data;
            }
            else
            {
                throw new Exception("ReceiveBodyData : faild ");
            }
        }


        public byte[] ReceiveBodyData(Socket socket)
        {

            int nowContentLength = 0;

            int zero_times = 0;
            int zero_max = 3;

            byte[] data = null;

            List<byte> list = new List<byte>();


            while (true)
            {


                byte[] buffer = new byte[BUFFER_SIZE];


                int receiveCount = socket.Receive(buffer, BUFFER_SIZE, SocketFlags.None);


                if (receiveCount > 0)
                {
                    zero_times = 0;

                    for (int i = 0; i < receiveCount; i++)
                    {
                        list.Add(buffer[i]);
                    }

                    nowContentLength += receiveCount;
                }


                if (receiveCount == 0)
                {
                    zero_times++;
                    if (zero_times >= zero_max)
                    {
                        break;
                    }
                }
            }

            if (nowContentLength > 0)
            {
                data = list.ToArray();
            }


            return data;

        }

        const string CHUNKED_END_SIGN = "\r\n";

        public byte[] ParseChunkedData(byte[] data)
        {
            int endPosition = data.Length;

            List<byte> list = new List<byte>();


            using (MemoryStream stream = new MemoryStream(data))
            {
                using (BinaryReader reader = new BinaryReader(stream))
                {
                    StringBuilder line = new StringBuilder();

                    while (stream.Position < endPosition)
                    {
                        line.Append(reader.ReadChar());

                        string lineString = line.ToString();

                        int inx = lineString.IndexOf(CHUNKED_END_SIGN);

                        if (inx > 0)
                        {
                            int count = Convert.ToInt32(lineString.Substring(0, inx), 16);

                            if (count > 0)
                            {
                                byte[] bytes = reader.ReadBytes(count);
                                if (bytes != null)
                                {
                                    list.AddRange(bytes);
                                }
                            }

                            line.Clear();
                        }
                        else if (inx == 0)
                        {
                            break;
                        }
                    }

                    reader.Close();
                    reader.Dispose();
                }

                stream.Close();
                stream.Dispose();
            }


            return list.ToArray();
        }

        public static HttpDataInfo ParseHeaderString(string headersStringText)
        {

            string[] headersStrings = headersStringText.Split(new string[] { HEADER_SINGLE_END_SIGN }, StringSplitOptions.None);

            if (headersStrings.Length > 0)
            {
                HttpDataInfo info = new HttpDataInfo();

                info.HeadersStrings = headersStringText;

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
                            info.StatusCode = code;
                        }

                        info.Scheme = firstLine.Substring(0, inx_space1);

                        info.StatusDescription = firstLine.Substring(inx_space2 + 1);
                    }
                }

                string headerSplitSign = ": ";

                if (headersStrings.Length > 1)
                {
                    for (int i = 1; i < headersStrings.Length; i++)
                    {
                        string header = headersStrings[i].Trim();

                        int signIndex = header.IndexOf(headerSplitSign);

                        int valueIndex = signIndex + headerSplitSign.Length;

                        if (signIndex > 0 && valueIndex < header.Length)
                        {
                            string key = header.Substring(0, signIndex);

                            string value = header.Substring(valueIndex);

                            if (key.Equals(CONTENT_LENGTH_HEADER, StringComparison.OrdinalIgnoreCase))
                            {
                                int contentLength = 0;
                                if (int.TryParse(value, out contentLength))
                                {
                                    info.ContentLength = contentLength;
                                }
                                else
                                {
                                    info.ContentLength = NONE_DATA_LENGTH;
                                }
                            }

                            info.Headers[key] = value;
                        }
                    }
                }

                return info;
            }

            return null;
        }

        public HttpData GetData(HTTPMethod metohd, Socket socket)
        {
            string headerString = ReceiveHeaderString(socket);

            HttpDataInfo info = ParseHeaderString(headerString);

            HttpData data = null;

            if (info != null)
            {
                data = new HttpData
                {

                    HeadersStrings = info.HeadersStrings
                    ,
                    Scheme = info.Scheme
                    ,
                    StatusCode = info.StatusCode
                    ,
                    StatusDescription = info.StatusDescription
                    ,
                    Headers = info.Headers
                };

                if (metohd == HTTPMethod.GET || metohd == HTTPMethod.POST)
                {
                    if (info.ContentLength > 0)
                    {
                        data.BodyData = ReceiveBodyData(socket, info.ContentLength);

                        if (data.BodyData == null)
                        {
                            throw new Exception("ContentLength>0 and ReceiveBodyData is null");
                        }

                    }
                    else if (info.ContentLength == NONE_DATA_LENGTH)
                    {
                        string tran = info.Headers["Transfer-Encoding"] ?? string.Empty;

                        if (tran.Equals(TRANSFER_ENCODING, StringComparison.OrdinalIgnoreCase))
                        {
                            byte[] receiveData = ReceiveBodyData(socket);

                            if (receiveData != null)
                            {
                                data.BodyData = ParseChunkedData(receiveData);
                            }
                            else
                            {
                                throw new Exception("Transfer-Encoding is " + TRANSFER_ENCODING + " and ReceiveBodyData is null");
                            }
                        }
                        else
                        {
                            data.BodyData = ReceiveBodyData(socket);
                        }
                    }
                }

                if (data.BodyData != null)
                {
                    data.ContentLength = data.BodyData.Length;
                }
                else
                {
                    data.ContentLength = 0;
                }
            }


            return data;

        }

        int receiveTimeout = 30000;

        /// <summary>
        /// 接收超时默认2秒
        /// </summary>
        public int ReceiveTimeout
        {
            get { return receiveTimeout; }
            set { receiveTimeout = value; }
        }

        int sendTimeout = 30000;

        /// <summary>
        /// 发送超时默认1秒
        /// </summary>
        public int SendTimeout
        {
            get { return sendTimeout; }
            set { sendTimeout = value; }
        }

        public HttpData GetData(HTTPMethod metohd, string host, byte[] headersData)
        {
            return GetData(metohd, host, 80, headersData);
        }

        public Log ErrorLog { get; set; }



        public HttpData GetData(HTTPMethod metohd, string host, int port, byte[] headersData)
        {
            HttpData data = null;

            using (Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp))
            {
                socket.ReceiveBufferSize = Receive_Buffer_Size;
                socket.ReceiveTimeout = receiveTimeout;
                socket.SendTimeout = sendTimeout;


                int loopTimes = 0;
                int loopTimesMax = 2;

            loop:

                try
                {
                    if (!socket.Connected)
                    {
                        socket.Connect(host, port);
                    }

                    if (!socket.Connected)
                    {
                        loopTimes++;

                        if (loopTimes < loopTimesMax)
                        {
                            goto loop;
                        }
                    }

                    if (socket.Connected)
                    {
                        socket.Send(headersData);
                        data = GetData(metohd, socket);
                        socket.Shutdown(SocketShutdown.Both);
                    }

                }
                catch (Exception ex)
                {
                    if (loopTimes < loopTimesMax)
                    {
                        loopTimes++;

                        goto loop;
                    }
                    else
                    {
                        if (ErrorLog != null)
                        {
                            ErrorLog.Write(" Socket GetData " + ex.Message + "\r\n----------\r\n" + Encoding.UTF8.GetString(headersData));
                        }
                    }
                }


                socket.Close();
                socket.Dispose();

            }

            return data;
        }




        public HttpData GetData(HTTPMethod metohd, IPEndPoint address, byte[] headersData)
        {
            HttpData data = null;

            using (Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp))
            {
                socket.ReceiveBufferSize = Receive_Buffer_Size;

                socket.ReceiveTimeout = receiveTimeout;
                socket.SendTimeout = sendTimeout;

                int loopTimes = 0;
                int loopTimesMax = 2;

            loop:

                try
                {
                    if (!socket.Connected)
                    {
                        socket.Connect(address.Address, address.Port);
                    }

                    if (!socket.Connected)
                    {
                        loopTimes++;

                        if (loopTimes < loopTimesMax)
                        {
                            goto loop;
                        }
                    }

                    if (socket.Connected)
                    {
                        socket.Send(headersData);

                        data = GetData(metohd, socket);

                        socket.Shutdown(SocketShutdown.Both);
                    }

                }
                catch (Exception ex)
                {
                    if (loopTimes < loopTimesMax)
                    {
                        loopTimes++;

                        goto loop;
                    }
                    else
                    {
                        if (ErrorLog != null)
                        {
                            ErrorLog.Write(" Socket GetData " + ex.Message + "\r\n----------\r\n" + Encoding.UTF8.GetString(headersData));
                        }
                    }
                }

                socket.Close();
                socket.Dispose();
            }


            return data;
        }
    }
}
