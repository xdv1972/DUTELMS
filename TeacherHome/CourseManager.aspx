<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CourseManager.aspx.cs" Inherits="ELMS13.MethodistHome.CourseManager" %>

<%@ Register Src="../Controls/ECourseList.ascx" TagName="ECourseList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
    <link rel="stylesheet" href="../Scripts/jquery-ui-1.10.0.custom.min.css" />
    <script src="../Scripts/jquery-1.9.0.js"></script>
    <script src="../Scripts/jquery-ui-1.10.0.custom.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <uc1:ECourseList ID="uc_courseList" runat="server" VisibleAccess="Methodist"/>
    <script>
        rendAccordition();
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>
