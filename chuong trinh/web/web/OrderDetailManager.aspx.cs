using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Collections.Generic;

namespace web
{
    public partial class OrderDetailManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CheckBox_sended_CheckedChanged(object sender, EventArgs e)
        {

            DataBase.Database.set("order",
                new Dictionary<String, String>()
                    {
                        { "id", WebAPI.Page._GET("id")}
                    },
                new Dictionary<String, String>()
                    {
                        { "status",   "1"}
                    }
            );


            CheckBox o = (CheckBox)sender;
            o.Enabled = false;
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void CheckBox_sended_CheckedChanged1(object sender, EventArgs e)
        {

        }

        protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
        {
            
        }
    }
}
