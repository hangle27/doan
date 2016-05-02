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

namespace web
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable u = new DataTable();
            DataTable t = DataBase.Database.get("product", "*", "id='" + WebAPI.Page._GET("id") + "'");
            if (t.Rows.Count > 0)
            {
                String price = t.Rows[0]["price"].ToString();
                u = DataBase.Database.get("product", "*", "price >= '" + price + "' - 1000000 AND price <= '" + price + "' + 1000000");
            }
            dlist_product.DataSource = u;
            dlist_product.DataBind();
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
                Session["cart"] = cart;
            }
            cart.Add(pid.Text, pname.Text, price.Text, 1);
            Response.Redirect("ShoppingCart.aspx");
        }

        protected void dlist_product_ItemCommand(object source, DataListCommandEventArgs e)
        {

        }
    }
}
