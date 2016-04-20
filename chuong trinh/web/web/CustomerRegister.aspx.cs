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
using DataBase;
using System.Collections.Generic;

namespace web
{
    public partial class CustomerRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Database.insert("users",
                new Dictionary<String, String>()
                {
                    { "name",   input_name.Value},
                    { "address",    input_addr.Value},
                    { "phone",   input_phone.Value},
                    { "email", input_email.Value},
                    { "gender",     select_gender.SelectedValue},
                    { "type",   "1"},
                }
            );
            //Select last row in a table
            DataTable t_inserted = Database.query("SELECT IDENT_CURRENT('users') AS id");
            if (t_inserted.Rows.Count > 0)
            {
                String u_id = t_inserted.Rows[0]["id"].ToString();
                Database.insert("account",
                    new Dictionary<String, String>()
                    {
                        { "user_id",   u_id},
                        { "username",    ""},
                        { "password",   ""},
                        { "realname", ""}
                    }
                );
            }

            Response.Redirect("Account.aspx?action=register&email=" + input_email.Value + "&name=" + input_name.Value);


        }
    }
}
