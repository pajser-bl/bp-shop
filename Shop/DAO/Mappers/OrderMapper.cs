using DAO.IDataMapper;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Text;

namespace Shop.DAO.Mappers
{
    class OrderMapper : IDataMapper<Order>
    {

        public OrderMapper(MySqlConnection connection) : base(connection) { }

        public override int Create(Order instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override bool Delete(int ID, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override bool Delete(Order instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override Order Read(int ID, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override Order Read(Order instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override Order ReadFromReader(MySqlDataReader reader)
        {
            throw new NotImplementedException();
        }

        public override List<Order> Select(out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override bool Update(Order instance, out Exception exError)
        {
            throw new NotImplementedException();
        }
    }
}
