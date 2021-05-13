using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.DAO
{
    public class User
    {
        public int? id {get;set;}
        public string username { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string hash { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string? middle_name { get; set; }

        public int id_location;
        public Location location;

        public int id_role;
        public string role { get; set; }

        //public List<RolesApplications> rolesAtApplications;

    }
}
