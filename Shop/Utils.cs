using MySqlConnector;
using System.Collections.Generic;
using System.Data;
using System.Windows.Documents;

namespace Shop
{
    class Utils
    {
        public static MySqlConnection GetSqlSession()
        {
            return new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString);
        }
        public static MySqlDataReader GetMySqlQueryReader(string queryString)
        {
            MySqlConnection connection = Utils.GetSqlSession();
            if (connection.State != ConnectionState.Open)
                connection.Open();

            using MySqlCommand command = new MySqlCommand(queryString, connection);

            MySqlDataReader reader = command.ExecuteReader();
            return reader;
        }
        public static MySqlDataReader GetMySqlQueryReader(string queryString, List<string> parametersStrings)
        {
            MySqlConnection connection = Utils.GetSqlSession();
            if (connection.State != ConnectionState.Open)
                connection.Open();

            using MySqlCommand command = new MySqlCommand(queryString, connection);
            foreach (string parameterString in parametersStrings)
            {
                command.Parameters.AddWithValue(parameterString.Split("=")[0], parameterString.Split("=")[1]);
            }

            MySqlDataReader reader = command.ExecuteReader();
            reader.Read();
            return reader;
        }
    }
}
