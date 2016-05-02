using DataBase;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using WebAPI;

namespace DataObjects
{
    /// <summary>
    /// Tài khoản người dùng
    /// </summary>
    public class Account
    {


        public static String Login_URL = "Account.aspx?action=login";
        public static String Logout_URL = "Account.aspx?action=logout";
        public static String Register_URL = "Account.aspx?action=register";

        public static String tableName = "account";


        public static String getAccountId(String username)
        {
            DataTable t = DataBase.Database.get("account", "*", "username='" + username + "'");
            String account_id = "undefined";
            if (t.Rows.Count > 0)
            {
                account_id = t.Rows[0]["id"].ToString();
            }
            return account_id;
        }


        /// <summary>
        /// Kiểm tra đăng nhập
        /// </summary>
        /// <param name="usr">Tên tài khoản</param>
        /// <param name="pwd">Mật khẩu</param>
        /// <returns>Thành công: true, Thất bại: false</returns>
        public static Boolean checkAuth(String usr, String pwd)
        {
            DataTable t = Database.get(tableName, "id", "username='" + usr + "' AND password='" + Encrypt.md5(pwd) + "'");
            return t.Rows.Count > 0;
        }

        /// <summary>
        /// Đăng nhập
        /// </summary>
        /// <param name="usr">Tên tài khoản</param>
        /// <param name="pwd">Mật khẩu</param>
        /// <returns>Thành công: true, Thất bại: false</returns>
        public static Boolean login(String username, String password)
        {
            if (checkAuth(username, password))
            {
                String account_id = Account.getAccountId(username);
                String session_value = Session.create(account_id);
                WebAPI.Page.setCookie("username", username, 84600);
                WebAPI.Page.setCookie("session", session_value, 84600);
                return true;
            }
            else
            {
                return false;
            }
        }


        /// <summary>
        /// Kiểm tra xem có đăng ở trạng thái đăng nhập hay không
        /// </summary>
        /// <param name="username">Tên người dùng</param>
        /// <returns>true|false</returns>
        public static bool isLoggedIn(String username)
        {
            DataTable t = DataBase.Database.get("account", "*", "username='" + username + "'");
            if (t.Rows.Count > 0)
            {
                String account_id = t.Rows[0]["id"].ToString();

                String session = WebAPI.Page.getCookie("session");
                if (session == null)
                    session = "";
                if (Session.exists(account_id, session))
                    return true;
            }
            return false;
        }

        /// <summary>
        /// Đăng xuất
        /// </summary>
        public static void logout()
        {
            String account_id = Account.getAccountId(WebAPI.Page.getCookie("username"));
            Session.remove(account_id, WebAPI.Page.getCookie("session"));
        }

        /// <summary>
        /// Tạo tài khoản mới
        /// </summary>
        /// <param name="username">Tên tài khoản</param>
        /// <param name="password">Mật khẩu</param>
        /// <param name="realname">Tên thật</param>
        /// <returns>Thông báo lỗi nếu có</returns>
        public static String register(String username, String password, String realname)
        {
            if (!check_username(username))
                return "Tên đăng nhập ít nhất 3 kí tự, chỉ chứa kí tự chữ, gạch dưới, và số.";
            if(!check_password(password))
            {
                return "Mật khẩu ít nhất 6 kí tự.";
            }
            if(!check_realname(realname))
            {
                return "Tên không được chứa các kí tự đặc biệt.";
            }

            //Database.query("INSERT INTO user(username, password, email, realname) VALUES('" + SQLite.filter(username) + "', '" + SQLite.filter(WebAPI.Encrypt.md5(password)) + "', '" + SQLite.filter(email) + "', '" + SQLite.filter(realname) + "')");

            add(username, password, realname);
            
            return "";

        }

        public static String encodePassword(String password)
        {
            return WebAPI.Encrypt.md5(password);
        }

        public static void add(String username, String password, String realname)
        {
            Database.insert(tableName, new Dictionary<string, string>()
            {
                {"username" , SQLite.filter(username)},
                {"password" , encodePassword(password)},
                {"realname", SQLite.filter(realname)}
            });
        }

        public static void delete(String username)
        {
            Database.delete(tableName, new Dictionary<string, string>()
            {
                {"username" , SQLite.filter(username)}
            });
        }

        public static void setPassword(String username, String password)
        {
            Database.set(tableName, new Dictionary<string, string>()
            {
                {"username" , SQLite.filter(username)}
            }, new Dictionary<string, string>()
            {
                {"password" , encodePassword(password)}
            });
        }

        public static void setDisplayName(String username, String displayName)
        {
            Database.set(tableName, new Dictionary<string, string>()
            {
                {"username" , SQLite.filter(username)}
            }, new Dictionary<string, string>()
            {
                {"realname" , SQLite.filter(displayName)}
            });
        }

        public static bool check_username(String usr)
        {
            return !Regex.IsMatch(usr, "[^a-z0-9_]", RegexOptions.IgnoreCase);
        }
        public static bool check_password(String pwd)
        {
            return ! (pwd.Length < 6);
        }
        public static bool check_realname(String rname)
        {
            return true;
        }

        public static User getCurrentUser()
        {
            String username = WebAPI.Page.getCookie("username");
            DataTable t = DataBase.Database.get("account", "*", "username='"+username+"'");
            User currentUser = null;
            if (t.Rows.Count > 0)
            {
                String user_id = t.Rows[0]["user_id"].ToString();
                currentUser = new User(user_id);
            }
            return currentUser;
        }

        public static String getCurrentUserName()
        {
            String userName = WebAPI.Page.getCookie("username");
            if (userName == null)
                userName = "";
            return userName;
        }

        public static bool exist(String username)
        {
            return Database.get("account", "*", "username='" + username + "'").Rows.Count > 0;
        }



    }
}