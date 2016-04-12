using DataBase;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DataObjects
{
    public class User
    {
        public String Id;
        public String Name;
        public String Email;
        public String Gender;
        public String Address;
        public String Phone;
        public String Type;

        public static String tableName = "users";

        public User(String id)
        {
            this.Id = id;
            DataTable t = Database.get(tableName, "*", "id='" + SQLite.filter(id) + "'");
            this.Id = t.Rows[0]["id"].ToString();
            this.Name = t.Rows[0]["name"].ToString();
            this.Email = t.Rows[0]["email"].ToString();
            this.Gender = t.Rows[0]["gender"].ToString();
            this.Phone = t.Rows[0]["phone"].ToString();
            this.Type = t.Rows[0]["type"].ToString();

            
        }



        public static String getUserId(String username)
        {
            DataTable t = Database.get(tableName, "id", "username='" + username + "';");
            if (t.Rows.Count > 0)
            {
                return t.Rows[0]["id"].ToString();
            }
            return "0";
        }

        public static String getRealName(int id)
        {
            DataTable t = Database.get(tableName, "name", "id='" + id + "';");
            if (t.Rows.Count > 0)
            {
                return t.Rows[0]["name"].ToString();
            }
            return "0";
        }


        public static DataTable search(string key)
        {
            return DataBase.Database.get(tableName, "Id,username,realname", string.Format("isAdmin = 0 AND (Id LIKE '%{0}%' OR username LIKE '%{0}%' OR realname LIKE '%{0}%')", SQLite.filter(key)));
        }
        public static Boolean exist(String username)
        {
            DataTable t = Database.get(tableName, "id", "username='" + SQLite.filter(username) + "';");
            return t.Rows.Count > 0;
        }
        public static void delete(String id)
        {
            Database.delete(tableName, new Dictionary<string, string>()
            {
                {"Id" , SQLite.filter(id)}
            });
        }
        public static void update(String username, String password, String realname)
        {
            Database.set(tableName, new Dictionary<string, string>()
            {
                {"username" , SQLite.filter(username)}
            }, new Dictionary<string, string>()
            {
                {"password" , DataObjects.Account.encodePassword(password)},
                {"realname", SQLite.filter(realname)}
            });
        }
    }
}