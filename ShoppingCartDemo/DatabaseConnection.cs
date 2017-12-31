using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace ShoppingCartDemo
{
    public class DatabaseConnection
    {

        public static void OpenConnection(SqlConnection con)
        {
            try
            {
                if (con.State == ConnectionState.Open)
                {
                    con.Close();
                }
                con.ConnectionString = "Data Source=.\\SQLEXPRESS; Initial Catalog=ShoppingCartDB; Integrated Security=True";
                con.Open();
            }
            catch (Exception)
            {
                
            }
        }
        public static void CloseConnection(SqlConnection con)
        {
            try
            {
                con.Close();
            }
            catch (Exception)
            {
                
            }
        }

    }
}