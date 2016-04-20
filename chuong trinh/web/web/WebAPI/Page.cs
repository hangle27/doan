using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace WebAPI
{
    /// <summary>
    /// Các chức năng liên quan đến một trang web
    /// </summary>
    public class Page
    {

        /// <summary>
        /// Lấy một cookie từ trình duyệt web
        /// </summary>
        /// <param name="key">Tên của cookie</param>
        /// <returns>Giá trị của cookie</returns>
        public static String getCookie(String key)
        {
            if (HttpContext.Current.Request.Cookies.Get(key) != null)
            {
                return HttpContext.Current.Request.Cookies.Get(key).Value;
            }
            return "";
        }

        /// <summary>
        /// Đặt cookie vào trình duyệt web
        /// </summary>
        /// <param name="key">Tên của cookie</param>
        /// <param name="value">Giá trị của cookie</param>
        public static void setCookie(String key, String value)
        {
            HttpCookie c = new HttpCookie(key, value);
            HttpContext.Current.Response.SetCookie(c);
        }

        /// <summary>
        /// Đặt cookie vào trình duyệt web
        /// </summary>
        /// <param name="key">Tên của cookie</param>
        /// <param name="value">Giá trị của cookie</param>
        /// <param name="time">Thời gian tồn tại (giây)</param>
        public static void setCookie(String key, String value, int time)
        {
            HttpCookie c = new HttpCookie(key, value);
            c.Expires = DateTime.Now.AddSeconds(time);
            HttpContext.Current.Response.SetCookie(c);
        }

        /// <summary>
        /// Xóa cookie
        /// </summary>
        /// <param name="key">Tên của cookie</param>
        public static void removeCookie(String key)
        {
            setCookie(key, "", -1);
        }

        public static String getUserAgent()
        {
            return HttpContext.Current.Request.UserAgent;
        }

        public static String getDevice()
        {
            System.Web.HttpBrowserCapabilities browser = HttpContext.Current.Request.Browser;
            return browser.Browser + " " + browser.Version + " / " + getPlatform(getUserAgent());
        }

        public static String getPlatform(String ua)
        {
            if (ua.Contains("Windows NT 5.1") || ua.Contains("Windows NT 5.2"))
                return "Windows XP";

            if (ua.Contains("Windows NT 6.0"))
                return "Windows Vista";

            if (ua.Contains("Windows NT 6.1"))
                return "Windows 7";

            if (ua.Contains("Windows NT 6.2"))
                return "Windows 8";

            if (ua.Contains("Windows NT 6.3"))
                return "Windows 8.1";

            if (ua.Contains("Windows NT 10"))
                return "Windows 10";

            //fallback to basic platform:
            return getDevice();
        }


        /// <summary>
        /// Get query string
        /// </summary>
        /// <param name="name">Name of query</param>
        /// <returns>Value by name</returns>
        public static String _GET(String name)
        {
            String value = HttpContext.Current.Request.QueryString[name];
            if(value == null)
            {
                value = "";
            }
            return value;
        }

    }
}