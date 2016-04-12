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
using web.DataObjects;

public partial class UserControl_KhungPhai : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Cart cart = (Cart)Session["cart"];
        /* Tao gio hang moi neu chua co*/
        if (cart == null)
        {
            cart = new Cart();
        }
        lblSL.Text = cart.getProductCount().ToString();
        lbTongTien.Text = cart.getPurchase().ToString();
    }
}
