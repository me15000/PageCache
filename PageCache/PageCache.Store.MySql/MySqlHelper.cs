using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace PageCache.Store.MySql
{

    /// <summary>
    ///SQLServerHandler 的摘要说明
    /// </summary>
    public class MySqlHelper
    {
        string connectionString;
        public string ConnectionString
        {
            get { return connectionString; }
            set { connectionString = value; }
        }

        public MySqlHelper(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public MySqlCommand CreateCommand()
        {
            return new MySqlCommand();


        }

        public MySqlConnection CreateConnection()
        {

            return new MySqlConnection(connectionString);
        }


        public MySqlParameter CreateParameter(string name, object value)
        {

            MySqlParameter parameter = CreateParameter();
            parameter.ParameterName = name;
            parameter.Value = value;
            return parameter;
        }

        public MySqlParameter CreateParameter(string name)
        {
            MySqlParameter parameter = CreateParameter();
            parameter.ParameterName = name;
            return parameter;
        }

        public MySqlParameter CreateParameter()
        {
            return new MySqlParameter();
        }


        public T ExecuteScalar<T>(string sql, params MySqlParameter[] parameters)
        {


            using (MySqlConnection connection = CreateConnection())
            {


                MySqlCommand cmd = CreateCommand();
                cmd.Connection = connection;
                cmd.CommandText = sql;
                cmd.Parameters.AddRange(parameters);
                connection.Open();
                object o = cmd.ExecuteScalar();
                connection.Close();
                return (T)Convert.ChangeType(o, typeof(T));
            }


        }



        public MySqlDataReader ExecuteReader(string sql, params MySqlParameter[] parameters)
        {
            MySqlConnection connection = CreateConnection();

            MySqlCommand cmd = CreateCommand();
            cmd.Connection = connection;
            cmd.CommandText = sql;
            cmd.Parameters.AddRange(parameters);
            connection.Open();
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);


        }

        public int ExecuteNoneQuery(string sql, params MySqlParameter[] parameters)
        {
            using (MySqlConnection connection = CreateConnection())
            {

                MySqlCommand cmd = CreateCommand();
                cmd.Connection = connection;
                cmd.CommandText = sql;
                cmd.Parameters.AddRange(parameters);
                connection.Open();
                int num = cmd.ExecuteNonQuery();
                connection.Close();
                return num;
            }
        }


    }

}
