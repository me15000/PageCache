using System;
using System.Data.SQLite;
using System.IO;


namespace PageCache.Store.SQLite
{
    public class SQLiteStore : IStore
    {
        string connectionString = null;

        string getDbPath(string key)
        {
            char n = key[0];
            return getDbPath(n);
        }

        string getDbPath(char n)
        {
            string dbName = n + ".sqlite";
            return connectionString + @"\" + dbName;
        }

        string getHeadersFilePath(string type, string key)
        {
            string fname = type + "_" + key + ".h";
            return connectionString + @"\" + key[0] + @"\" + key[1] + key[2] + @"\" + fname; ;
        }

        string getBodyFilePath(string type, string key)
        {
            string fname = type + "_" + key + ".data";
            return connectionString + @"\" + key[0] + @"\" + key[1] + key[2] + @"\" + fname; ;
        }

        string getTableName(string key)
        {
            return string.Concat(key[1], key[2]);
        }

        public SQLiteStore(string connectionString)
        {
            this.connectionString = connectionString;
            if (Directory.Exists(connectionString))
            {

                string formatsql = @"CREATE TABLE ""data_{0}"" (""KEY""  TEXT(32),""Type""  TEXT(30),""CreatedDate""  INTEGER,""ExpiresAbsolute""  INTEGER,""Seconds""  INTEGER);";

                for (int i = 0; i < 16; i++)
                {
                    string n = i.ToString("X");

                    string dbPath = getDbPath(n[0]);

                    if (!File.Exists(dbPath))
                    {
                        string dirPath = Path.GetDirectoryName(dbPath);

                        if (!Directory.Exists(dirPath))
                        {
                            Directory.CreateDirectory(dirPath);
                        }
                       

                        SQLiteConnection.CreateFile(dbPath);


                        SQLiteConnectionStringBuilder connBuilder = new SQLiteConnectionStringBuilder();
                        connBuilder.DataSource = dbPath;

                        using (SQLiteConnection conn = new SQLiteConnection())
                        {
                            conn.ConnectionString = connBuilder.ToString();
                            conn.Open();

                            for (int j = 0; j < 16; j++)
                            {
                                string j_n = j.ToString("X");

                                for (int k = 0; k < 16; k++)
                                {
                                    string k_n = k.ToString("X");

                                    string tableName = j_n + k_n;

                                    using (SQLiteCommand cmd = new SQLiteCommand())
                                    {
                                        string sql = string.Format(formatsql, tableName);

                                        cmd.CommandText = sql;
                                        cmd.Connection = conn;
                                        cmd.ExecuteNonQuery();
                                    }
                                }
                            }

                            conn.Close();
                            conn.Dispose();
                        }
                    }
                }
            }
        }

        public bool Exists(string type, string key)
        {

            bool exists = false;

            SQLiteConnectionStringBuilder connBuilder = new SQLiteConnectionStringBuilder();
            connBuilder.DataSource = getDbPath(key);

            using (SQLiteConnection conn = new SQLiteConnection())
            {
                conn.ConnectionString = connBuilder.ToString();
                conn.Open();

                exists = Exists(conn, type, key);

                conn.Close();
                conn.Dispose();
            }

            return exists;
        }

        bool Exists(SQLiteConnection conn, string type, string key)
        {
            bool exists = false;

            string tablename = getTableName(key);

            using (SQLiteCommand cmd = new SQLiteCommand())
            {
                cmd.Connection = conn;
                cmd.CommandText = "select count(1) from " + getTableName(key) + " where `KEY`=@Key and `Type`=@Type";

                cmd.Parameters.Add(new SQLiteParameter("@Key", key));
                cmd.Parameters.Add(new SQLiteParameter("@Type", type));

                int count = (int)cmd.ExecuteScalar();

                exists = count > 0;
            }

            return exists;
        }

