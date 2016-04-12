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
            return browser.Browser + " " + browser.Version + " / " + browser.Platform;
        }

    }
}