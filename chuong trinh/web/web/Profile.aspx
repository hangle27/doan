<%@ Page Language="C#" MasterPageFile="~/NguoiDung.master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="web.Profile" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
    CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource_Profile">
    <RowStyle BackColor="White" ForeColor="#330099" />
    <Columns>
        <asp:TemplateField HeaderText="Thông tin về bạn">
            <EditItemTemplate>
                <table style="width:100%;">
                    <tr>
                        <td>
                            Tên đăng nhập</td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Tên hiển thị</td>
                        <td>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email</td>
                        <td>
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Address</td>
                        <td>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Phone</td>
                        <td>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("phone") %>'></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <table style="width:100%;">
                    <tr>
                        <td class="bold">
                            Tên đăng nhập&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("username") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                            Tên hiển thị&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                            Email&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                            Address&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bold">
                            Phone&nbsp;&nbsp;
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("phone") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:CommandField ShowEditButton="True" />
    </Columns>
    <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
    <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource_Profile" runat="server" 
    ConnectionString="<%$ ConnectionStrings:tgdtConnectionString2 %>" 
    DeleteCommand="DELETE FROM [users] WHERE [id] = @id" 
    InsertCommand="INSERT INTO [users] ([name], [email], [phone], [gender], [address], [type]) VALUES (@name, @email, @phone, @gender, @address, @type)" 
    SelectCommand="SELECT account.username, users.id, users.name, users.email, users.phone, users.gender, users.address, users.type FROM account INNER JOIN users ON account.user_id = users.id WHERE (account.username = @h3)" 
    
        UpdateCommand="UPDATE [users] SET [name] = @name, [email] = @email, [phone] = @phone, [gender] = @gender, [address] = @address, [type] = @type WHERE [id] = @id">
    <SelectParameters>
        <asp:CookieParameter CookieName="username" Name="h3" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="id" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="name" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="phone" Type="String" />
        <asp:Parameter Name="gender" Type="Byte" />
        <asp:Parameter Name="address" Type="String" />
        <asp:Parameter Name="type" Type="Byte" />
        <asp:Parameter Name="id" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="name" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="phone" Type="String" />
        <asp:Parameter Name="gender" Type="Byte" />
        <asp:Parameter Name="address" Type="String" />
        <asp:Parameter Name="type" Type="Byte" />
    </InsertParameters>
</asp:SqlDataSource>

</asp:Content>
