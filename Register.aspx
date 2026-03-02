<%@ Page Language="C#" AutoEventWireup="true" Title="СДН :: Реєстрація у системі"
    MasterPageFile="~/MasterPage.Master" CodeBehind="Register.aspx.cs" Inherits="ELMS13.Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Controls/EUserRegister.ascx" TagPrefix="uc1" TagName="EUserRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
    <h1>Реєстрація</h1>
    <uc1:EUserRegister runat="server" ID="userRegister" AuthenticateUser="true" EnableCaptcha="true"
        ShowRoles="false" ViewRegisterMode="RegisterNewUser" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
