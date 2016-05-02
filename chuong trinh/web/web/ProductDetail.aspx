<%@ Page Language="C#" MasterPageFile="~/NguoiDung.master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="web.ProductDetail" Title="Untitled Page" %>

<asp:Content ID="Content2" ContentPlaceHolderID="page_title" runat="server" >
    <title>Chi tiết sản phẩm</title>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="id" 
        DataSourceID="SqlDataSource1" onitemcommand="DataList1_ItemCommand">
        <ItemTemplate>
            <br />
            <table style="width:100%;">
                <tr>
                    <td colspan="3">
                        Thông tin về điện thoại
                        <asp:Label ID="lnk_name" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                        &nbsp;(id
                        <asp:Label ID="lb_id" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                        )</td>
                </tr>
                <tr>
                    <td rowspan="10" style="padding: 10px;">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' 
                            Width="250px" BorderColor="#BBBBBB" BorderStyle="Solid" 
                            BorderWidth="1px" ImageAlign="Left" />
                    </td>
                    <td>
                        <b>Hệ điều hành</b></td>
                    <td style="color: #999966;">
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("osName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Hãng sản xuất</b></td>
                    <td style="color: #999966">
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("manufactureName") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>CPU</b></td>
                    <td style="color: #999966">
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("cpu") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>RAM</b></td>
                    <td style="color: #999966">
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("ram") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Camera</b></td>
                    <td style="color: #999966">
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("camera") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Dung lượng pin</b></td>
                    <td style="color: #999966">
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("battery") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Màn hình</b></td>
                    <td style="color: #999966">
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("lcd") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Tình trạng</b></td>
                    <td style="color: #999966">
                        <asp:Label ID="Label8" runat="server" 
                            Text='<%# ((int)Eval("quantity")) > 0 ? "Còn " + Eval("quantity") + " cái" : "Hết hàng" %>' 
                            ForeColor='<%# ((int)Eval("quantity")) > 0 ? System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b>Giá</b></td>
                    <td style="color: #999966">
                        <asp:Label ID="lb_price" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                        &nbsp;đồng</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td style="color: #999966">
                        <asp:ImageButton ID="imbAddgio" runat="server" CommandName="Them" 
                            ImageUrl="~/Image/Icon/button_red_add_to_cart.jpeg" 
                            Enabled='<%# ((int)Eval("quantity")) > 0 %>' 
                            Visible='<%# ((int)Eval("quantity")) > 0 %>' />
                    </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" SelectCommand="SELECT product.*, manufacture.name AS manufactureName, manufacture.logo AS manufactureLogo, os.name AS osName, os.logo AS osLogo FROM manufacture INNER JOIN product ON manufacture.id = product.manufacture INNER JOIN os ON product.os = os.id
WHERE product.id=@1">
        <SelectParameters>
            <asp:QueryStringParameter Name="1" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
     Các sản phẩm có chung mức giá:<asp:DataList ID="dlist_product" 
        runat="server" RepeatColumns="4" 
                RepeatDirection="Horizontal" Width="100%" 
         onitemcommand="DataList1_ItemCommand" BorderColor="#999966">
                <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                    Font-Strikeout="False" Font-Underline="False" />
                <ItemTemplate>
                    <table>
                                <tr style="text-align: center; color: #1500FF; font-weight: bold; font-size: 15px">
                                    <td style="height: 35px">
                                        <asp:HyperLink ID="lnk_name" runat="server" 
                                            NavigateUrl='<%# "ProductDetail.aspx?id="+Eval("id") %>' 
                                            Text='<%# Eval("name") %>'></asp:HyperLink>
                                    </td>
                                </tr>
                                <tr style="text-align: center">
                                    <td>
                                    <a class="item_box" href='<%# "ProductDetail.aspx?id="+Eval("id") %>' >
                                        <asp:Image ID="Image1" runat="server" BorderColor="#DDDDDD" BorderWidth="1px" 
                                            ImageUrl='<%# Eval("image") %>' Width="120px" />
                                    </a>
                   
                                    </td>
                                </tr>
                                <tr style="text-align: center; color: black; font-weight: bold; font-size: 13px;
                                    height: 20px">
                                    <td>
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
                                    <td>
                                        Giá:
                                        <asp:Label ID="lb_price" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                        &nbsp;đồng</td>
                                </tr>
                                <tr style="text-align: center">
                                    <td>
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
