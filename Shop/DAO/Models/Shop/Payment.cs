using Shop.DAO.Models.Shop;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.DAO
{
    class Payment
    {
        public int? id = null;
        public int id_credit_card;
        public CreditCard creditCard;
        public int id_order;
        public Order order;
        public DateTime datetime;
        public int id_paymentStatus;
        public PaymentStatus status;
        public float amount;
    }
}
