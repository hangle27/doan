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
    public partial class ManufactureManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            //Get data in foorer row
            GridViewRow footer = GridView1.FooterRow;
            String i_Name = ((TextBox)footer.FindControl("TextBox_Name")).Text;

            //Insert in database
            DataBase.Database.insert(
                "manufacture",
                new Dictionary<string, string>()
                {
                    {"name", i_Name},
                }
            );

            GridView1.DataBind();
        }
    }
}
