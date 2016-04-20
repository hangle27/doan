<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="OrderManager.aspx.cs" Inherits="web.OrderManager" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_title" runat="server">
    <title>Quản lý đơn hàng</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource_Order" 
        ForeColor="#999966">
        <RowStyle BackColor="White" ForeColor="#330099" />
        <Columns>
            <asp:BoundField DataField="customer_name" HeaderText="Khách hàng" 
                SortExpression="customer_name" />
            <asp:BoundField DataField="phone" HeaderText="Điện thoại" 
                SortExpression="phone" />
            <asp:BoundField DataField="address" HeaderText="Địa chỉ" 
                SortExpression="address" />
            <asp:TemplateField HeaderText="Ngày bắt đầu" SortExpression="date_start">
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" 
                        Text='<%# ((DateTime)Eval("date_start")).ToString("dd/MM/yyyy") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("date_start") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ngày kết thúc" SortExpression="date_end">
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" 
                        Text='<%# ((DateTime)Eval("date_end")).ToString("dd/MM/yyyy") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("date_end") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tình trạng" SortExpression="status">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("status_name") %>' 
                        BackColor='<%# ((int)Eval("status")) == 0 ? System.Drawing.Color.Yellow : System.Drawing.Color.White %>' 
                        ForeColor='<%# ((int)Eval("status")) == 2 ? System.Drawing.Color.Gray : ((int)Eval("status")) == 1 ? System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Thanh toán" SortExpression="purchased">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("purchased") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" 
                        
                        Text='<%# (((bool)Eval("purchased")) ? "Đã" : "Chưa") + " thanh toán" %>' 
                        ForeColor='<%# ((bool)Eval("purchased")) ? System.Drawing.Color.Green : System.Drawing.Color.Red %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# "OrderDetailManager.aspx?id=" + Eval("id") %>'>Chi tiết</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource_Order" runat="server" 
        ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
        DeleteCommand="DELETE FROM [order] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [order] ([user_id], [customer_name], [phone], [address], [date_start], [date_end], [status]) VALUES (@user_id, @customer_name, @phone, @address, @date_start, @date_end, @status)" 
        SelectCommand="SELECT [order].id, [order].user_id, [order].customer_name, [order].phone, [order].address, [order].date_start, [order].date_end, [order].status, [order].purchased, status.name AS status_name FROM [order] INNER JOIN status ON [order].status = status.id
ORDER BY  status ASC ,date_start DESC, id DESC" 
        
        
        UpdateCommand="UPDATE [order] SET [user_id] = @user_id, [customer_name] = @customer_name, [phone] = @phone, [address] = @address, [date_start] = @date_start, [date_end] = @date_end, [status] = @status WHERE [id] = @id">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="customer_name" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter DbType="Date" Name="date_start" />
            <asp:Parameter DbType="Date" Name="date_end" />
            <asp:Parameter Name="status" Type="Int32" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="user_id" Type="Int32" />
            <asp:Parameter Name="customer_name" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter DbType="Date" Name="date_start" />
            <asp:Parameter DbType="Date" Name="date_end" />
            <asp:Parameter Name="status" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
