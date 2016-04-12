<%@ Page Language="C#" MasterPageFile="~/NguoiDung.master" AutoEventWireup="true" CodeFile="ProductGroup.aspx.cs" Inherits="Page_ProductGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="khung-giua">

 <div id="sp-moi">
 <div class="title-giua" runat="server" id="list_title">
     <asp:DataList ID="DataList1" runat="server" DataKeyField="id" 
         DataSourceID="SqlDataSource_LoaiSP" Height="16px" RepeatColumns="4" 
         ShowFooter="False" ShowHeader="False" 
         onitemcommand="DataList1_ItemCommand">
         <ItemTemplate>
             <b><asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label></b>
         </ItemTemplate>
     </asp:DataList>
     </div>
 <div style="float:left; margin-left:10px">
 <asp:DataList ID="dlist_product" runat="server" RepeatColumns="4" 
                RepeatDirection="Horizontal" Width="551px" 
          DataSourceID="SqlDataSource_SanPham" 
         onitemcommand="dlist_product_ItemCommand">
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
                                        <small>HĐH: <asp:Label ID="lbMaSP" runat="server" 
                                            Text='<%# Eval("osName") + " " + Eval("os_version") %>'></asp:Label>
                                    <br />
                                        Màn hình:
                                        <asp:Label ID="lbMaSP0" runat="server" Text='<%# Eval("lcd") %>'></asp:Label>
                                        <br />
                                        ID: <small>
                                        <asp:Label ID="lb_id" runat="server" Text='<%# Eval("id") %>'></asp:Label>
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
                                        <asp:ImageButton  ID="imbAddgio" runat="server" ImageUrl="~/Image/Icon/button_red_add_to_cart.jpeg"
                                            CommandName="Them" 
                                            />
                                    </td>
                                </tr>
                            </table>
                </ItemTemplate>
            </asp:DataList>
     <asp:SqlDataSource ID="SqlDataSource_SanPham" runat="server" 
         ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
         
         
         
         
         
         SelectCommand="SELECT manufacture.name AS manufactureName, os.name AS osName, product.* FROM manufacture INNER JOIN product ON manufacture.id = product.manufacture INNER JOIN os ON product.os = os.id WHERE (product.manufacture = @1)">
         <SelectParameters>
             <asp:QueryStringParameter Name="1" QueryStringField="id" />
         </SelectParameters>
     </asp:SqlDataSource>
     <asp:SqlDataSource ID="SqlDataSource_LoaiSP" runat="server" 
         ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
         SelectCommand="SELECT * FROM [manufacture] WHERE ([id] = @id)">
         <SelectParameters>
             <asp:QueryStringParameter Name="id" QueryStringField="id" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>
     <br />
 </div>
 </div>
 </div>
</asp:Content>