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
using System.Text.RegularExpressions;

namespace web
{
    public partial class ProductSearch : System.Web.UI.Page
    {

        int[] prices = {0, 3, 5, 7, 9, 13, 15, 20, 999 };
        int[] screens = {0, 1, 2, 4, 6 };

        protected void Page_Load(object sender, EventArgs e)
        {
            init();
        }

        protected void init()
        {
            updateGUI();

            // Init Price Options
            DropDownList_Price.Items.Clear();
            DropDownList_Price.Items.Add( new ListItem( "dưới " + prices[1], "1"));
            for (int i = 2; i < prices.Length - 1; i++ )
            {
                DropDownList_Price.Items.Add( new ListItem("từ " + prices[i-1] + " đến " + prices[i], i.ToString()));
            }
            DropDownList_Price.Items.Add( new ListItem("trên " + prices[prices.Length-2], (prices.Length-1).ToString()));
        }

        protected void updateGUI()
        {
            //TextBox_ProductName.Enabled = CheckBox_ProductName.Checked;
            //CheckBoxList_Manufacture.Enabled = CheckBox_Manufacture.Checked;
            //CheckBoxList_OS.Enabled = CheckBox_OS.Checked;
        }

        protected void Button_Search_Click(object sender, EventArgs e)
        {
            CheckBox[] options = new CheckBox[]{ };
            String sql = buildQuery();
            TextBox1.Text = sql;

            DataTable t = DataBase.Database.query(sql);
            DataList1.DataSource = t;
            DataList1.DataBind();

        }

        public String buildQuery()
        {
            String sql = "SELECT * FROM product WHERE 1=1";

            if (CheckBox_ProductName.Checked)
            {
                sql += " AND name LIKE '%"+DataBase.SQLite.filter(TextBox_ProductName.Text)+"%'";
            }
            if (CheckBox_Manufacture.Checked)
            {
                sql += " AND ( ";

                Dictionary<String, String> t = new Dictionary<String, String>();
                for(int i = 0; i < CheckBoxList_Manufacture.Items.Count; i++)
                {
                    ListItem listItem = CheckBoxList_Manufacture.Items[i];
                    if (listItem.Selected == true)
                    {
                        String val = listItem.Value;
                        String txt = listItem.Text;
                        sql += "manufacture='" + val + "' OR ";
                    }
                    
                }
                sql += " 1 != 1 )";
            }
            if (CheckBox_OS.Checked)
            {
                sql += " AND ( ";

                Dictionary<String, String> t = new Dictionary<String, String>();
                for (int i = 0; i < CheckBoxList_OS.Items.Count; i++)
                {
                    ListItem listItem = CheckBoxList_OS.Items[i];
                    if (listItem.Selected == true)
                    {
                        String val = listItem.Value;
                        String txt = listItem.Text;
                        sql += "os='" + val + "' OR ";
                    }

                }
                sql += " 1 != 1 )";
            }

            if (CheckBox_Price.Checked)
            {
                int index = int.Parse(DropDownList_Price.SelectedValue);
                int from = prices[index-1];
                int to = prices[index];
                sql += " AND ( ";
                sql += " price >= '" + from + "'*1000000 AND price <= '" + to + "'*1000000";
                sql += " )";
            }
            if (CheckBox_LCD.Checked)
            {
                sql += " AND ( ";
                sql += " lcd_size >= '" + TextBox_LCDFrom.Text + "' AND lcd_size <= '" + TextBox_LCDTo.Text + "'";
                sql += " )";
            }



            return sql;
        }

        protected void CheckBox_Manufacture_CheckedChanged(object sender, EventArgs e)
        {
            updateGUI();
        }

        protected void CheckBox_OS_CheckedChanged(object sender, EventArgs e)
        {
            updateGUI();
        }

        protected void CheckBox_ProductName_CheckedChanged(object sender, EventArgs e)
        {
            updateGUI();
        }

        protected void CheckBox_LCD_CheckedChanged(object sender, EventArgs e)
        {
            updateGUI();
        }

        protected void CheckBox_Price_CheckedChanged(object sender, EventArgs e)
        {
            updateGUI();
        }
    }
}
