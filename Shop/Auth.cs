using MySqlConnector;
using Shop.DAO;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Text;

namespace Shop
{
    class Auth
    {
        public static User Login(string username, string password)
        {
            using MySqlConnection connection = Utils.GetSqlSession();
            UserMapper uM = new UserMapper(connection);
            int id = uM.Login(username, Hash(password));
            if (id != -1)
            {
                return uM.Read(id, out _);
            }
            return null;
        }
    
    
        public static string Hash(string clear) {
            var crypt = new System.Security.Cryptography.SHA256Managed();
            var hash = new System.Text.StringBuilder();
            byte[] crypto = crypt.ComputeHash(Encoding.UTF8.GetBytes(clear));
            foreach (byte theByte in crypto)
            {
                hash.Append(theByte.ToString("x2"));
            }
            return hash.ToString();
        }
        public static int GetRole(User user)
        {
            return Utils.GetMySqlQueryReader("select role_id from users_roles_applications where @user_id=? and @application_id=?", new List<string> { "user_id=" + user.id, "application_id=" + Int32.Parse(ConfigurationManager.AppSettings.Get("AppId")) }).GetInt32(0);
        }
        public static void CreateUserRole(int role_id,int user_id)
        {
            Utils.GetMySqlQueryReader("INSERT INTO users_roles_applications (user_id,role_id,application_id)VALUES(@user_id,@role_id,@application_id)", new List<string> { "user_id=" + user_id, "role_id=" + role_id, "application_id=" + Int32.Parse(ConfigurationManager.AppSettings.Get("AppId")) });
        }
        public static List<Role> GetRoles()
        {
            List<Role> roles = new List<Role>();
            MySqlDataReader reader = Utils.GetMySqlQueryReader("select * from roles");
            while (reader.Read())
            {
                roles.Add(new Role()
                {
                    id = reader.GetInt32(0),
                    name = reader.GetString(1),
                    description = reader.GetString(2)
                });
            }
            return roles;
        }
        public static List<string> GetRolesNames()
        {
            List<string> roles = new List<string>();
            MySqlDataReader reader = Utils.GetMySqlQueryReader("select name from roles");
            while (reader.Read())
            {
                roles.Add(reader.GetString(0));
            }
            return roles;
        }
        
        public static List<string> GetLocationsNames()
        {
            List<string> locations = new List<string>();
            MySqlDataReader reader = Utils.GetMySqlQueryReader("select * from locations_names");
            while (reader.Read())
            {
                locations.Add(reader.GetString(0));
            }
            return locations;
        }
    }
}
