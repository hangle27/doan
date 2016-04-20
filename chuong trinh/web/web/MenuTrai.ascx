<%@ Control Language="C#" AutoEventWireup="true" Inherits="UserControl_MenuTrai" Codebehind="MenuTrai.ascx.cs" %>
<div>
    <div class="box" >
        <div class="m">
            <a href="ShoppingCart.aspx" style="text-decoration:none">
                <div class="m_title">  Giỏ hàng   
                </div>
                <div id="Soluong" style="margin-left:5px;"><font color="#770033" >Sản phẩm: <asp:Label runat="server" ID="t_Size"></asp:Label></font></div>
                <div id="Gia" style="margin-left:5px"><font color="#770033" >Tổng tiền: <asp:Label runat="server" ID="t_Total"></asp:Label></font></div>
            </a>
        </div>
    </div>
    <div class="box">
        <div class="box_title">Các loại điện thoại</div>
        <div>
            <asp:DataList ID="DataList1" runat="server" BackColor="White" 
                BorderStyle="None" BorderWidth="0px" CellPadding="5" 
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
        <div id="Quangcao"> <center><img src="/web/images/qc/farmheroessaga.gif" alt="Liên hệ quảng cáo" style="width: 100%" /></center></div>
    </div>
    <div class="box" id="Khach-truy-cap">
        <div class="box_title"> Số khách truy cập</div>
        <div id="Div1"></div>
    </div>
</div>