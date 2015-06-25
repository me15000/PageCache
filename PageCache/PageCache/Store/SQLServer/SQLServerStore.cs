using System;
using System.Data;

namespace PageCache.Store.SQLServer
{




    public class SQLServerStore : IStore
    {

        SQLServerHelper dbh = null;




        public SQLServerStore(string connectionString)
        {
            dbh = new SQLServerHelper(connectionString);
        }

        string getTableName(string key)
        {
            return "data_" + key.Substring(0, 2);
        }


        public bool Exists(string type, string key)
        {

            int count = dbh.ExecuteScalar<int>("select count(1) from [" + getTableName(key) + "] with(nolock) where [KEY]=@Key and [Type]=@Type"
               , dbh.CreateParameter("@Key", key)
               , dbh.CreateParameter("@Type", type));

            return count > 0;
        }


        Random rnd = new Random();

        public void Save(Store.StoreData data)
        {

            string tableName = getTableName(data.Key);

            if (Exists(data.Type, data.Key))
            {
                dbh.ExecuteNoneQuery("update [" + tableName + "] set [HeadersData]=@HeadersData,[BodyData]=@BodyData,[CreatedDate]=@CreatedDate,[ExpiresAbsolute]=@ExpiresAbsolute,[Seconds]=@Seconds where [KEY]=@KEY and [Type]=@Type"
                   , dbh.CreateParameter("@KEY", data.Key)
                   , dbh.CreateParameter("@Type", data.Type)

                   /*二进制数据*/
                   , dbh.CreateParameter("@HeadersData", data.HeadersData)
                   , dbh.CreateParameter("@BodyData", data.BodyData)
                    /*end 二进制数据*/

                   , dbh.CreateParameter("@CreatedDate", data.CreatedDate)
                   , dbh.CreateParameter("@ExpiresAbsolute", data.ExpiresAbsolute)
                   , dbh.CreateParameter("@Seconds", data.Seconds)
                   );
            }
            else
            {

                dbh.ExecuteNoneQuery("insert into [" + tableName + "]([KEY],[Type],[HeadersData],[BodyData],[CreatedDate],[ExpiresAbsolute],[Seconds]) values(@KEY,@Type,@HeadersData,@BodyData,@CreatedDate,@ExpiresAbsolute,@Seconds);"
                , dbh.CreateParameter("@KEY", data.Key)
                , dbh.CreateParameter("@Type", data.Type)

                /*二进制数据*/
                , dbh.CreateParameter("@HeadersData", data.HeadersData)
                , dbh.CreateParameter("@BodyData", data.BodyData)
                    /*end 二进制数据*/

                , dbh.CreateParameter("@CreatedDate", data.CreatedDate)
                , dbh.CreateParameter("@ExpiresAbsolute", data.ExpiresAbsolute)
                , dbh.CreateParameter("@Seconds", data.Seconds)
                );



            }


            if (rnd.Next(0, 3) == 0)
            {
                dbh.ExecuteNoneQuery("delete from [" + tableName + "]  where ExpiresAbsolute < GetDate() - 1");
            }

        }

        public Store.StoreData GetData(string type, string key)
        {

            Store.StoreData cache = null;

            string tableName = getTableName(key);

            string sql = "select [KEY],[Type],[CreatedDate],[ExpiresAbsolute],[Seconds],[HeadersData],[BodyData] from [" + tableName + "] with(nolock)  where [Type]=@Type and [Key]=@Key";


            using (var connection = dbh.CreateConnection())
            {
                using (var command = dbh.CreateCommand())
                {
                    command.CommandText = sql;
                    command.Connection = connection;

                    command.Parameters.Add(dbh.CreateParameter("@Type", type));
                    command.Parameters.Add(dbh.CreateParameter("@Key", key));

                    connection.Open();

                    using (var reader = command.ExecuteReader(CommandBehavior.SequentialAccess))
                    {

                        if (reader.Read())
                        {
                            cache = new Store.StoreData();

                            cache.Key = reader.GetString(0);
                            cache.Type = reader.GetString(1);
                            cache.CreatedDate = reader.GetDateTime(2);
                            cache.ExpiresAbsolute = reader.GetDateTime(3);
                            cache.Seconds = reader.GetInt32(4);

                            cache.HeadersData = (byte[])reader.GetValue(5);
                            cache.BodyData = (byte[])reader.GetValue(6);


                        }


                        reader.Close();
                        reader.Dispose();
                    }

                    command.Dispose();
                }

                connection.Close();
                connection.Dispose();
            }

            return cache;
        }

      

        public void Delete(string type, string key)
        {

            dbh.ExecuteNoneQuery("delete from [" + getTableName(key) + "] where [Key]=@Key and [Type]=@Type;"
              , dbh.CreateParameter("@Key", key)
              , dbh.CreateParameter("@Type", type));


        }



    }



}