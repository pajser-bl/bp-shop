using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAO.IDataMapper
{
   
    public abstract class IDataMapper<T>
    {
        
        public IDbConnection Connection { get; private set; }

        protected IDataMapper(IDbConnection connection)
        {
            this.Connection = connection ?? throw new ArgumentNullException("A valid database connection is required");
        }

        public abstract List<T> Select(out Exception exError);

        public abstract int Create(T instance, out Exception exError);


        public abstract T ReadFromReader(MySqlDataReader reader);

        public abstract T Read(int ID, out Exception exError);


        public abstract T Read(T instance, out Exception exError);

        public abstract bool Update(T instance, out Exception exError);


        public abstract bool Delete(int ID, out Exception exError);

        public abstract bool Delete(T instance, out Exception exError);
    }
}