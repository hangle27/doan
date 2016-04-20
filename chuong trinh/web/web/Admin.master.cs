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
using DataObjects;

public partial class UserControl_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        User usr = DataObjects.Account.getCurrentUser();
        // if not login, redirect to login page
        if (!Account.isLoggedIn(Account.getCurrentUserName()))
        {
            Response.Redirect("/Account.aspx?action=login");
        }
        //  Access Deny, non-admin user
        if (! (usr.Type == UserType.Admin || usr.Type == UserType.Employee))
        {
            Response.Redirect("/AccessDenied.aspx");
        }
    }
}
