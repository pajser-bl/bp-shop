using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.DAO.Models.Shop
{
    public class Product:NameDesc
    {
        public int id_product_type { get; set; }
        public ProductType productType { get; set; }
        public decimal price { get; set; }


    }
}
