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
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Cart o = (Cart)Session["cart"];
            if (o == null)
            {
                o = new Cart();
            }

            Session["cart"] = o;

            GridView1.DataSource = ((Cart)Session["cart"]).table;
            GridView1.DataBind();
        }
    }
}
