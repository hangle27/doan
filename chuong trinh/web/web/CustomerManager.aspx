<%@ Page Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="CustomerManager.aspx.cs" Inherits="web.CustomerManager" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
        BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="id" 
        DataSourceID="SqlDataSource1" ShowFooter="True" 
        >
        <RowStyle BackColor="White" ForeColor="#330099" />
        <Columns>
            <asp:TemplateField HeaderText="id" InsertVisible="False" SortExpression="id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <FooterTemplate>
                    +
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Tên người dùng" SortExpression="name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox_Name" runat="server" Text='<%# Bind("name") %>' 
                        Width="96px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox_Name" runat="server" Width="96px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Email" SortExpression="email">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox_Email_edit" runat="server" Text='<%# Bind("email") %>' 
                        Width="104px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox_Email" runat="server" Width="104px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Điện thoại" SortExpression="phone">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox_Phone_edit" runat="server" Text='<%# Bind("phone") %>' 
                        Width="102px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox_Phone" runat="server" Width="102px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Giới tính" SortExpression="gender">
                <EditItemTemplate>
                    <asp:DropDownList ID="select_edit_usrgender" runat="server" 
                        DataSourceID="SqlDataSource_UserGender" DataTextField="name" 
                        DataValueField="id" SelectedValue='<%# Bind("gender") %>'>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_UserGender" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
                        SelectCommand="SELECT * FROM [gender]"></asp:SqlDataSource>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="select_UserGender" runat="server" 
                        DataSourceID="SqlDataSource_UserGender0" DataTextField="name" 
                        DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource_UserGender0" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
                        SelectCommand="SELECT * FROM [gender]"></asp:SqlDataSource>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("user_gender") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Địa chỉ" SortExpression="address">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox_Address" runat="server" Text='<%# Bind("address") %>' 
                        Width="86px"></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="TextBox_Address" runat="server" Width="86px"></asp:TextBox>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Phân loại" SortExpression="type">
                <ItemTemplate>
                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("user_type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <EditItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="LinkButton_Add" runat="server" Font-Bold="True" 
                        onclick="LinkButton_Add_Click">Add New</asp:LinkButton>
                </FooterTemplate>
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" 
                        CommandName="Edit" Text="Edit"></asp:LinkButton>
                    &nbsp;<asp:LinkButton ID="LinkButton4" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Delete"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle Wrap="False" />
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConflictDetection="CompareAllValues" 
        ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
        DeleteCommand="DELETE FROM [users] WHERE [id] = @original_id" 
        InsertCommand="INSERT INTO [users] ([name], [email], [phone], [gender], [address], [type]) VALUES (@name, @email, @phone, @gender, @address, @type)" 
        OldValuesParameterFormatString="original_{0}" 
        SelectCommand="SELECT user_type.name AS user_type, gender.name AS user_gender, users.* FROM users INNER JOIN user_type ON users.type = user_type.id INNER JOIN gender ON users.gender = gender.id
Where users.type=3" 
        
        UpdateCommand="UPDATE [users] SET [name] = @name, [email] = @email, [phone] = @phone, [gender] = @gender, [address] = @address WHERE [id] = @original_id" 
        ProviderName="<%$ ConnectionStrings:tgdtConnectionString.ProviderName %>">
        <DeleteParameters>
            <asp:Parameter Name="original_id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="phone" Type="String" />
            <asp:Parameter Name="gender" Type="Byte" />
            <asp:Parameter Name="address" Type="String" />
            <asp:Parameter Name="original_id" Type="Int32" />
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
