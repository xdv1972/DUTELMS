<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentContainer.aspx.cs" Inherits="ELMS13.AdminHome.ContentContainer" %>

<%@ PreviousPageType VirtualPath="~/AdminHome/CourseContainer.aspx" %>

<%@ Register Src="~/Controls/EContentContainer.ascx" TagPrefix="uc1" TagName="EContentContainer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>xLab.ELMS курс</title>
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
    <script language="javascript" type="text/javascript">

        function btnClik() {
            if (window.document.forms["form1"].elements["btnNext"]) {
                window.document.forms["form1"].elements["btnNext"].click(); //нажать на кнопку.
            }
            else if (window.document.forms["form1"].elements["btnSendResults"]) {
                window.document.forms["form1"].elements["btnSendResults"].click(); //нажать на кнопку.
            }
        }
    </script>
</head>
<body class="cdtotal">
    <form id="form1" runat="server">
        <uc1:EContentContainer runat="server" ID="EContentContainer" ViewAccess ="Administrator" />
        
    </form>
</body>
</html>

