using DAO.IDataMapper;
using MySqlConnector;
using Shop.DAO.Models.Shop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Shop.DAO.Mappers
{
    class ProductMapper : IDataMapper<Product>
    {
        public ProductMapper(MySqlConnection connection) : base(connection) { }
        public override int Create(Product instance, out Exception exError)
        {
            int returnValue = -1;
            exError = null;
            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand(
                    "INSERT INTO products " +
                    "(name,description,product_type_id,price)" +
                    "VALUES" +
                    "(@name, @description,@product_type_id,@price);SELECT LAST_INSERT_ID();"
                    , (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@name", instance.name);
                command.Parameters.AddWithValue("@description", instance.description);
                command.Parameters.AddWithValue("@product_type_id", instance.id_product_type);
                command.Parameters.AddWithValue("@price", instance.price);
                using MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    returnValue = reader.GetInt32(0);
                };
            }
#pragma warning disable CA1031 // Do not catch general exception types
            catch (Exception)
            {
                returnValue = -1;
            }
#pragma warning restore CA1031 // Do not catch general exception types
            return returnValue;
        }

        public override bool Delete(int ID, out Exception exError)
        {
            int returnValue = -1;
            exError = null;
            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("DELETE FROM products where id=@id", (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@id", ID);
                returnValue = command.ExecuteNonQuery();
            }
#pragma warning disable CA1031 // Do not catch general exception types
            catch (Exception ex)
            {
                exError = ex;
            }
#pragma warning restore CA1031 // Do not catch general exception types

            return returnValue != -1;
        }

        public override bool Delete(Product instance, out Exception exError)
        {
            return Delete((int)instance.id, out exError);
        }

        public override Product Read(int ID, out Exception exError)
        {
            Product returnValue = null;
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM products where id=@id", (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@id", ID);
                using MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    returnValue = ReadFromReader(reader);
                }
            }
#pragma warning disable CA1031 // Do not catch general exception types
            catch (Exception ex)
            {
                exError = ex;
            }
#pragma warning restore CA1031 // Do not catch general exception types

            return returnValue;
        }

        public override Product Read(Product instance, out Exception exError)
        {
            return this.Read((int)instance.id, out exError);
        }

        public override Product ReadFromReader(MySqlDataReader reader)
        {
            Product returnValue = new Product
            {
                id = reader.GetInt32(0),
                name = reader.GetString(1),
                description = reader.GetString(2),
                price = reader.GetDecimal(3),
                id_product_type = reader.GetInt32(4)
            };
            returnValue.productType = new ProductType
            {
                id = reader.GetInt32(4),
                name = reader.GetString(5),
                description = reader.GetString(6)
            };
            return returnValue;
        }

        public override List<Product> Select(out Exception exError)
        {
            List<Product> returnValue = new List<Product>();
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM product_with_type", (MySqlConnection)this.Connection);
                using MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    returnValue.Add(ReadFromReader(reader));
                }
            }
#pragma warning disable CA1031 // Do not catch general exception types
            catch (Exception ex)
            {
                exError = ex;
            }
#pragma warning restore CA1031 // Do not catch general exception types

            return returnValue;
        }

        public List<Product> SelectByType(int ID, out Exception exError)
        {
            List<Product> returnValue = new List<Product>();
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM product_with_type where type_id=@id", (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@id", ID);
                using MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    returnValue.Add(ReadFromReader(reader));
                }
            }
#pragma warning disable CA1031 // Do not catch general exception types
            catch (Exception ex)
            {
                exError = ex;
            }
#pragma warning restore CA1031 // Do not catch general exception types

            return returnValue;
        }

        public override bool Update(Product instance, out Exception exError)
        {
            bool returnValue = false;
            exError = null;
            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand(
                    "UPDATE products SET" +
                    "name=@name," +
                    "description=@description," +
                    "product_type_id=@parent_product_type_id," +
                    "where id=@id", (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@name", instance.name);
                command.Parameters.AddWithValue("@description", instance.description);
                command.Parameters.AddWithValue("@product_type_id", instance.id_product_type);
                command.Parameters.AddWithValue("@id", instance.id);
                using MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    returnValue = reader.GetBoolean(0);
                };
            }
#pragma warning disable CA1031 // Do not catch general exception types
            catch (Exception)
            {
                returnValue = false;
            }
#pragma warning restore CA1031 // Do not catch general exception types
            return returnValue;
        }
    }
}
