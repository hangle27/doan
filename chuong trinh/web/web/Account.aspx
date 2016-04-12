<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="GSUpload.page.Auth" %>
<html>
<head id="Head1" runat="server">
</head>
<body>
<div>
        <asp:Literal ID="Greeeting" runat="server"></asp:Literal>
        <div id="form_login" runat="server" >
            <form method="post" action="?action=login">
            <br />
            <br />
            Tên đăng nhập:<br />
            <input ID="input_login_username" runat="server" />
            <br />
            Mật khẩu:<br />
            <input ID="input_login_password" runat="server" />
            <br />
            <br />
            <input type="submit" value="Đăng nhập" />
            </form>
        </div>
        <div id="form_register" runat="server" >
            <form method="post" action="?action=register">
            <br />
            <br />
            Tên của bạn:<br />
            <input ID="reg_realname" runat="server" />
                <br />
            Email:<br />
            <input ID="reg_email" runat="server" />
                <br />
            Tên đăng nhập:<br />
            <input ID="reg_username" runat="server" />
                <br />
            Mật khẩu:<br />
            <input ID="reg_password" runat="server" />
                <br />
            <br />
            <input type="submit" value="Đăng ký" />
        </form>
    </div>

</div>

</body>
</html>