using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.DAO.Models.Shop
{
    public class ProductType:NameDesc
    {
        public int? id_parent_product_type { get; set; }
        public List<ProductType> subTypes { get; set; }

        public String toString()
        {
            return name;
        }

    }


}
