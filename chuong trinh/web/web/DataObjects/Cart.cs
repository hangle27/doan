using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;

namespace web.DataObjects
{
    public class Cart
    {
        public DataTable table;
        public Cart()
        {
            table = new DataTable("cart");
            table.Columns.Add("product_id");
            table.Columns.Add("product_name");
            table.Columns.Add("price");
            table.Columns.Add("quantity");
            table.Columns["product_id"].Unique = true;
        }

        public void Add(Object id, Object name, Object price, Object quantity)
        {
            table.Rows.Add(new object[]{id, name, price, quantity});
        }
    }
}
