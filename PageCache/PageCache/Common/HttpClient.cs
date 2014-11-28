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

        const string CONTENT_LENGTH_HEADER = "Content-Length";
        const int HEADER_RECEIVE_SIZE = 1;
        const string HEADER_END_SIGN = "\r\n\r\n";
        const string HEADER_SINGLE_END_SIGN = "\r\n";
        const int NONE_DATA_LENGTH = -1;

        const string TRANSFER_ENCODING = "chunked";

        public static string ReceiveHeaderString(Socket socket)
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

        public static byte[] ReceiveBodyData(Socket socket, int contentLength)
        {

            byte[] data = new byte[contentLength];

            int nowContentLength = 0;

            while (true)
            {
                byte[] buffer = new byte[BUFFER_SIZE];

                int receiveCount = socket.Receive(buffer, BUFFER_SIZE, SocketFlags.None);

                if (receiveCount > 0)
                {
                    Array.Copy(buffer, 0, data, nowContentLength, receiveCount);

                    nowContentLength += receiveCount;
                }

                if (receiveCount == 0)
                {
                    break;
                }
            }

            return data;
        }


        public static byte[] ReceiveBodyData(Socket socket)
        {
            List<byte> list = new List<byte>();

            int nowContentLength = 0;

            while (true)
            {
                byte[] buffer = new byte[BUFFER_SIZE];


                int receiveCount = socket.Receive(buffer, BUFFER_SIZE, SocketFlags.None);


                if (receiveCount > 0)
                {

                    for (int i = 0; i < receiveCount; i++)
                    {
                        list.Add(buffer[i]);
                    }

                    nowContentLength += receiveCount;
                }

                if (receiveCount == 0)
                {
                    break;
                }
            }

            return list.ToArray();
        }





        const string CHUNKED_END_SIGN = "\r\n";

        public static byte[] ParseChunkedData(byte[] data)
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
                }

                stream.Close();
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

        public static HttpData GetData(Socket socket)
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

                if (info.ContentLength > 0)
                {
                    data.BodyData = ReceiveBodyData(socket, info.ContentLength);
                }
                else
                {
                    if (info.Headers["Transfer-Encoding"].Equals(TRANSFER_ENCODING, StringComparison.OrdinalIgnoreCase))
                    {
                        byte[] receiveData = ReceiveBodyData(socket);
                        data.BodyData = ParseChunkedData(receiveData);
                    }
                    else
                    {
                        data.BodyData = ReceiveBodyData(socket);
                    }
                }
            }

            return data;

        }

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

        public HttpData GetData(string host, byte[] headersData)
        {
            return GetData(host, 80, headersData);
        }

        public HttpData GetData(string host, int port, byte[] headersData)
        {
            HttpData data = null;

            Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
            socket.ReceiveTimeout = receiveTimeout;
            socket.SendTimeout = sendTimeout;
            socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.KeepAlive, true);


            try
            {
                socket.Connect(host, port);
                socket.Send(headersData);
                data = GetData(socket);
            }
            catch
            {
     
            }
            finally
            {
                socket.Shutdown(SocketShutdown.Both);
                socket.Disconnect(true);
            }         




            return data;
        }

        public HttpData GetData(IPEndPoint address, byte[] headersData)
        {

            HttpData data = null;

            Socket socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);


            socket.ReceiveTimeout = receiveTimeout;
            socket.SendTimeout = sendTimeout;
            socket.SetSocketOption(SocketOptionLevel.Socket, SocketOptionName.KeepAlive, true);

            try
            {
                socket.Connect(address.Address, address.Port);
                socket.Send(headersData);
                data = GetData(socket);
            }
            catch
            {

            }
            finally
            {
                socket.Shutdown(SocketShutdown.Both);
                socket.Disconnect(true);
            }

            return data;
        }
    }
}
