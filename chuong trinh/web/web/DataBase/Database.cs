using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
namespace DataBase
{
    public class Database
    {
        //public static String sqlite_location = "" + System.Web.HttpRuntime.BinDirectory + "\\..\\gsupload.sqlite";

        /// <summary>
        /// Truy vấn dữ liệu bằng mã SQL
        /// </summary>
        /// <param name="sql">Mã SQL</param>
        /// <returns>Bảng: DataTable</returns>
        public static DataTable query(String sql)
        {
            /*
             * SQLite:
            SQLite.sqlite_location = sqlite_location;
            return SQLite.query(sql);
             */
            
            //MSSQL.server = @"Data Source=(LocalDB)\v11.0;AttachDbFilename='" + HttpRuntime.AppDomainAppPath.ToString() + @"App_Data\QuanLyHocSinhTHPT.mdf';Integrated Security=True";

            MSSQL.server = @"Data Source=.\SQLEXPRESS;Initial Catalog=tgdt;Integrated Security=True";
            return MSSQL.query(sql);
        }

        /// <summary>
        /// Lấy dữ liệu của một bảng
        /// </summary>
        /// <param name="table">Tên bảng</param>
        /// <param name="columns">Cột cần lấy ra: conlumn1, column2, column3, ...</param>
        /// <param name="conditions">Điều kiện: key1='value1' AND key2='value2' OR key3='value3' ... </param>
        /// <param name="column_order">Cột để sắp xếp bộ dữ liệu theo</param>
        /// <param name="ASC_DESC">"ASC" (tăng dần) hoặc "DESC" (giảm dần)</param>
        /// <returns>Bảng: DataTable</returns>
        public static DataTable get(String table, String columns, String conditions, String column_order, String ASC_DESC)
        {
            return query("SELECT " + columns + " FROM " + table + " WHERE " + conditions + " ORDER BY " + column_order + " " + ASC_DESC + ";");
        }

        /// <summary>
        /// Lấy dữ liệu của một bảng
        /// </summary>
        /// <param name="table">Tên bảng</param>
        /// <param name="columns">Cột cần lấy ra: "conlumn1, column2, column3, ..."</param>
        /// <param name="conditions">Điều kiện: "key1='value1' AND key2='value2' OR key3='value3' ..." </param>
        /// <returns>Bảng: DataTable</returns>
        public static DataTable get(String table, String columns, String conditions)
        {
            return query("SELECT "+columns+" FROM " + table + " WHERE " + conditions + ";");
        }

        public static DataTable get(String table, String columns, Dictionary<String, String> conditions)
        {
            String cond = buildQuery(conditions, "AND");
            return query("SELECT " + columns + " FROM " + table + " WHERE " + cond + ";");
        }
        /// <summary>
        /// Lấy dữ liệu của một bảng
        /// </summary>
        /// <param name="table">Tên bảng</param>
        /// <param name="columns">Cột cần lấy ra: "conlumn1, column2, column3, ..."</param>
        /// <returns>Bảng: DataTable</returns>
        public static DataTable get(String table, String columns)
        {
            return query("SELECT "+columns+" FROM " + table + " WHERE 1=1;");
        }



        /// <summary>
        /// Đang xây dựng
        /// </summary>
        /// <param name="data">{"cột" => giá trị}</param>
        /// <returns>xâu đã nối</returns>
        public static String buildQuery(Dictionary<String, String> data, String seperater)
        {

            String sql = "";

            //Đếm số phần tử
            int count = 0;
            foreach (var e in data) count++;


            int i = 0;
            //Tạo danh sách các trường để chèn
            foreach (var e in data)
            {
                String key = e.Key;
                String value = e.Value;
                i++;
                String unicode = "";
                if (SQLite.IsASCII(value) == false)
                    unicode = "N";
                sql += key + "=" + unicode + "'" + SQLite.filter(value) + "'";
                if (i < count)
                {
                    sql += " " + seperater + " ";
                }
            }

            return sql;
        }


        /// <summary>
        /// Chèn thêm dữ liệu vào một bảng
        /// </summary>
        /// <param name="table">Tên bảng</param>
        /// <param name="data">Dữ liệu dạng Dictionary: { "column1" : "value1", "column2" : "value2", ... }</param>
        public static void insert(String table, Dictionary<String, String> data)
        {
            String list_key = "";
            String list_value = "";
            //Đếm số phần tử
            int count = 0;
            foreach( var e in data) count++;


            int i = 0;
            //Tạo danh sách các trường để chèn
            foreach( var e in data)
            {
                String key = e.Key;
                String value = e.Value;
                String unicode = "";
                if (SQLite.IsASCII(value) == false)
                    unicode = "N";

                i++;
                list_key += SQLite.filter(key);
                list_value += unicode + "'" + SQLite.filter(value) + "'";
                if(i < count)
                {
                    list_key += ",";
                    list_value += ",";
                }
            }

            table = SQLite.filter(table);
            String sql = "INSERT INTO " + table + "(" + list_key + ")  VALUES(" + list_value + ");";

            query(sql);
        }

        /*
        /// <summary>
        /// Xoá một vài dữ liệu của một bảng
        /// </summary>
        /// <param name="table">Tên bảng</param>
        /// <param name="conditions">Điều kiện: key1='value1' AND key2='value2' OR key3='value3' ... </param>
        public static DataTable delete(String table, String conditions)
        {
            String deleted = "SELECT * FROM [" + table + "] WHERE " + conditions + ";";
            String sql = "DELETE FROM [" + table + "] WHERE " + conditions + ";";
            query(sql);
            return query(deleted);
        }
        */

        /// <summary>
        /// Cập nhật lại dữ liệu
        /// </summary>
        /// <param name="table">Tên bảng</param>
        /// <param name="condition">Điều kiện | Ví dụ: "id" : 1009, "name" : "Giappi"</param>
        /// <param name="data">Dữ liệu sẽ được cập nhật</param>
        /// <returns></returns>
        public static DataTable set(String table, Dictionary<String, String> condition, Dictionary<String, String> data)
        {
            
            String update = buildQuery(data, ",");
            String cond = buildQuery(condition, "AND");
            String sql = "UPDATE " + table + " SET " + update + " WHERE " + cond + ";";
            return query(sql);
        }
        /// <summary>
        /// Xoá một số bộ dữ liệu
        /// </summary>
        /// <param name="table">Tên bảng</param>
        /// <param name="condition">Điều kiện | Ví dụ: "id" : 1009, "name" : "Giappi"</param>
        /// <returns></returns>
        public static DataTable delete(String table, Dictionary<String, String> condition)
        {
            String cond = buildQuery(condition, "AND");
            String deleted = "SELECT * FROM " + table + " WHERE " + cond + ";";
            String sql = "DELETE FROM " + table + "  WHERE " + cond + ";";
            query(sql);
            return query(deleted);
        }
    }
}