using DAO.IDataMapper;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace Shop.DAO.Mappers
{
    class CountryMapper : IDataMapper<Country>
    {
        public CountryMapper(MySqlConnection connection) : base(connection) { }
        public override int Create(Country instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override bool Delete(int ID, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override bool Delete(Country instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override Country Read(int ID, out Exception exError)
        {
            Country returnValue = null;
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM [countries] where id=@id", (MySqlConnection)this.Connection);
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

        public override Country Read(Country instance, out Exception exError)
        {
            return Read((int)instance.id, out exError);
        }

        public override Country ReadFromReader(MySqlDataReader reader)
        {
            return new Country()
            {
                id = reader.GetInt32(0),
                name = reader.GetString(1),
                ISO2 = reader.GetString(2),
                ISO3 = reader.GetString(3),
                dialing_prefix = reader.GetString(4)
            };
        }

        public override List<Country> Select(out Exception exError)
        {
            List<Country> returnValue = new List<Country>();
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM [countries]", (MySqlConnection)this.Connection);
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

        public override bool Update(Country instance, out Exception exError)
        {
            throw new NotImplementedException();
        }
    }
}
