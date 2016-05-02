using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Text.RegularExpressions;

namespace web
{
    public class MyFunction
    {
        public static String getInchFromLCD(String lcd)
        {
            String lcd_size = Regex.Match(lcd, "([\\d\\.]+)\\\"").Groups[1].Value;
            return lcd_size;
        }
    }
}
