using System.IO;
using System.IO.Compression;


namespace PageCache.Common
{
    public static class GZip
    {




        /// <summary>
        /// GZip解压函数
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static byte[] GZipDecompress(byte[] data)
        {


            int bufferSize = 256;


            using (MemoryStream stream = new MemoryStream())
            {
                using (GZipStream gZipStream = new GZipStream(new MemoryStream(data), CompressionMode.Decompress))
                {
                    byte[] bytes = new byte[bufferSize];
                    int n;
                    while ((n = gZipStream.Read(bytes, 0, bytes.Length)) != 0)
                    {
                        stream.Write(bytes, 0, n);
                    }
                    gZipStream.Close();
                    gZipStream.Dispose();
                }

                byte[] rdata = stream.ToArray();

                stream.Close();
                stream.Dispose();

                return rdata;
            }
        }
        /// <summary>
        /// GZip压缩函数
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        public static byte[] GZipCompress(byte[] data)
        {
            using (MemoryStream stream = new MemoryStream())
            {
                using (GZipStream gZipStream = new GZipStream(stream, CompressionMode.Compress))
                {
                    gZipStream.Write(data, 0, data.Length);
                    gZipStream.Close();
                    gZipStream.Dispose();
                }
                return stream.ToArray();
            }
        }
    }
}
