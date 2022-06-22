using MySqlConnector;
using Shop.DAO.Mappers;
using Shop.DAO.Models.Shop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows;
using System.Windows.Documents;

namespace Shop
{
    class Utils
    {

        public static void TestSQLConnection() {
            var TestVariable = "";
            try {
                MySqlDataReader reader = GetMySqlQueryReader("SHOW STATUS WHERE `variable_name` = 'Threads_connected';");
                while (reader.Read())
                {
                    TestVariable = reader.GetString(0);
                }
            } catch (Exception) {
                MessageBox.Show("Connection to DB failed...");
                System.Windows.Application.Current.Shutdown();
            }
        }
        public static MySqlConnection GetSqlSession()
        {
            return new MySqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["MySQL"].ConnectionString.ToString());
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
        public static List<ProductType> getProductTypesTree()
        {
            List<ProductType> ptL = new ProductTypeMapper(GetSqlSession()).Select(out _);


            foreach (ProductType pt in ptL)
            {
                pt.subTypes= ptL.Where(child => child.id_parent_product_type == pt.id)
                                              .ToList();
            }
            return ptL.Where(child => child.id_parent_product_type == null).ToList(); ;
        }
        public static List<string> getProductTypesNames()
        {
            List<string> ptN = new List<string>();
            MySqlDataReader reader = GetMySqlQueryReader("select * from products_types_names");
            while (reader.Read())
            {
                ptN.Add(reader.GetString(0));
            }
            return ptN;
        }
    }
}
