<%@ Page Language="C#" MasterPageFile="~/NguoiDung.master" AutoEventWireup="true" CodeBehind="CustomerRegister.aspx.cs" Inherits="web.CustomerRegister" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <br />
    </p>
    
        <table style="width:95%; margin-left: 10px; margin-right: 10px; border: 1px solid #AAAAAA;">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Họ và tên</td>
            <td>
                    <input id="input_name" type="text" runat="server" /></td>
        </tr>
        <tr>
            <td>
                Email</td>
            <td>
                    <input id="input_email" type="text" runat="server"  /></td>
        </tr>
        <tr>
            <td>
                Điện thoại</td>
            <td>
                    <input id="input_image" type="hidden" runat="server" />
                    <input id="input_phone" type="text" runat="server"  /></td>
        </tr>
        <tr>
            <td>
                Giới tính</td>
            <td>
                    <asp:DropDownList ID="select_gender" runat="server" 
        DataSourceID="SqlDataSource_GT" DataTextField="name" DataValueField="id">
    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_GT" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
                        SelectCommand="SELECT * FROM [gender]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
                Địa chỉ</td>
            <td>
                    <input id="input_addr" type="text" runat="server"  /></td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr style=" ">
            <td colspan="2" style="text-align: center; border: 1px solid #AAAAAA;">
                    <asp:Button ID="Button1" runat="server" Text="OK" onclick="Button1_Click" />
                    </td>
        </tr>
    </table>    
</asp:Content>
