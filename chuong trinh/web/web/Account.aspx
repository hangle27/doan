<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="~/Account.aspx.cs" Inherits="web.Auth" Title="Untitled Page" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>SB Admin - Bootstrap Admin Template</title>

    <!-- Bootstrap Core CSS -->
    <link href="/web/boostrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/web/boostrap/css/sb-admin.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/web/boostrap/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <link href="/web/hg/gui.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

<div class="dialogue_background" >

<div id="dialogue0" style="width: 30%; margin: auto auto; margin-top: 100px; background: #fff; padding: 20px; padding-left: 50px; padding-right: 50px; border-radius: 5px;">
     <asp:Literal ID="Greeeting" runat="server"></asp:Literal>
        <div id="form_login" runat="server" >
        <h2>Đăng nhập</h2>
            <form method="post" action="?action=login">
            <br />
            <div class="form-group input-group">
                <span class="input-group-addon">@</span>
                <input name="input_login_username" class="form-control" placeholder="Tài khoản" type="text">
            </div>
            <div class="form-group input-group">
                <span class="input-group-addon">@</span>
                <input name="input_login_password" class="form-control" placeholder="Mật khẩu" type="password">
            </div>
            <p align="center"><input type="submit" value="Đăng nhập" class="btn btn-default" /></p>
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
</div>
<script type="text/javascript" src="web/hg/gui.js" ></script>
</body>
</html>