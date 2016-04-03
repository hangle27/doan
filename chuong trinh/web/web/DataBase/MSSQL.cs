using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Threading;
using System.Web;

namespace DataBase
{
    public partial class MSSQL
    {

        //public static String server = "Data Source=.\\SQLEXPRESS;AttachDbFilename=|DataDirectory|\\Databases\\qlks_cg.mdf;Integrated Security=True;Connect Timeout=15;User Instance=True";

        public static String server = "";//@"Data Source=(LocalDB)\v11.0;AttachDbFilename='" + HttpRuntime.AppDomainAppPath.ToString()+ @"App_Data\Database1.mdf';Integrated Security=True";
        public static String OutputMessage = "";

        public static DataTable query(String sql)
        {
            try
            {
                SqlConnection sqlConnection = new SqlConnection(server);
                SqlDataAdapter sqlDA = new SqlDataAdapter(sql, sqlConnection);
                DataTable table = new DataTable();
                sqlDA.Fill(table);
                sqlConnection.Close();
                return table;
            }
            catch (Exception e)
            {
                throw new Exception("SQL lỗi: " + e.Message + "\r\n" + sql);
            }
        }

        



    }
}
