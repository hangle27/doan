<%@ Control Language="C#" AutoEventWireup="true" Inherits="UserControl_Menungang" Codebehind="Menungang.ascx.cs" %>

<div style="width:980px">
<div class="banner">
    <asp:Image ImageUrl="~/Image/banner4.jpg" runat="server" ID="anhnen" Width="980px" Height="150px" />
</div>
<div id="menungang">
    <ul id="top" style="padding: 0">
        <li><a href="Default.aspx"title="menuitem1">trang chủ</a></li>
        <li><a href="#">giới thiệu</a></li>
        <li id="o_login" runat="server"><a href="./Account.aspx?action=login" id="greeting" runat="server">Đăng nhập</a></li>
        <li><a href="./Admin.aspx" >Quản trị</a></li>
        <li id="o_logout" runat="server">
            <a href="./Account.aspx?action=logout" >Đăng xuất</a>
        </li>
    </ul>

</div>
<div id="timkiem">
    <input  name="search" type="submit" value="Tìm kiếm" style="float:right;margin-left:5px; width:80px;height:25px;background-color:#FF0000; color:white; font-weight:bold; border:0; border-radius:5px" />
    <input type="text" placeholder="Hãy viết gì đó..." 
        style="float:right;width:300px;height:25px; padding-left: 10px;" />
</div>
</div>
