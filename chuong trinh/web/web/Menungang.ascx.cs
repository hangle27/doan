using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class UserControl_Menungang : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String usr = WebAPI.Page.getCookie("username");
        if (usr == null)
        {
            usr = "";
        }

        if (DataObjects.Account.isLoggedIn(usr))
        {
            String realname = "Undefined";
            realname = DataObjects.Account.getCurrentUser().Name;
            greeting.HRef = "Profile.aspx";
            greeting.InnerHtml = "Xin chào, " + realname + " !";
            o_logout.Visible = true;
            o_regedit.Visible = false;
        }
        else
        {
            o_logout.Visible = false;
        }


    }

}
