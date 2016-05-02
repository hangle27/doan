<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="Statics.aspx.cs" Inherits="web.Statics" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_title" runat="server">
    <style type="text/css">
        .style1
        {
            height: 23px;
            text-align: right;
        }
        .style2
        {
            height: 23px;
        }
        .style3
        {
            width: 197px;
        }
        .style4
        {
            height: 23px;
            text-align: right;
            width: 117px;
        }
        .style5
        {
            width: 117px;
        }
        .style6
        {
            height: 25px;
        }
        .style7
        {
            height: 25px;
            text-align: right;
            width: 117px;
        }
        .style8
        {
            height: 25px;
            text-align: right;
        }
        .style9
        {
            width: 197px;
            height: 21px;
        }
        .style10
        {
            width: 117px;
            height: 21px;
        }
        .style11
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td class="style1">
                &nbsp;</td>
             </tr>
             <tr>
             <td colspan="3">
                                       Lọc kết quả
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                                           onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>-----------</asp:ListItem>
                    <asp:ListItem Value="tomonth">Tháng này</asp:ListItem>
                    <asp:ListItem Value="today">Hôm nay</asp:ListItem>
                    <asp:ListItem Value="all">Tất cả</asp:ListItem>
                </asp:DropDownList>
                                       &nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    </td>
                                                <td class="style7">
                                                    </td>
                                                <td class="style8">
                                                    </td>
                                            </tr>
                                            <tr>
                                                <td class="style6">
                                                    Số sản phẩm đã bán                                                </td>
            <td class="style7">
                <asp:Label ID="Label_num" runat="server" Text="------"></asp:Label>
            </td>
            <td class="style8">
            </td>
        </tr>
        <tr>
            <td class="style9">
                Số tiền thu được theo giá bán</td>
            <td class="style10" style="text-align: right">
                <asp:Label ID="Label_total" runat="server" Text="------"></asp:Label>
            </td>
            <td class="style11">
                </td>
        </tr>
        <tr>
            <td class="style3">
                Số tiền theo giá gốc</td>
            <td class="style5" style="text-align: right">
                <asp:Label ID="Label_total_o" runat="server" Text="------"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                Doanh thu</td>
            <td class="style5" style="text-align: right">
                <asp:Label ID="Label_bonus" runat="server" style="text-align: right" 
                    Text="------"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
