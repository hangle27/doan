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
using WebAPI;

namespace web
{
    public partial class Statics : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
 
        }

        public void loadStatic()
        {
            DateTime today = DateTime.Now;

            DateTime date_from = new DateTime(today.Year, today.Month, today.Day);
            DateTime date_to = new DateTime(today.Year, today.Month, today.Day).AddDays(1);

            if (DropDownList1.SelectedValue == "tomonth")
            {
                date_from = new DateTime(date_from.Year, date_from.Month, 1);
                date_to = new DateTime(date_to.Year, date_to.Month, 1).AddMonths(1);
            }

            if (DropDownList1.SelectedValue == "all")
            {
                date_from = new DateTime(1970, 1, 1);
                date_to = today;
            }

            String from = Coversation.DateTime2SQLFormat(date_from);
            String   to = Coversation.DateTime2SQLFormat(date_to);


            //Tổng số tiền và số hàng bán được.
            DataTable t = DataBase.Database.query(@"
SELECT       SUM(quantity) AS num, SUM(price * quantity) AS total, SUM(price_origin * quantity) AS total_o, SUM(price * quantity - price_origin * quantity) AS bonus
FROM            (SELECT       [order].purchased, [order].status, [order].date_end, order_detail.price_origin, order_detail.price, order_detail.quantity
                          FROM            [order] INNER JOIN
                                                   order_detail ON [order].id = order_detail.order_id
                          WHERE        ([order].purchased = 1) AND ([order].date_end >= '"+from+@"') AND ([order].date_end <= '"+to+@"')) AS derivedtbl_1
");
            Label_num.Text = t.Rows[0]["num"].ToString();
            Label_total.Text = t.Rows[0]["total"].ToString();
            Label_total_o.Text = t.Rows[0]["total_o"].ToString();
            Label_bonus.Text = t.Rows[0]["bonus"].ToString();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            loadStatic();
        }
    }
}
