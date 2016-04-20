<%@ Page Language="C#" MasterPageFile="~/NguoiDung.master" AutoEventWireup="true" CodeBehind="SessionManager.aspx.cs" Inherits="web.SessionManager" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="page_title" runat="server">
    <title>Các phiên đăng nhập</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Các địa điểm mà bạn đã đăng nhập</h2>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource_ss" 
        AllowPaging="True">
        <RowStyle BackColor="White" ForeColor="#330099" />
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" 
                ReadOnly="True" SortExpression="id" />
            <asp:TemplateField HeaderText="Thiết bị" SortExpression="device">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("device") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# ("" + Eval("device")).Replace("/", "trên") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="time" HeaderText="Thời gian" 
                SortExpression="time" />
            <asp:BoundField DataField="value" HeaderText="Trao đổi khóa" 
                SortExpression="time" />
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                        CommandName="Delete" Text="Kết thúc hoạt động"></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource_ss" runat="server" 
        ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
        DeleteCommand="DELETE FROM [session] WHERE [id] = @id" 
        InsertCommand="INSERT INTO [session] ([value], [account_id], [time], [device]) VALUES (@value, @account_id, @time, @device)" 
        SelectCommand="SELECT account.username, session.id, session.value, session.account_id, session.time, session.device FROM account INNER JOIN session ON account.id = session.account_id WHERE (account.username = @1)" 
        
        UpdateCommand="UPDATE [session] SET [value] = @value, [account_id] = @account_id, [time] = @time, [device] = @device WHERE [id] = @id">
        <SelectParameters>
            <asp:CookieParameter CookieName="username" Name="1" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="value" Type="String" />
            <asp:Parameter Name="account_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="time" />
            <asp:Parameter Name="device" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="value" Type="String" />
            <asp:Parameter Name="account_id" Type="Int32" />
            <asp:Parameter DbType="Date" Name="time" />
            <asp:Parameter Name="device" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
