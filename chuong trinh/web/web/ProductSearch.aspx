<%@ Page Language="C#" MasterPageFile="~/NguoiDung.master" AutoEventWireup="true" CodeBehind="ProductSearch.aspx.cs" Inherits="web.ProductSearch" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_title" runat="server">
    <style type="text/css">
        .style1
        {
            width: 161px;
        }
        .style2
        {
            width: 305px;
        }
        .style3
        {
            width: 161px;
            height: 12px;
        }
        .style4
        {
            width: 305px;
            height: 12px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="t" style="width: 100%; border-collapse: collapse; border: 1px solid #AAA">
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:CheckBox ID="CheckBox_ProductName" runat="server" Text="Tên sản phẩm" 
                    oncheckedchanged="CheckBox_ProductName_CheckedChanged" />
            </td>
            <td class="style2">
                <asp:TextBox ID="TextBox_ProductName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:CheckBox ID="CheckBox_Manufacture" runat="server" Text="Nhà sản xuất" 
                    oncheckedchanged="CheckBox_Manufacture_CheckedChanged" />
            </td>
            <td class="style2">
                <asp:CheckBoxList ID="CheckBoxList_Manufacture" runat="server" 
                    DataSourceID="SqlDataSource_Manufacture" DataTextField="name" 
                    DataValueField="id" RepeatDirection="Horizontal" RepeatLayout="Flow">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:CheckBox ID="CheckBox_OS" runat="server" Text="Hệ điều hành" 
                    oncheckedchanged="CheckBox_OS_CheckedChanged" />
            </td>
            <td class="style2">
                <asp:CheckBoxList ID="CheckBoxList_OS" runat="server" 
                    DataSourceID="SqlDataSource_OS" DataTextField="name" 
                    DataValueField="id" RepeatDirection="Horizontal" RepeatLayout="Flow">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:CheckBox ID="CheckBox_Price" runat="server" Text="Mức giá" 
                    AutoPostBack="True" oncheckedchanged="CheckBox_Price_CheckedChanged" />
                </td>
            <td class="style4">
                &nbsp;
                <asp:DropDownList ID="DropDownList_Price" runat="server">
                </asp:DropDownList>
&nbsp;</td>
        </tr>
        <tr>
            <td class="style3">
                <asp:CheckBox ID="CheckBox_LCD" runat="server" Text="Màn hình" 
                    AutoPostBack="True" oncheckedchanged="CheckBox_LCD_CheckedChanged" />
                </td>
            <td class="style4">
                từ                 <asp:TextBox ID="TextBox_LCDFrom" runat="server" MaxLength="3" Width="43px">0</asp:TextBox>
            &nbsp;(inch) đến
                <asp:TextBox ID="TextBox_LCDTo" runat="server" MaxLength="3" Width="42px">0</asp:TextBox>
            &nbsp;(icnh)<br />
&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="TextBox_LCDFrom" ErrorMessage="Không hợp lệ" 
                    ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                ,&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" 
                    ControlToValidate="TextBox_LCDTo" ErrorMessage="Không hợp lệ" 
                    ValidationExpression="[0-9]+"></asp:RegularExpressionValidator>
                </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2">
                <asp:Button ID="Button_Search" runat="server" onclick="Button_Search_Click" 
                    Text="Tìm kiếm" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:SqlDataSource ID="SqlDataSource_Manufacture" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
                    SelectCommand="SELECT * FROM [manufacture]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource_OS" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
                    SelectCommand="SELECT * FROM [os]"></asp:SqlDataSource>
            </td>
            <td class="style2">
                <asp:TextBox ID="TextBox1" runat="server" Height="89px" TextMode="MultiLine" 
                    Width="272px" Visible="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td class="style2" style="text-align: center">
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4">
        <ItemTemplate>
<table>
                                <tr style="text-align: center; color: #1500FF; font-weight: bold; font-size: 15px">
                                    <td class="style1">
                                        <asp:HyperLink ID="lnk_name" runat="server" 
                                            NavigateUrl='<%# "ProductDetail.aspx?id="+Eval("id") %>' 
                                            Text='<%# Eval("name") %>'></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td class="style2">
                                    <a class="item_box" href='<%# "ProductDetail.aspx?id="+Eval("id") %>' >
                                        <asp:Image ID="Image1" runat="server" BorderColor="#DDDDDD" BorderWidth="1px" 
                                            ImageUrl='<%# Eval("image") %>' Width="120px" />
                                    </a>
                   
                                    </td>
                                </tr>
                                <tr style="text-align: center; color: black; font-weight: bold; font-size: 13px;
                                    height: 20px">
                                    <td class="style2">
                                        <small>RAM: 
                                        <asp:Label ID="lbMaSP" runat="server" 
                                            Text='<%# Eval("ram") %>'></asp:Label>
                                    <br />
                                        Camera:
                                        <asp:Label ID="lbMaSP0" runat="server" Text='<%# Eval("camera") %>'></asp:Label>
                                        <br />
                                        <small>
                                        <asp:Label ID="lb_id" runat="server" Text='<%# Eval("id") %>' 
                                            Visible="<%# false %>"></asp:Label>
                                        </small>
                                    </small></td>
                                </tr>
                                <tr style="text-align: center; color: black; font-weight: bold; font-size: 13px;
                                    height: 20px">
                                    <td class="style2">
                                        Giá:
                                        <asp:Label ID="lb_price" runat="server" 
                                            Text='<%# ((int)Eval("price")).ToString("#,##0") %>'></asp:Label>
                                        &nbsp;đồng</td>
                                </tr>
                                <tr style="text-align: center">
                                    <td class="style2">
                                        <asp:ImageButton  ID="imbAddgio" runat="server" ImageUrl="~/web/images/res/add-to-cart-button-blue.png"
                                            CommandName="Them" Width="120px" 
                                            />
                                    </td>
                                </tr>
                            </table>
        </ItemTemplate>
    </asp:DataList>
    <br />
</asp:Content>
