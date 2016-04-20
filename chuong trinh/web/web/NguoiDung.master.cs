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

public partial class UserControl_NguoiDung : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String usr = DataObjects.Account.getCurrentUserName();

        if (DataObjects.Account.isLoggedIn(usr))
        {
            String realname = "Undefined";
            realname = DataObjects.Account.getCurrentUser().Name;
        }

        /* Tao gio hang moi neu chua co*/
        if (Session["cart"] == null)
        {
            Session["cart"] = new Cart();
        }
    }
}
