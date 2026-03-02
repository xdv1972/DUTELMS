<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="UserEnrollmentManager.aspx.cs" Inherits="ELMS13.AdminHome.UserEnrollmentManager" %>

<%@ Register Src="../Controls/EUserEnrollmentManager.ascx" TagName="EUserEnrollmentManager" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <asp:ScriptManager ID="sm" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>

    <uc1:EUserEnrollmentManager ID="uc_enroll" runat="server" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>
