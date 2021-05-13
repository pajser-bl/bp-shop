using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.DAO
{
    public class Location
    {
        public int? id = null;
        public string name;
        public decimal longitude;
        public decimal latitude;
        public int id_city;
        public City city;
        public int id_country;
        public Country country;
        public int id_region;
        public Region region;
    }
}