        public void Save(StoreData data)
        {
            //写入header
            string hPath = getHeadersFilePath(data.Type, data.Key);

            if (File.Exists(hPath))
            {
                File.Delete(hPath);
            }
            else
            {
                string dirPath = Path.GetDirectoryName(hPath);

                if (!Directory.Exists(dirPath))
                {
                    Directory.CreateDirectory(dirPath);
                }
            }


            

            using (FileStream fs = File.Create(hPath, 1024 * 10))
            {
                fs.Write(data.HeadersData, 0, data.HeadersData.Length);
                fs.Close();
                fs.Dispose();
            }

            //写入body
            string bPath = getBodyFilePath(data.Type, data.Key);

            if (File.Exists(bPath))
            {
                File.Delete(bPath);
            }
            else
            {
                string dirPath = Path.GetDirectoryName(bPath);

                if (!Directory.Exists(dirPath))
                {
                    Directory.CreateDirectory(dirPath);
                }
            }


            using (FileStream fs = File.Create(bPath, 1024 * 10))
            {
                fs.Write(data.BodyData, 0, data.BodyData.Length);
                fs.Close();
                fs.Dispose();
            }


            string key = data.Key;

            SQLiteConnectionStringBuilder connBuilder = new SQLiteConnectionStringBuilder();
            connBuilder.DataSource = getDbPath(key);

            using (SQLiteConnection conn = new SQLiteConnection())
            {
                conn.ConnectionString = connBuilder.ToString();
                conn.Open();

                string tablename = getTableName(key);

                using (SQLiteCommand cmd = new SQLiteCommand())
                {
                    cmd.Connection = conn;

                    cmd.CommandText = "delete from " + tablename + " where `Key`=@Key and `Type`=@Type";
                    cmd.Parameters.Add(new SQLiteParameter("@Key", data.Key));
                    cmd.Parameters.Add(new SQLiteParameter("@Type", data.Type));
                    cmd.ExecuteNonQuery();
                }

                using (SQLiteCommand cmd = new SQLiteCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "insert into " + tablename + "(`Key`,`Type`,CreatedDate,ExpiresAbsolute,Seconds) values(@Key,@Type,@CreatedDate,@ExpiresAbsolute,@Seconds)";
                    cmd.Parameters.Add(new SQLiteParameter("@Key", data.Key));
                    cmd.Parameters.Add(new SQLiteParameter("@Type", data.Type));
                                        
                    cmd.Parameters.Add(new SQLiteParameter("@CreatedDate", ConvertToTimeStamp(data.CreatedDate)));
                    cmd.Parameters.Add(new SQLiteParameter("@ExpiresAbsolute", ConvertToTimeStamp(data.ExpiresAbsolute)));

                    cmd.Parameters.Add(new SQLiteParameter("@Seconds", data.Seconds));
                    cmd.ExecuteNonQuery();
                }

                conn.Close();
                conn.Dispose();
            }
        }

        public StoreData GetData(string type, string key)
        {
            StoreData data = new StoreData();

            string hPath = getHeadersFilePath(type, key);

            if (File.Exists(hPath))
            {
                data.HeadersData = File.ReadAllBytes(hPath);
            }
            else
            {
                return null;
            }


            string bPath = getBodyFilePath(type, key);

            if (File.Exists(bPath))
            {
                data.BodyData = File.ReadAllBytes(bPath);
            }
            else
            {
                return null;
            }



            SQLiteConnectionStringBuilder connBuilder = new SQLiteConnectionStringBuilder();
            connBuilder.DataSource = getDbPath(key);

            using (SQLiteConnection conn = new SQLiteConnection())
            {
                conn.ConnectionString = connBuilder.ToString();
                conn.Open();

                string tablename = getTableName(key);

                using (SQLiteCommand cmd = new SQLiteCommand())
                {
                    cmd.Connection = conn;

                    cmd.CommandText = "select `Key`,`Type`,CreatedDate,ExpiresAbsolute,Seconds from " + tablename + " where `Key`=@Key and `Type`=@Type";
                    cmd.Parameters.Add(new SQLiteParameter("@Key", data.Key));
                    cmd.Parameters.Add(new SQLiteParameter("@Type", data.Type));

                    using (SQLiteDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            data.Key = key;
                            data.Type = type;

                            data.CreatedDate = ConvertToDateTime(reader.GetInt32(2));
                            data.ExpiresAbsolute = ConvertToDateTime(reader.GetInt32(3));


                            data.Seconds = reader.GetInt32(4);
                        }
                        else
                        {
                            data = null;
                        }
                        reader.Close();
                        reader.Dispose();
                    }

                    cmd.Dispose();
                }



                conn.Close();
                conn.Dispose();
            }

