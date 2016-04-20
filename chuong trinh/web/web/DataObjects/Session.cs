using DataBase;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace DataObjects
{
    public class Session
    {
        public static String create(String account_id)
        {
            String value = randomString();
            //Database.query("INSERT INTO session(value, account_id, time, device) VALUES('"+value+"', '"+account_id+"', '"+DateTime.Now.ToString()+"', '"+WebAPI.Page.getUserAgent()+"')");
            Database.insert("session", new Dictionary<string, string>()
                {
                    { "value", value},
                    { "account_id", account_id},
                    { "time", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")},
                    { "device", WebAPI.Page.getDevice()}
                });
            return value;
        }
        public static Boolean exists(String account_id, String session)
        {
            DataTable t = Database.get("session", "id", "account_id='" + SQLite.filter(account_id) + "' AND value='" + SQLite.filter(session) + "';");
            return t.Rows.Count > 0;
        }
        public static void remove(String account_id, String session)
        {
            Database.query("DELETE FROM session WHERE account_id='" + SQLite.filter(account_id) + "' AND value='" + SQLite.filter(session) + "';");
        }
        public static String randomString()
        {
            String str = "";
            String rand = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
            Random r = new Random();
            for( int i = 0; i < 29; i++)
            {
                str += rand[r.Next(0, rand.Length)];
            }
            return str;
        }

        public static String getDevice()
        {
            return "";
        }

    }
}