using DAO.IDataMapper;
using MySqlConnector;
using Shop.DAO.Models.Shop;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Shop.DAO.Mappers
{
    class ProductTypeMapper : IDataMapper<ProductType>
    {
        public ProductTypeMapper(MySqlConnection connection) : base(connection) { }
        public override int Create(ProductType instance, out Exception exError)
        {
            int returnValue = -1;
            exError = null;
            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand(
                    "INSERT INTO products_types " +
                    "(name,description,parent_product_type_id)" +
                    "VALUES" +
                    "(@name, @description,@parent_product_type_id);SELECT LAST_INSERT_ID();"
                    , (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@name", instance.name);
                command.Parameters.AddWithValue("@description", instance.description);
                command.Parameters.AddWithValue("@parent_product_type_id", instance.id_parent_product_type);
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

                using MySqlCommand command = new MySqlCommand("DELETE FROM products_types where id=@id", (MySqlConnection)this.Connection);
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

        public override bool Delete(ProductType instance, out Exception exError)
        {
            return Delete((int)instance.id,out exError);
        }

        public override ProductType Read(int ID, out Exception exError)
        {
            ProductType returnValue = null;
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM products_types where id=@id", (MySqlConnection)this.Connection);
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

        public override ProductType Read(ProductType instance, out Exception exError)
        {
            return this.Read((int)instance.id, out exError);
        }

        public override ProductType ReadFromReader(MySqlDataReader reader)
        {
            ProductType returnValue = new ProductType
            {
                id=reader.GetInt32(0),
                name=reader.GetString(1),
                description=reader.GetString(2),
            };
            if (!reader.IsDBNull(3))
            {
                returnValue.id_parent_product_type = reader.GetInt32(3);
            }
            return returnValue;
        }

        public override List<ProductType> Select(out Exception exError)
        {
            List<ProductType> returnValue = new List<ProductType>();
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM products_types ORDER BY parent_product_type_id ASC", (MySqlConnection)this.Connection);
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

        public override bool Update(ProductType instance, out Exception exError)
        {
            bool returnValue = false;
            exError = null;
            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand(
                    "UPDATE products_types SET" +
                    "name=@name," +
                    "description=@description," +
                    "parent_product_type_id=@parent_product_type_id," +
                    "where id=@id", (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@name", instance.name);
                command.Parameters.AddWithValue("@description", instance.description);
                command.Parameters.AddWithValue("@parent_product_type_id", instance.id_parent_product_type);
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
