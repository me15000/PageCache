using System;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;

namespace PageCache.Store.Disk
{
    public class DiskStore : IStore
    {
        string rootpath = null;
        BinaryFormatter binaryFormatter = new BinaryFormatter();

        public DiskStore(string path)
        {
            if (string.IsNullOrEmpty(path))
            {
                throw new Exception("DiskStore: path is null ");
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
                throw new Exception("DiskStore: Directory not exists " + path + "\r\n" + ex.Message);
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

            if (File.Exists(path))
            {
                return true;
            }

            return false;
        }

        public void Save(StoreData data)
        {
            string cache_path = GetCacheFilePath(data.Type, data.Key);
            string old_path = cache_path + ".old";
            string new_path = cache_path + ".new." + (new Random().Next(9999));

            bool exists_cache = false;
            if (!File.Exists(cache_path))
            {
                string folder = GetCacheFileDirectory(data.Type, data.Key);

                if (!Directory.Exists(folder))
                {
                    Directory.CreateDirectory(folder);
                }
            }
            else
            {
                exists_cache = true;
            }


            try
            {
                using (var fs = File.Create(new_path, 1024 * 256, FileOptions.RandomAccess))
                {
                    binaryFormatter.Serialize(fs, data);
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

            }
            catch (Exception ex)
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

        }

        public StoreData GetData(string type, string key)
        {
            StoreData data = null;
            string cache_path = GetCacheFilePath(type, key);
            if (File.Exists(cache_path))
            {
                using (var fs = File.Open(cache_path, FileMode.Open, FileAccess.Read, FileShare.Read))
                {
                    object cacheObject = binaryFormatter.Deserialize(fs);

                    if (cacheObject != null)
                    {
                        data = cacheObject as StoreData;
                    }

                    fs.Close();
                    fs.Dispose();
                }
            }


            return data;
        }

        public void Delete(string type, string key)
        {
            string cache_path = GetCacheFilePath(type, key);

            if (File.Exists(cache_path))
            {
                File.Delete(cache_path);
            }
        }
    }
}
