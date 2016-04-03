<%@ Control Language="C#" AutoEventWireup="true" CodeFile="KhungPhai.ascx.cs" Inherits="UserControl_KhungPhai" %>

<link href="../CSS/ShopOnline.css" rel="Stylesheet" type="text/css" />
<div id="box">
    <div class="m">
    <a href="./GioHang.aspx" style="text-decoration:none">
        <div class="m_title">  Giỏ hàng   
        </div>
        <div id="Soluong" style="margin-left:5px;font-size:16px;">Sản phẩm:<asp:Label runat="server" ID="lblSL"></asp:Label></div>
        <div id="Gia" style="font-size:16px; margin-left:5px">Tổng tiền:<asp:Label runat="server" ID="lbTongTien"></asp:Label> </div>
    </a>
        
        
    </div>
    <div class="m">
        <div class="m_title">Sản phẩm khuyến mại</div>
        <div id="tintuc"></div>
    </div>

        <div class="m">
            <div class="m_title">Quảng cáo</div>
            <div class="m_box"><img src="../Image/Quangcao1.jpg" 
                    alt="Liên hệ quảng cáo" style="width: 200px"/></div>
    </div>
    </div>