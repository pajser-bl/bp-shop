using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.DAO
{
    public class Region
    {
        public int? id = null;
        public string name;
        public string dialing_prefix;
        public int id_country;
        public Country country;
    }
}
