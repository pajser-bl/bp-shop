using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.DAO.Models.Shop
{
    class ProductType:NameDesc
    {
        public int? id_parent_product_type;
        public ProductType parentProductType;
    }
}
