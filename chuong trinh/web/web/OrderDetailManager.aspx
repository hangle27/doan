<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="OrderDetailManager.aspx.cs" Inherits="web.OrderDetailManager" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <a href="OrderManager.aspx">&lt;&lt; Trở về</a><br />
        <br />
        Chi tiết đơn hàng:<br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
            BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            DataSourceID="SqlDataSource_OrderDetail">
            <RowStyle BackColor="White" ForeColor="#330099" />
            <Columns>
                <asp:TemplateField HeaderText="Hình ảnh" SortExpression="image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="48px" ImageAlign="AbsMiddle" 
                            ImageUrl='<%# Eval("image") %>' />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("image") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Tên sản phẩm" SortExpression="name">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="quantity" HeaderText="Số lượng" 
                    SortExpression="quantity" />
                <asp:BoundField DataField="price" HeaderText="Giá" SortExpression="price" />
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        </asp:GridView>
    </p>
    <p>
        Tình trạng:
        <asp:DropDownList ID="DropDownList1" runat="server" 
            DataSourceID="SqlDataSource_tt" DataTextField="name" DataValueField="id">
        </asp:DropDownList>
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem Value="0">Chưa thanh toán</asp:ListItem>
            <asp:ListItem Value="1">Đã thanh toán</asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource_tt" runat="server" 
            ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
            SelectCommand="SELECT * FROM [status]"></asp:SqlDataSource>
&nbsp;<br />
        <br />
        <asp:Button ID="Button_Apply" runat="server" onclick="Button_Apply_Click" 
            Text="Áp dụng" />
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource_OrderDetail" runat="server" 
            ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" SelectCommand="SELECT product.name, product.image, order_detail.quantity, order_detail.price, order_detail.product_id FROM [order] INNER JOIN order_detail ON [order].id = order_detail.order_id INNER JOIN product ON order_detail.product_id = product.id
where order_id=@o_id">
            <SelectParameters>
                <asp:QueryStringParameter Name="o_id" QueryStringField="id" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <br />
    <br />
</asp:Content>
