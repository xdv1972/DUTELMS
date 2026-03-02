<%@ Page Language="C#" Title="СДН :: Приватна кімната :: Мої курси :: Тестування"
    AutoEventWireup="true" CodeBehind="TestContainer.aspx.cs" Inherits="ELMS13.StudentHome.TestContainer" %>

<%@ OutputCache Location="None" %> 

<%@ PreviousPageType VirtualPath="~/StudentHome/CourseContainer.aspx" %>

<%@ Register src="../Controls/ETestManager.ascx" tagname="ETestManager" tagprefix="uc1" %>


<form id="form1" runat="server">
    <uc1:ETestManager ID="ETestManager1" ViewAccess ="Student" runat="server" />
</form>


