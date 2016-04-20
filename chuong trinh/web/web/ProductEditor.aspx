<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="ProductEditor.aspx.cs" Inherits="web.ProductEditor" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <a href="ProductManager.aspx" > &lt;&lt;Trở về</a> <br />
    <div id="content" runat="server" >
    <table style="width:95%; margin-left: 10px; margin-right: 10px; border: 1px solid #AAAAAA;">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                ID</td>
            <td>
                    <input id="input_id" type="text" disabled runat="server" /></td>
        </tr>
        <tr>
            <td>
                Tên sản phẩm</td>
            <td>
                    <input id="input_name" type="text" runat="server"  /></td>
        </tr>
        <tr>
            <td>
                Hình ảnh</td>
            <td>
                    <asp:FileUpload ID="FileUpload_image" runat="server" />
                    <input id="input_image" type="hidden" runat="server" />
                                </td>
        </tr>
        <tr>
            <td>
                Hệ điều hành</td>
            <td>
                    <asp:DropDownList ID="select_os" runat="server" 
        DataSourceID="SqlDataSource_os" DataTextField="name" DataValueField="id">
    </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                Phiên bản hệ điều hành</td>
            <td>
                    <input id="input_os_v" type="text" runat="server"  /></td>
        </tr>
        <tr>
            <td>
                Nhà sản xuất</td>
            <td>
                    <asp:DropDownList ID="select_manuf" runat="server" 
        DataSourceID="SqlDataSource_manuf" DataTextField="name" DataValueField="id">
    </asp:DropDownList>
   
            </td>
        </tr>
        <tr>
            <td>
                CPU</td>
            <td>
                    <input id="input_cpu" type="text" runat="server"  /></td>
        </tr>
        <tr>
            <td>
                Giá</td>
            <td>
                    <input id="input_price" type="text" runat="server"  /></td>
        </tr>
        <tr>
            <td>
                RAM</td>
            <td>
                    <input id="input_ram" type="text" runat="server"  /></td>
        </tr>
        <tr>
            <td>
                Camera</td>
            <td>
                    <input id="input_cam" type="text" runat="server"  /></td>
        </tr>
        <tr>
            <td>
                Pin</td>
            <td>
                    <input id="input_pin" type="text" runat="server"  /></td>
        </tr>
        <tr>
            <td>
                Màn hình</td>
            <td>
                    <input id="input_lcd" type="text" runat="server"  /></td>
        </tr>
        <tr>
            <td>
                Số lượng</td>
            <td>
                    <input id="input_quantity" type="text" runat="server"  /></td>
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
    </div>
                    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource_manuf" runat="server" 
        ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
        SelectCommand="SELECT [id], [name] FROM [manufacture]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource_os" runat="server" 
        ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
        SelectCommand="SELECT [name], [id] FROM [os]"></asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
