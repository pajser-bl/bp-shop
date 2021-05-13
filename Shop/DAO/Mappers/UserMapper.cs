using DAO.IDataMapper;
using MySqlConnector;
using Shop.DAO.Mappers;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Runtime.InteropServices.WindowsRuntime;
using System.Text;

namespace Shop.DAO
{
    class UserMapper : IDataMapper<User>
    {
        public UserMapper(MySqlConnection connection) : base(connection) { }
        public int application = Int32.Parse(ConfigurationManager.AppSettings.Get("AppId"));
        public override int Create(User instance, out Exception exError)
        {
            int returnValue = -1;
            exError = null;
            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand(
                    "INSERT INTO users " +
                    "(username,first_name,last_name,middle_name,location_id,email,hash,phone)" +
                    "VALUES" +
                    "(@username, @first_name,@last_name,@middle_name,@location_id,@email,@hash,@phone);SELECT LAST_INSERT_ID();"
                    , (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@username", instance.username);
                command.Parameters.AddWithValue("@hash", instance.hash);
                command.Parameters.AddWithValue("@first_name", instance.first_name);
                command.Parameters.AddWithValue("@last_name", instance.last_name);
                command.Parameters.AddWithValue("@middle_name", instance.middle_name);
                command.Parameters.AddWithValue("@location_id", instance.id_location);
                command.Parameters.AddWithValue("@email", instance.email);
                command.Parameters.AddWithValue("@phone", instance.phone);
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
            throw new NotImplementedException();
        }

        public override bool Delete(User instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override User Read(int ID, out Exception exError)
        {
            User returnValue = null;
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM users_with_roles where id=@id and application_id=@application", (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@id", ID);
                command.Parameters.AddWithValue("@application", application);
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

        public override User Read(User instance, out Exception exError)
        {
            return Read((int)instance.id, out exError);
        }

        public override User ReadFromReader(MySqlDataReader reader)
        {
            User returnValue = new User()
            {
                id = reader.GetInt32(0),
                username = reader.GetString(1),
                email = reader.GetString(2),
                phone = reader.GetString(3),
                hash = reader.GetString(4),
                first_name = reader.GetString(5),
                middle_name = reader.GetString(6),
                last_name = reader.GetString(7),
                id_location = reader.GetInt32(8),
                id_role = reader.GetInt32(9),
                role = reader.GetString(10),
            };
            return returnValue;
        }

        public override List<User> Select(out Exception exError)
        {
            List<User> returnValue = new List<User>();
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM users_with_roles where application_id=@application", (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@application", application); 
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

        public List<User> SelectByString(string q, out Exception exError)
        {
            List<User> returnValue = new List<User>();
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM users_with_roles where application_id=@application and (lower(username) like @str or lower(email) like @str or lower(first_name) like @str or lower(middle_name) like @str or lower(middle_name) like @str)", (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@str", "%" + q + "%");
                command.Parameters.AddWithValue("@application", application);
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
        public override bool Update(User instance, out Exception exError)
        {
            bool returnValue = false;
            exError = null;
            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand(
                    "UPDATE users SET" +
                    "username=@username," +
                    "first_name=@first_name," +
                    "last_name=@last_name," +
                    "middle_name=@middle_name," +
                    "role_id=@role_id,location_id=@location_id," +
                    "email=@email,"+
                    "hash=@hash" +
                    "where id=@id", (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@username", instance.username);
                command.Parameters.AddWithValue("@hash", instance.hash);
                command.Parameters.AddWithValue("@first_name", instance.first_name);
                command.Parameters.AddWithValue("@last_name", instance.last_name);
                command.Parameters.AddWithValue("@middle_name", instance.middle_name);
                command.Parameters.AddWithValue("@locaton_id", instance.id_location);
                command.Parameters.AddWithValue("@role_id", instance.id_role);
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

        public int Login(string username,string hash)
        {
            int returnValue = -1;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT id FROM login_by_application_id where username=@username and hash=@hash and application=@application", (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@username", username);
                command.Parameters.AddWithValue("@hash", hash);
                command.Parameters.AddWithValue("@application", application);
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
    }
}
