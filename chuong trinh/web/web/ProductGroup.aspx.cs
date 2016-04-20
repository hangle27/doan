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
using System.Collections.Generic;
using DataObjects;

public partial class Page_ProductGroup : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }


        
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {

    }
    protected void dlist_product_ItemCommand(object source, DataListCommandEventArgs e)
    {
        Label pid = (Label)e.Item.FindControl("lb_id");
        HyperLink pname = (HyperLink)e.Item.FindControl("lnk_name");
        Label price = (Label)e.Item.FindControl("lb_price");

        Cart cart = (Cart)Session["cart"];
        /* Tao gio hang moi neu chua co*/
        if (cart == null)
        {
            cart = new Cart();
            Session["cart"] = cart;
        }
        cart.Add(pid.Text, pname.Text, price.Text, 1);
        Response.Redirect("ShoppingCart.aspx");
    }
}