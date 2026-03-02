<%@ Page Language="C#" Title="СДН :: Звіти" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ELMS13.MethodistHome.Reports.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <h1>
        Звіти</h1>
    <ul class="link-list-vertical">
        <li><a href="ReportUsersOnGroup.aspx" title="Слухачі на курсі">Слухачі у групі</a></li>
        <li><a href="ReportMatrixProgressOnCourse.aspx" title="Шахматка виконання контрольних завдань">Шахматка виконання контрольних завдань</a></li>             
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
