<%@ Page Language="C#" MasterPageFile="~/NguoiDung.master" AutoEventWireup="true" CodeBehind="CustomerRegister.aspx.cs" Inherits="web.CustomerRegister" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_title" runat="server">
    <style type="text/css">
        .style1
        {
            height: 59px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
    </p>
        <div id="t_content" runat="server" >
        <div id="t_msg_err" runat="server" ></div>
        <br />
        <table runat="server" id="t_form_reg" style="width:95%; margin-left: 10px; margin-right: 10px; border: 1px solid #AAAAAA;">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Họ và tên</td>
            <td>
                    <input id="input_name" type="text" runat="server" /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="input_name" ErrorMessage="Hãy nhập tên bạn"></asp:RequiredFieldValidator>
            </td>
            <td>
                    Tên đăng nhập</td>
            <td>
                    <input id="input_uname" type="text" runat="server" /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="input_uname" 
                        ErrorMessage="Không được để trống tên đăng nhập"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Email</td>
            <td>
                    <input id="input_email" type="text" runat="server"  /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="input_email" ErrorMessage="Hãy nhập email"></asp:RequiredFieldValidator>
            </td>
            <td>
                    Mật khẩu</td>
            <td>
                    <input id="input_upass" type="text" runat="server" /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="input_upass" ErrorMessage="Không được để trống password"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Điện thoại</td>
            <td>
                    <input id="input_image" type="hidden" runat="server" />
                    <input id="input_phone" type="text" runat="server"  /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="input_phone" ErrorMessage="Hãy nhập số điện thoại"></asp:RequiredFieldValidator>
            </td>
            <td>
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                Giới tính</td>
            <td class="style1">
                    <asp:DropDownList ID="select_gender" runat="server" 
        DataSourceID="SqlDataSource_GT" DataTextField="name" DataValueField="id">
    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_GT" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
                        SelectCommand="SELECT * FROM [gender]"></asp:SqlDataSource>
            </td>
            <td class="style1">
                    </td>
            <td class="style1">
                    &nbsp;</td>
        </tr>
        <tr>
            <td>
                Địa chỉ</td>
            <td>
                    <input id="input_addr" type="text" runat="server"  /><br />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="input_addr" ErrorMessage="Hãy nhập địa chỉ"></asp:RequiredFieldValidator>
            </td>
            <td>
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
            <td>
                    &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr style=" ">
            <td colspan="4" style="text-align: center; border: 1px solid #AAAAAA;">
                    <asp:Button ID="Button1" runat="server" Text="OK" onclick="Button1_Click" />
                    </td>
        </tr>
    </table>    
        </div>
</asp:Content>
