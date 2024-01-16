using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CarRentalWeb
{
    class dbConnect
    {
        private SqlConnection connection = new SqlConnection(@"Data Source = X280\SQLEXPRESS; Initial Catalog = CarRentalCWBack; Integrated Security = True");

        public SqlConnection connect()
        {
            return connection;
        }

        public void open()
        {
            if (connection.State == System.Data.ConnectionState.Closed)
                connection.Open();
        }

        public void close()
        {
            if (connection.State == System.Data.ConnectionState.Open)
                connection.Close();
        }
    }
}