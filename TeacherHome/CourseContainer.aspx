<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseContainer.aspx.cs" Inherits="ELMS13.TeacherHome.CourseContainer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register src="../Controls/ECourseContainer.ascx" tagname="ECourseContainer" tagprefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Курс</title>
    <style type="text/css">
        html, body
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
    <form id="form1" runat="server" style="">
    
        <uc1:ECourseContainer ID="ECourseContainer1" runat="server" ViewAccess ="Teacher" />
    </form>
</body>
</html>
