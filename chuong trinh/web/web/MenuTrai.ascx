<%@ Control Language="C#" AutoEventWireup="true" CodeFile="MenuTrai.ascx.cs" Inherits="UserControl_MenuTrai" %>
<link href="../CSS/Menu.css" rel="Stylesheet" type="text/css" />
<div class="menutrai">
    <div class="box">
        <div class="box_title">Các loại điện thoại</div>
        <div>
            <asp:DataList ID="DataList1" runat="server" BackColor="White" 
                BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="0px" CellPadding="5" 
                DataKeyField="id" DataSourceID="SqlDataSource1" ForeColor="Black" 
                GridLines="Vertical" Width="100%">
                <FooterStyle BackColor="#CCCC99" />
                <AlternatingItemStyle BackColor="White" />
                <ItemStyle BackColor="#F7F7DE" />
                <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                    Font-Strikeout="False" Font-Underline="False" />
                <SelectedItemStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>
                    &nbsp;&nbsp;
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# "ProductGroup.aspx?id=" + Eval("id") %>' 
                        Text='<%# Eval("name") %>'></asp:HyperLink>
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:tgdtConnectionString %>" 
                SelectCommand="SELECT * FROM [manufacture]"></asp:SqlDataSource>
        </div>
    </div>
    <div class="box" id="QC">
        <div class="box_title"> Quảng cáo</div>
        <div id="Quangcao"> <center><img src="../Image/Quangcao1.jpg" alt="Liên hệ quảng cáo" /></center></div>
    </div>
    <div class="box" id="Khach-truy-cap">
        <div class="box_title"> Số khách truy cập</div>
        <div id="Div1"></div>
    </div>
</div>