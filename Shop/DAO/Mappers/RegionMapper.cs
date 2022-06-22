using DAO.IDataMapper;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace Shop.DAO.Mappers
{
    class RegionMapper : IDataMapper<Region>
    {
        public RegionMapper(MySqlConnection connection) : base(connection) { }
        public override int Create(Region instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override bool Delete(int ID, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override bool Delete(Region instance, out Exception exError)
        {
            throw new NotImplementedException();
        }
        public override Region ReadFromReader(MySqlDataReader reader)
        {
            Region returnValue = new Region()
            {
                id = reader.GetInt32(5),
                name = reader.GetString(6),
                id_country = reader.GetInt32(0),
                dialing_prefix = reader.GetString(7)
            };
            returnValue.country = new Country()
            {
                id = reader.GetInt32(0),
                name = reader.GetString(1),
                ISO2 = reader.GetString(2),
                ISO3 = reader.GetString(3),
                dialing_prefix = reader.GetString(4)
            };
            return returnValue;
        }
        public override Region Read(int ID, out Exception exError)
        {
            Region returnValue = null;
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM [regions_countries] where region_id=@id", (MySqlConnection)this.Connection);
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

        public override Region Read(Region instance, out Exception exError)
        {
            return Read((int)instance.id, out exError);
        }

        public override List<Region> Select(out Exception exError)
        {
            List<Region> returnValue = new List<Region>();
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM [regions_countries]", (MySqlConnection)this.Connection);
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

        public override bool Update(Region instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

       
    }
}
