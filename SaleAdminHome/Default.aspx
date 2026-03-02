<%@ Page Language="C#" AutoEventWireup="true" Title="СДН :: Адміністрування" MasterPageFile="~/MasterPage.Master"
    CodeBehind="Default.aspx.cs" Inherits="ELMS13.SaleAdminHome.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
        <!--administrator role-->
    <div class="role" id="role_Admin" runat="server">
        <h1>Адміністратор масового продажу</h1>
        <ul>
            <li><a href="MyGroups.aspx">Редагування навчальних груп</a></li>
        </ul>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
