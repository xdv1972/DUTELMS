<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="InternalMail.aspx.cs" Inherits="ELMS13.StudentHome.InternalMail" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<%@ Register Src="~/Controls/EMessadgeManager.ascx" TagPrefix="uc1" TagName="EMessadgeManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">

    <uc1:EMessadgeManager ID="uc_messadges" runat="server" VisibleAccess ="Student" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>
