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

namespace web
{
    public partial class ProductEditor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Fill data onloads
            if (input_id.Value == "")
            {
                LoadData();
            }
        }

        public void LoadData()
        {
            DataTable t = DataBase.Database.get("product", "*",
                new Dictionary<string, string>()
                {
                    { "id", WebAPI.Page._GET("id")}
                }
            );
            
            if (t.Rows.Count > 0)
            {
                DataRow r = t.Rows[0];
                input_id.Value = r["id"].ToString();
                input_name.Value = r["name"].ToString();
                input_image.Value = r["image"].ToString();
                select_manuf.SelectedValue = r["manufacture"].ToString();
                select_os.SelectedValue = r["os"].ToString();
                input_lcd.Value = r["lcd"].ToString();
                input_os_v.Value = r["os_version"].ToString();
                input_pin.Value = r["battery"].ToString();
                input_cpu.Value = r["cpu"].ToString();
                input_ram.Value = r["ram"].ToString();
                input_cam.Value = r["camera"].ToString();
                input_price.Value = r["price"].ToString();
                input_quantity.Value = r["quantity"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            saveUploaded();
            String updateID = input_id.Value;

            if (input_id.Value != "")
            {

                DataBase.Database.set("product",
                    new Dictionary<String, String>()
                    {
                        { "id", input_id.Value}
                    },
                    new Dictionary<String, String>()
                    {
                        { "name",   input_name.Value},
                        { "cpu",    input_cpu.Value},
                        { "ram",   input_ram.Value},
                        { "camera",   input_cam.Value},
                        { "os",     select_os.SelectedValue},
                        { "os_version",   input_os_v.Value},
                        { "manufacture",   select_manuf.SelectedValue},
                        { "battery",    input_pin.Value},
                        { "price",  input_price.Value},
                        { "lcd",   input_lcd.Value},
                        { "lcd_size", MyFunction.getInchFromLCD(input_lcd.Value) },
                        { "image",   input_image.Value},
                        { "quantity",   input_quantity.Value},
                    }
                );
            }
            else
            {
                DataBase.Database.insert("product",
                    new Dictionary<String, String>()
                    {
                        { "name",   input_name.Value},
                        { "cpu",    input_cpu.Value},
                        { "ram",   input_ram.Value},
                        { "camera",   input_cam.Value},
                        { "os",     select_os.SelectedValue},
                        { "os_version",   input_os_v.Value},
                        { "manufacture",   select_manuf.SelectedValue},
                        { "battery",    input_pin.Value},
                        { "price",  input_price.Value},
                        { "lcd",   input_lcd.Value},
                        { "lcd_size", MyFunction.getInchFromLCD(input_lcd.Value) },
                        { "image",   input_image.Value},
                        { "quantity",   input_quantity.Value},
                    }
                );

                //Get last product, have just inserted
                DataTable lastRow = DataBase.Database.query("SELECT TOP 1 * FROM product ORDER BY ID DESC");
                if (lastRow.Rows.Count > 0)
                {
                    updateID = lastRow.Rows[0]["id"].ToString();
                }

            }



            content.InnerHtml = "<font color='green' >Cập nhật dữ liệu thành công</font>, <a href='ProductDetail.aspx?id="+ updateID +"' target='_blank'>xem thử</a>";

        }


        public void saveUploaded()
        {
            String img_path = "/web/images/products/" + FileUpload_image.FileName;
            if (FileUpload_image.FileName != "")
            {
                String path = Server.MapPath(img_path);
                FileUpload_image.PostedFile.SaveAs(path);
                input_image.Value = img_path;
            }
          
        }


    }

        


}
