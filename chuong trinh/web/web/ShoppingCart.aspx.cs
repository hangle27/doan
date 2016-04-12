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
        Cart o;
        protected void Page_Load(object sender, EventArgs e)
        {
            o = (Cart)Session["cart"];
            if (o == null)
            {
                o = new Cart();
            }

            Session["cart"] = o;

            GridView1.DataSource = ((Cart)Session["cart"]).table;
            GridView1.DataBind();

            l_total.Text = o.getPurchase().ToString();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            object a = e.NewValues;
            o.table.Rows[e.RowIndex]["quantity"] = ((TextBox)(row.Cells[3].FindControl("TextBox1"))).Text;
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {


            o.table.Rows.RemoveAt(e.RowIndex);
            GridView1.DataBind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataBind();
        }
    }
}
