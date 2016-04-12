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
using web.DataObjects;

namespace web
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            Label pid = (Label)e.Item.FindControl("lb_id");
            Label pname = (Label)e.Item.FindControl("lnk_name");
            Label price = (Label)e.Item.FindControl("lb_price");

            Cart cart = (Cart)Session["cart"];
            /* Tao gio hang moi neu chua co*/
            if (cart == null)
            {
                cart = new Cart();
            }
            cart.Add(pid.Text, pname.Text, price.Text, 1);
            Response.Redirect("ShoppingCart.aspx");
        }
    }
}
