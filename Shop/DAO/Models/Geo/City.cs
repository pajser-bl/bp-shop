using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.DAO
{
    public class City
    {
        public int? id=null;
        public string name;
        public string postal_code;
        public string call_number;
        public string time_zone;
        public int id_region;
        public Region region;
        public int id_country;
        public Country country;

    }
}
