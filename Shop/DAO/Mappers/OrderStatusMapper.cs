using DAO.IDataMapper;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Shop.DAO.Mappers
{
    class OrderStatusMapper : IDataMapper<OrderStatus>
    {


        public OrderStatusMapper(MySqlConnection connection) : base(connection) { }

        public override int Create(OrderStatus instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override bool Delete(int ID, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override bool Delete(OrderStatus instance, out Exception exError)
        {
            throw new NotImplementedException();
        }

        public override OrderStatus Read(int ID, out Exception exError)
        {
            OrderStatus returnValue = null;
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM order_statuses where id=@id", (MySqlConnection)this.Connection);
                command.Parameters.AddWithValue("@id", ID);
                using MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    returnValue = ReadFromReader(reader);
                }
            }
#pragma warning disable CA1031 // Do not catch general exception types
            catch (Exception ex)
            {
                exError = ex;
            }
#pragma warning restore CA1031 // Do not catch general exception types

            return returnValue;
        }

        public override OrderStatus Read(OrderStatus instance, out Exception exError)
        {
            return this.Read((int)instance.id, out exError);
        }

        public override OrderStatus ReadFromReader(MySqlDataReader reader)
        {
            OrderStatus returnValue = new OrderStatus
            {
                id = reader.GetInt32(0),
                name = reader.GetString(1),
                description = reader.GetString(2),
            };
            return returnValue;
        }

        public override List<OrderStatus> Select(out Exception exError)
        {
            List<OrderStatus> returnValue = new List<OrderStatus>();
            exError = null;

            try
            {
                if (this.Connection.State != ConnectionState.Open)
                    this.Connection.Open();

                using MySqlCommand command = new MySqlCommand("SELECT * FROM order_statuses", (MySqlConnection)this.Connection);
                using MySqlDataReader reader = command.ExecuteReader();
                while (reader.Read())
                {
                    returnValue.Add(ReadFromReader(reader));
                }
            }
#pragma warning disable CA1031 // Do not catch general exception types
            catch (Exception ex)
            {
                exError = ex;
            }
#pragma warning restore CA1031 // Do not catch general exception types

            return returnValue;
        }

        public override bool Update(OrderStatus instance, out Exception exError)
        {
            throw new NotImplementedException();
        }
    }
}
