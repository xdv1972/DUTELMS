<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ELMS13.MethodistHome.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <!--methodist role-->
    <div class="role" id="role_methodist" runat="server">
        <h1>Методист</h1>
        <ul>
            <li><a href="MyGroups.aspx">Групи</a></li>
            <li><a href="Reports/Default.aspx">Звіти</a></li>
        </ul>
    </div>
    <!--methodist role end-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>
