<%@ Page Language="C#" MasterPageFile="~/NguoiDung.master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="web.Purchase" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
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
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                Anh/ chị</td>
            <td>
                <asp:TextBox ID="TextBox_Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="TextBox_Name" ErrorMessage="Bạn phải nhập tên"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Số điện thoại</td>
            <td>
                <asp:TextBox ID="TextBox_Phone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox_Phone" ErrorMessage="Phải nhập SĐT"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Địa chỉ nhận hàng</td>
            <td>
                <asp:TextBox ID="TextBox_Addr" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="TextBox_Addr" ErrorMessage="Không được bỏ trống"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Thời gian nhận hàng</td>
            <td>
                <asp:TextBox ID="TextBox_Date" runat="server"></asp:TextBox>
&nbsp;(Nhập đúng yyyy-mm-dd. Ví dụ 2017-07-31)
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="TextBox_Addr" ErrorMessage="Phải nhập ngày"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="TextBox_Date" 
                    ErrorMessage="Ngày tháng năm chưa đúng định dạng" 
                    ValidationExpression="[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button_TraSau" runat="server" onclick="Button_TraSau_Click" 
                    Text="Thanh toán khi nhận hàng" />
&nbsp;
                <asp:Button ID="Button_TraTruoc" runat="server" onclick="Button_TraTruoc_Click" 
                    Text="Thanh toán trực tuyến" />
            </td>
        </tr>
    </table>
</asp:Content>
