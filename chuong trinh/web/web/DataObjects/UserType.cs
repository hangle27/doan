using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DataObjects
{
    public class UserType
    {

        public static String Customer = "hs";
        public static String Employee = "gv";
        public static String Admin = "ad";

        public static String getByUserName(String userName)
        {
            if (userName == null || userName == "")
                return "##";
            String type = userName.Substring(0, 2);
            return type;
        }
    }
}