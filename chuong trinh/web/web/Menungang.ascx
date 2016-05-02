<%@ Control Language="C#" AutoEventWireup="true" Inherits="UserControl_Menungang" Codebehind="Menungang.ascx.cs" %>

<script language="javascript" type="text/javascript">

</script>


<div style="width:980px">
<div class="banner">
    <asp:Image ImageUrl="~/web/images/header.jpg" runat="server" ID="anhnen" Width="980px" Height="250px" />
</div>
<div id="menungang">
    <ul id="top" style="padding: 0">
        <li><a href="Default.aspx"title="menuitem1">trang chủ</a></li>
        <li><a href="About.aspx">giới thiệu</a></li>
        <li><a href="ProductSearch.aspx">Tìm kiếm</a></li>
        <li id="o_login" runat="server"><a href="./Account.aspx?action=login" id="greeting" runat="server">Đăng nhập</a></li>
        <li><a href="./Admin.aspx" >Quản trị</a></li>
        <li id="o_logout" runat="server"><a href="./Account.aspx?action=logout" >Đăng xuất</a></li>
        <li id="o_regedit" runat="server"><a href="./CustomerRegister.aspx" >Đăng ký</a></li>
    </ul>

</div>
<div id="timkiem">
</div>
</div>