            return data;
        }

        public StoreDataInfo GetDataInfo(string type, string key)
        {

            StoreDataInfo info = null;

            SQLiteConnectionStringBuilder connBuilder = new SQLiteConnectionStringBuilder();
            connBuilder.DataSource = getDbPath(key);

            using (SQLiteConnection conn = new SQLiteConnection())
            {
                conn.ConnectionString = connBuilder.ToString();
                conn.Open();

                string tablename = getTableName(key);

                using (SQLiteCommand cmd = new SQLiteCommand())
                {
                    cmd.Connection = conn;

                    cmd.CommandText = "select `Key`,`Type`,CreatedDate,ExpiresAbsolute,Seconds from " + tablename + " where `Key`=@Key and `Type`=@Type";
                    cmd.Parameters.Add(new SQLiteParameter("@Key", key));
                    cmd.Parameters.Add(new SQLiteParameter("@Type", type));

                    using (SQLiteDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            info = new StoreDataInfo();

                            info.Key = key;
                            info.Type = type;

                            info.CreatedDate = ConvertToDateTime(reader.GetInt32(2));
                            info.ExpiresAbsolute = ConvertToDateTime(reader.GetInt32(3));

                            info.Seconds = reader.GetInt32(4);
                        }
                        reader.Close();
                        reader.Dispose();
                    }
                    cmd.Dispose();
                }
                conn.Close();
                conn.Dispose();
            }

            return info;
        }

        public void Delete(string type, string key)
        {
            SQLiteConnectionStringBuilder connBuilder = new SQLiteConnectionStringBuilder();
            connBuilder.DataSource = getDbPath(key);
            using (SQLiteConnection conn = new SQLiteConnection())
            {
                conn.ConnectionString = connBuilder.ToString();
                conn.Open();
                string tablename = getTableName(key);
                using (SQLiteCommand cmd = new SQLiteCommand())
                {
                    cmd.Connection = conn;
                    cmd.CommandText = "delete from " + tablename + " where `Key`=@Key and `Type`=@Type";
                    cmd.Parameters.Add(new SQLiteParameter("@Key", key));
                    cmd.Parameters.Add(new SQLiteParameter("@Type", type));
                    cmd.ExecuteNonQuery();
                }
                conn.Close();
                conn.Dispose();
            }

            string hPath = getHeadersFilePath(type, key);
            if (File.Exists(hPath))
            {
                File.Delete(hPath);
            }

            string bPath = getBodyFilePath(type, key);
            if (File.Exists(bPath))
            {
                File.Delete(bPath);
            }
        }


        static DateTime date1970 = TimeZone.CurrentTimeZone.ToLocalTime(new DateTime(1970, 1, 1));

        static DateTime ConvertToDateTime(int timestamp)
        {
            long ticks = long.Parse(timestamp + "0000000");

            return date1970.Add(new TimeSpan(ticks));
        }

        static int ConvertToTimeStamp(System.DateTime time)
        {
            System.DateTime startTime = TimeZone.CurrentTimeZone.ToLocalTime(new System.DateTime(1970, 1, 1));
            return (int)(time - startTime).TotalSeconds;
        }
    }
}
