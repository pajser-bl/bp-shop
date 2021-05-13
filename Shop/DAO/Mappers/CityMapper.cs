using DAO.IDataMapper;
using MySqlConnector;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;

namespace Shop.DAO.Mappers
{
    class CityMapper : IDataMapper<City>
    {
        public CityMapper(MySqlConnection connection) : base(connection) { }
        public override int Create(City instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override bool Delete(int ID, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override bool Delete(City instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override City Read(int ID, out Exception exError)
        {
            City returnValue = null;
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM [countries_regions_cities] where region_id=@id", (MySqlConnection)this.Connection);
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

        public override City Read(City instance, out Exception exError)
        {
            return Read((int)instance.id, out exError);
        }

        public override City ReadFromReader(MySqlDataReader reader)
        {
            City returnValue = new City()
            {
                id = reader.GetInt32(8),
                name = reader.GetString(9),
                postal_code=reader.GetString(10),
                call_number=reader.GetString(11),
                time_zone=reader.GetString(12),
                id_country = reader.GetInt32(0),
                id_region= reader.GetInt32(5)
            };
            returnValue.country = new Country()
            {
                id = reader.GetInt32(0),
                name = reader.GetString(1),
                ISO2 = reader.GetString(2),
                ISO3 = reader.GetString(3),
                dialing_prefix = reader.GetString(4)
            };
            returnValue.region = new Region() {
                id = reader.GetInt32(5),
                name = reader.GetString(6),
                id_country = reader.GetInt32(0),
                dialing_prefix = reader.GetString(7)
            };
            return returnValue;
        }

        public override List<City> Select(out Exception exError)
        {
            List<City> returnValue = new List<City>();
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM [countries_regions_cities]", (MySqlConnection)this.Connection);
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

        public override bool Update(City instance, out Exception exError)
        {
            throw new NotImplementedException();
        }
    }
}
