<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="MessadgeManager.aspx.cs" Inherits="ELMS13.AdminHome.MessadgeManager" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<%@ Register Src="~/Controls/EUserManager.ascx" TagPrefix="uc1" TagName="EUserManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <asp:ScriptManager ID="sm" runat="server">
    </asp:ScriptManager>
    <uc1:EUserManager runat="server" ID="uc_userManager" AllowCreateUser="False" AllowPickUser="False"
        AllowSelectUser="True" FilterCheckBoxRowCount="3" ShowFilters="True" OnSelectedUserChanged="uc_userManager_SelectedUserChanged" />
    <br />
    <p>
        Вибрано&nbsp;
            <asp:Label ID="lbl_selectedCount" runat="server" Text="0"></asp:Label>&nbsp;користувачів
    </p>
    <asp:Panel ID="pan_sendMessadge" runat="server" Visible="false">
        <p>
            <FTB:FreeTextBox ID="ftb_textBody" runat="server" Width="900px"
                ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;|InsertTable,EditTable">
            </FTB:FreeTextBox>
            <asp:RequiredFieldValidator ID="rfv_messBody" ControlToValidate="ftb_textBody" ErrorMessage="Пусте повідомлення" ForeColor="Red" runat="server" ValidationGroup="textBody"></asp:RequiredFieldValidator>
        </p>
        <asp:Button ID="btn_send" runat="server" Text="Відправити" OnClick="btn_send_Click" ValidationGroup="textBody" />
        <asp:HyperLink ID="hl_sendEmail" runat="server" Text="Надіслати листа(Outlook)"></asp:HyperLink>
        <asp:Button ID="btn_cancel" runat="server" Text="Скасувати" OnClick="btn_cancel_Click" />
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>
