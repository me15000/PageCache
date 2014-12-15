using System;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;

namespace PageCache.Store.SQLServer
{

    /// <summary>
    ///SQLServerHandler 的摘要说明
    /// </summary>
    public class SQLServerHelper
    {
        string connectionString;
        public string ConnectionString
        {
            get { return connectionString; }
            set { connectionString = value; }
        }

        public SQLServerHelper(string connectionString)
        {
            this.connectionString = connectionString;
        }


        public SqlCommand CreateCommand()
        {
            return new SqlCommand();
        }




        public SqlConnection CreateConnection()
        {

            return new SqlConnection(connectionString);
        }



        public SqlParameter CreateParameter(string name, object value)
        {
            SqlParameter parameter = CreateParameter();
            parameter.ParameterName = name;
            parameter.Value = value;
            return parameter;
        }

        public SqlParameter CreateParameter(string name)
        {
            SqlParameter parameter = CreateParameter();
            parameter.ParameterName = name;
            return parameter;
        }

        public SqlParameter CreateParameter()
        {
            return new SqlParameter();
        }


        public T ExecuteScalar<T>(string sql, params SqlParameter[] parameters)
        {

            object o = ExecuteScalar(sql, parameters);

            return (T)Convert.ChangeType(o, typeof(T));
        }


        public object ExecuteScalar(string sql, params SqlParameter[] parameters)
        {
            SqlConnection connection = CreateConnection();

            SqlCommand cmd = CreateCommand();
            cmd.Connection = connection;
            cmd.CommandText = sql;
            cmd.Parameters.AddRange(parameters);

            object o = null;

            try
            {
                connection.Open();

                o = cmd.ExecuteScalar();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                cmd.Dispose();

                if (connection.State != ConnectionState.Closed)
                {
                    connection.Close();
                }
                connection.Dispose();
            }

            return o;

        }


        public DbDataReader ExecuteReader(string sql, params SqlParameter[] parameters)
        {
            SqlConnection connection = CreateConnection();

            SqlCommand cmd = CreateCommand();
            cmd.Connection = connection;
            cmd.CommandText = sql;
            cmd.Parameters.AddRange(parameters);
            connection.Open();
            return cmd.ExecuteReader(CommandBehavior.CloseConnection);

        }

        public int ExecuteNoneQuery(string sql, params SqlParameter[] parameters)
        {
            int num = -1;
            SqlConnection connection = CreateConnection();

            SqlCommand cmd = CreateCommand();
            cmd.Connection = connection;
            cmd.CommandText = sql;
            cmd.Parameters.AddRange(parameters);

            try
            {

                connection.Open();
                num = cmd.ExecuteNonQuery();


            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {

                cmd.Dispose();

                if (connection.State != ConnectionState.Closed)
                {
                    connection.Close();
                }

                connection.Dispose();
            }

            return num;
        }




    }
}
