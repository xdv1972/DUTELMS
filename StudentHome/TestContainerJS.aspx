<%@ Page Language="C#" AutoEventWireup="true" Title="СДН :: Приватна кімната :: Мої курси :: Тестування - JSTracking"
    CodeBehind="TestContainerJS.aspx.cs" Inherits="ELMS13.StudentHome.TestContainerJS" %>

<%@ PreviousPageType VirtualPath="~/StudentHome/CourseContainer.aspx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    <asp:ScriptManager ID="smAjax" runat="server">
        <Scripts>
            <asp:ScriptReference Path="JSTrack.js" />
        </Scripts>
        <Services>
            <asp:ServiceReference Path="wsElmsTrack.asmx" />
        </Services>
    </asp:ScriptManager>
    <div>
        <iframe id="frmJSContent" frameborder="1" src="Blank.htm" width="100%" height="95%"
            runat="server"></iframe>
    </div>
    <div>
        <div style="float: left">
            <asp:LinkButton ID="lbtnBack" runat="server" OnClick="lbtnBack_Click"><< Назад до курсу...</asp:LinkButton>
        </div>
        <div style="float: right">
            Результат: <span id="ResultId">...</span>
        </div>
    </div>
    </form>
</body>
</html>
