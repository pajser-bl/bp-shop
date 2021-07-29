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
            throw new NotImplementedException();
        }

        public override bool Delete(int ID, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override bool Delete(Product instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override Product Read(int ID, out Exception exError)
        {
            Product returnValue = null;
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM [product_with_type] where id=@id", (MySqlConnection)this.Connection);
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
            Product returnValue = new Product { 
                id=reader.GetInt32(0),
                name=reader.GetString(1),
                description=reader.GetString(2),
                price=reader.GetDecimal(3),
                id_product_type = reader.GetInt32(4)
            };
            returnValue.productType = new ProductType {
            id = reader.GetInt32(4),
            name= reader.GetString(5),
            description= reader.GetString(6)
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

        public List<Product> SelectByType(int ID,out Exception exError)
        {
            List<Product> returnValue = new List<Product>();
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM [product_with_type] where type_id=@id", (MySqlConnection)this.Connection);
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
            throw new NotImplementedException();
        }
    }
}
