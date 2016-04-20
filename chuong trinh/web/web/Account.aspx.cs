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
    public partial class Auth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            init();

            String usr;
            String pwd;
            usr = WebAPI.Page.getCookie("username");
            //Action Center
            if (Request.QueryString.Get("action") != null)
            {
                switch (Request.QueryString.Get("action"))
                {
                    case "logout":
                        Account.logout();
                        //Reload page after logout
                        Response.Redirect(Request.UrlReferrer.ToString());
                        break;
                    case "login":
                        Page.Title = "Đăng nhập";
                        if (Request.Form.Count > 0)
                        {
                            if (!Account.isLoggedIn(usr))
                            {
                                usr = Request.Form.Get("input_login_username");
                                pwd = Request.Form.Get("input_login_password");
                                if (usr == null)
                                    usr = "";
                                if (pwd == null)
                                    pwd = "";
                                if (Account.login(usr, pwd))
                                {
                                    form_login.Visible = false;
                                    Greeeting.Text = "Đăng nhập thành công. Xin đợi hoặc bấm vào <a href='" + Request.UrlReferrer + "'>đây</a>.";
                                    Header.Controls.Add(new System.Web.UI.HtmlControls.HtmlMeta { HttpEquiv = "refresh", Content = "3;URL=" + Request.UrlReferrer + "" });
                                }
                                else
                                {
                                    Greeeting.Text = "Sai tên đăng nhập hoặc mật khẩu !";
                                }

                            }
                        }
                        else
                        {
                            form_login.Visible = true;
                        }
                        break;
                    case "register":
                        if (Request.Form.Count > 0)
                        {
                            String kq = Account.register(Request.Form.Get("reg_username"), Request.Form.Get("reg_password"), Request.Form.Get("reg_realname"));
                            if (kq == "")
                            {
                                form_register.Visible = false;
                                kq = "Đăng kí thành công, <a href='" + Account.Login_URL + "' >Đăng nhập.</a>";
                            }
                            Greeeting.Text = kq;
                        }
                        else
                        {
                            form_register.Visible = true;

                        }
                        break;
                    default:
                        form_login.Visible = true;
                        form_register.Visible = true;
                        break;
                }

            }
            else
            {
                form_login.Visible = true;
                form_register.Visible = true;
            }

            if (usr == null || usr == "")
            {
                return;
            }
            if (Account.isLoggedIn(usr))
            {
                Response.Redirect("Default.aspx");

                String realname = "Undefined";
                realname = Account.getCurrentUser().Name;
                Greeeting.Text = "Hello, " + realname + "!, <a href='?action=logout' >Đăng xuất</a>";
                form_login.Visible = false;
                form_register.Visible = false;
            }


        }

        public void init()
        {
            //SitePreLoad.init();
            form_login.Visible = false;
            form_register.Visible = false;

            reg_email.Value = WebAPI.Page._GET("email");
            reg_realname.Value = WebAPI.Page._GET("name");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}
