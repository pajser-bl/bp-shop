using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.DAO
{
    class Order
    {
        public int? id = null;
        public DateTime datetime;
        public int id_order_status;
        public OrderStatus orderStatus;
        public int id_user;
        public User user;

    }
}
