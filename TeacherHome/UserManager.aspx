<%@ Page Language="C#" AutoEventWireup="true" Title="СДН :: Адміністрування :: Користувачі"
    MasterPageFile="~/MasterPage.Master" CodeBehind="UserManager.aspx.cs" Inherits="ELMS13.TeacherHome.UserManager" %>

<%@ Register Src="../Controls/EUserRegister.ascx" TagName="EUserRegister" TagPrefix="uc1" %>
<%@ Register Src="../Controls/EUserManager.ascx" TagName="EUserManager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
    <script src="../Scripts/jquery-1.9.0.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <asp:ScriptManager ID="sm" runat="server">
    </asp:ScriptManager>

    <uc1:EUserManager AllowPickUser="true"
        runat="server" ShowFilters="true" ID="uc_userManager" FilterCheckBoxRowCount="3"
        OnPickedUserChanged="uc_userManager_PickedUserChanged" 
        OnCreateUserClick="uc_userManager_CreateUserClick" />
    <uc1:EUserRegister ID="uc_register" runat="server" Visible="true" OnSuccess="uc_register_Success" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
