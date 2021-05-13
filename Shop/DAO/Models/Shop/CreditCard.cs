using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.DAO
{
    class CreditCard
    {
        public int? id = null;
        public string number;
        public string expiration_month;
        public string expiration_year;
        public string type_code;
        public string holder;
        public int id_user;
        public User user;
    }
}
