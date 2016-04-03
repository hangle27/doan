using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;

using System.Text;
using System.Data.SqlClient;
using System.Threading;


namespace DataBase
{
    public class SQLite
    {

        public static String sqlite_location
        {
            get { return location; }
            set { location = value; server = "Data Source=" + location + ";Pooling=true;FailIfMissing=false;"; }
        }
        private static String location = "";
        public static String server = "Data Source='';Pooling=true;FailIfMissing=false";





        public static String filter(String sql_value)
        {
            String new_value = "";;
            for (int i = 0; i < sql_value.Length; i++)
            {
                //Thêm dấu "\" vào trước kí tự đặc biệt
                if (sql_value[i] == '\\' || sql_value[i] == '\'')
                    new_value += '\\';
                new_value += sql_value[i];
            }
            return new_value;
        }


        public static bool IsASCII(String value)
        {
            // ASCII encoding replaces non-ascii with question marks, so we use UTF8 to see if multi-byte sequences are there
            return Encoding.UTF8.GetByteCount(value) == value.Length;
        }

    }
}
