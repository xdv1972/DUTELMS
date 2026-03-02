<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TestContainer.aspx.cs" Inherits="ELMS13.SaleAdminHome.TestContainer" %>

<%@ PreviousPageType VirtualPath="~/SaleAdminHome/CourseContainer.aspx" %>

<%@ Register Src="../Controls/ETestManager.ascx" TagName="ETestManager" TagPrefix="uc1" %>


<form id="form1" runat="server">
    <uc1:ETestManager ID="ETestManager1" ViewAccess="Administrator" runat="server" />
</form>
