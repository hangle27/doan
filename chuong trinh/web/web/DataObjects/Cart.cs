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

namespace DataObjects
{
    public class Cart
    {
        public DataTable table;
        public Cart()
        {
            //Initialaze Cart
            table = new DataTable("cart");
            table.Columns.Add("product_id");
            table.Columns.Add("product_name");
            table.Columns.Add("price");
            table.Columns.Add("quantity");
            table.Columns["product_id"].Unique = true;
        }

        public void Add(Object id, Object name, Object price, Object quantity)
        {
            //Check if exist
            if (table.Select("product_id=" + id).Length == 0)
            {
                DataTable t_q = DataBase.Database.get("product", "quantity", "id='" + id + "'");
                int Lquantity = (int)t_q.Rows[0]["quantity"];
                //check if quantity > 0
                if (Lquantity > 0)
                {
                    table.Rows.Add(new object[] { id, name, price, quantity });
                }
            }
        }


        public int setQuantity(String product_id, int n)
        {
            DataTable t_q = DataBase.Database.get("product", "quantity", "id='" + product_id + "'");
            int quantity = (int)t_q.Rows[0]["quantity"];

            //check enought
            if (n <= quantity)
            {
                //check existing
                if (table.Select("product_id=" + product_id).Length > 0)
                {
                    table.Select("product_id=" + product_id)[0]["quantity"] = n;
                    return quantity;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return quantity;
            }
        }

        public int getPurchase()
        {
            int money = 0;
            foreach (DataRow row in table.Rows)
            {
                int price = Int32.Parse(row["price"].ToString());
                int quantity = Int32.Parse(row["quantity"].ToString());
                money += price * quantity;
            }
            return money;
        }

        public int getProductCount()
        {
            return table.Rows.Count;
        }
    }
}
