using System;
using System.IO;

namespace PageCache.Store.DiskO
{
    public class DiskOStore : IStore
    {
        string rootpath = null;

        public DiskOStore(string path)
        {
            if (string.IsNullOrEmpty(path))
            {
                throw new Exception("DiskOStore: path is null ");
            }

            this.rootpath = path;

            try
            {
                if (!Directory.Exists(this.rootpath))
                {
                    Directory.CreateDirectory(this.rootpath);
                }

            }
            catch (Exception ex)
            {
                throw new Exception("DiskOStore: Directory not exists " + path + "\r\n" + ex.Message);
            }
        }

        string GetCacheFileDirectory(string type, string key)
        {
            return rootpath + @"\" + key.Substring(0, 3) + @"\";
        }

        string GetCacheFilePath(string type, string key)
        {
            string folder = GetCacheFileDirectory(type, key);
            string path = folder + type + "_" + key;
            return path;
        }


        public bool Exists(string type, string key)
        {
            string path = GetCacheFilePath(type, key);
            string head_path = path + ".head";
            string body_path = path + ".body";

            if (File.Exists(head_path) && File.Exists(body_path))
            {
                return true;
            }

            return false;
        }

        bool SaveFile(string folder, string path, byte[] data)
        {

            string cache_path = path;

            string old_path = cache_path + ".old";
            string new_path = cache_path + ".new." + (new Random().Next(9999));

            bool exists_cache = false;
            if (!File.Exists(cache_path))
            {

                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }
            }
            else
            {
                exists_cache = true;
            }

            bool succ = false;

            try
            {
                using (var fs = File.Create(new_path, 1024 * 256, FileOptions.RandomAccess))
                {
                    fs.Write(data, 0, data.Length);
                    fs.Close();
                    fs.Dispose();
                }

                if (exists_cache)
                {
                    if (File.Exists(old_path))
                    {
                        File.Delete(old_path);
                    }

                    File.Move(cache_path, old_path);
                }

                File.Move(new_path, cache_path);

                succ = true;
            }
            catch (Exception ex)
            {


            }
            finally
            {
                if (File.Exists(new_path))
                {
                    File.Delete(new_path);
                }
                if (File.Exists(old_path))
                {
                    File.Delete(old_path);
                }
            }

            return succ;
        }


        byte[] ReadFile(string path)
        {
            if (File.Exists(path))
            {
                return File.ReadAllBytes(path);
            }

            return null;
        }

        public void Save(StoreData data)
        {
            string path = GetCacheFilePath(data.Type, data.Key);

            string head_path = path + ".head";
            string body_path = path + ".body";

            string folder = GetCacheFileDirectory(data.Type, data.Key);

            SaveFile(folder, head_path, data.HeadersData);
            SaveFile(folder, body_path, data.BodyData);


        }

        public StoreData GetData(string type, string key)
        {
            string path = GetCacheFilePath(type, key);

            string head_path = path + ".head";
            string body_path = path + ".body";


            StoreData data = null;
            var data_head = ReadFile(head_path);
            if (data_head != null)
            {
                var data_body = ReadFile(body_path);
                if (data_body != null)
                {
                    data = new StoreData();
                    data.BodyData = data_body;
                    data.CreatedDate = new DateTime(2000, 1, 1);
                    data.ExpiresAbsolute = DateTime.Today.AddYears(10);
                    data.HeadersData = data_head;
                    data.Key = key;
                    data.Seconds = Convert.ToInt32((data.ExpiresAbsolute - data.CreatedDate).TotalSeconds);
                    data.Type = type;
                }
            }

            return data;
        }

        public void Delete(string type, string key)
        {
            string path = GetCacheFilePath(type, key);

            string head_path = path + ".head";
            string body_path = path + ".body";

            if (File.Exists(head_path))
            {
                File.Delete(head_path);
            }

            if (File.Exists(body_path))
            {
                File.Delete(body_path);
            }
        }
    }
}
