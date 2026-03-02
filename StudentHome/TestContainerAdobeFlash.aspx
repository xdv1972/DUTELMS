<%@ Page Language="C#" AutoEventWireup="true" Title="СДН :: Приватна кімната :: Мої курси :: Тестування - Adobe Flash Track"
    CodeBehind="TestContainerAdobeFlash.aspx.cs" Inherits="ELMS13.StudentHome.TestContainerAdobeFlash" %>

<%@ PreviousPageType VirtualPath="~/StudentHome/CourseContainer.aspx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        html, body, form
        {
            height: 100%;
        }
        * html
        {
            height: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0"
            width="550" height="400" id="ElmsFlash" style="vertical-align: middle;">
            <param name="allowScriptAccess" value="sameDomain" />
            <asp:Literal ID="FlashParamMovie" runat="server" />
            <param name="quality" value="high" />
            <param name="bgcolor" value="#ffffff" />
            <asp:Literal ID="FlashParamEmbed" runat="server" />
        </object>
    </div>
    </form>
</body>
</html>
