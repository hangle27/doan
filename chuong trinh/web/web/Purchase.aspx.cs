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
using System.Collections.Generic;
using DataObjects;
using DataBase;

namespace web
{
    public partial class Purchase : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button_TraSau_Click(object sender, EventArgs e)
        {
            String name = TextBox_Name.Text;
            String address = TextBox_Addr.Text;
            String phone = TextBox_Phone.Text;
            String date = TextBox_Date.Text;

            Database.insert("[order]",
                new Dictionary<String, String>()
                    {
                        { "customer_name",   name},
                        { "address",    address},
                        { "phone",   phone},
                        { "date_start", WebAPI.Coversation.DateTime2SQLFormat(DateTime.Now)},
                        { "date_end",     date},
                        { "status",   "0"},
                    }
            );

            //Select last row in a table
            DataTable t_inserted = Database.query("SELECT IDENT_CURRENT('order') AS id");
            if (t_inserted.Rows.Count > 0)
            {
                String o_id = t_inserted.Rows[0]["id"].ToString();
                Cart cart = (Cart)Session["cart"];
                for (int i = 0; i < cart.table.Rows.Count; i++)
                {
                    Database.insert("order_detail",
                        new Dictionary<String, String>()
                        {
                            { "order_id",   o_id},
                            { "product_id",    cart.table.Rows[i]["product_id"].ToString()},
                            { "quantity",   cart.table.Rows[i]["quantity"].ToString()},
                            { "price", cart.table.Rows[i]["price"].ToString() }
                        }
                    );

                    DataTable t_q = DataBase.Database.get("product", "quantity", "id='" + cart.table.Rows[i]["product_id"].ToString() + "'");
                    int quantity = (int)t_q.Rows[0]["quantity"];

                    Database.set("product",
                        new Dictionary<String, String>()
                        {
                            { "id",    cart.table.Rows[i]["product_id"].ToString()}
                        },
                        new Dictionary<String, String>()
                        {
                            { "quantity",   quantity - int.Parse(cart.table.Rows[i]["quantity"].ToString()) + ""},
                        }
                    );
                }
                //Xóa giỏ hàng
                Session["cart"] = null;
            }
            

            Response.Redirect("OrderSuccess.aspx");
        }

        protected void Button_TraTruoc_Click(object sender, EventArgs e)
        {

        }
    }
}
