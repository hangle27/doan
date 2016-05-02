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
using DataObjects;

namespace web
{
    public partial class CustomerManager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton_Add_Click(object sender, EventArgs e)
        {
            //Get data in foorer row
            GridViewRow footer = GridView1.FooterRow;
            String i_Name = ((TextBox)footer.FindControl("TextBox_Name")).Text;
            String i_Email = ((TextBox)footer.FindControl("TextBox_Email")).Text;
            String i_Address = ((TextBox)footer.FindControl("TextBox_Address")).Text;
            String i_Phone = ((TextBox)footer.FindControl("TextBox_Phone")).Text;
            String i_Gender = ((DropDownList)footer.FindControl("select_UserGender")).SelectedValue;
            String i_Type = "3"; // Customer

            //Insert in database
            DataBase.Database.insert(
                "users",
                new Dictionary<string, string>()
                {
                    {"name", i_Name},
                    {"email", i_Email},
                    {"address", i_Address},
                    {"phone", i_Phone},
                    {"type", i_Type},
                    {"gender", i_Gender}
                }
            );

            GridView1.DataBind();
        }
    }
}
