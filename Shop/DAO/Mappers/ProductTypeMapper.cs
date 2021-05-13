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
            throw new NotImplementedException();
        }

        public override bool Delete(int ID, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override bool Delete(ProductType instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override ProductType Read(int ID, out Exception exError)
        {
            ProductType returnValue = null;
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM [products_types] where id=@id", (MySqlConnection)this.Connection);
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
                id_parent_product_type=reader.GetInt32(3)
            };
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

                using MySqlCommand command = new MySqlCommand("SELECT * FROM [products_types]", (MySqlConnection)this.Connection);
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
            throw new NotImplementedException();
        }
    }
}
