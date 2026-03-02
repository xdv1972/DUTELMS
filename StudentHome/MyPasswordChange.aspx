<%@ Page Language="C#" AutoEventWireup="true" Title="СДН :: Приватна кімната :: Зміна пароля"
    MasterPageFile="~/MasterPage.Master" CodeBehind="MyPasswordChange.aspx.cs" Inherits="ELMS13.StudentHome.MyPasswordChange" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="elmsSiteMapDS"
        ShowLines="True">
    </asp:TreeView>
    <asp:SiteMapDataSource ID="elmsSiteMapDS" runat="server" StartFromCurrentNode="true" ShowStartingNode="false" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <asp:ChangePassword ID="chpassElms" runat="server" CancelButtonText="Відміна" ChangePasswordButtonText="Змінити пароль"
        ChangePasswordFailureText="Невірний старий пароль або Новий пароль невірний. Мінімальна довжина нового пароля: {0}. Не-літероцифрових знаків: {1}."
        ChangePasswordTitleText="Зміна пароля" ConfirmNewPasswordLabelText="Підтвердити новий пароль:"
        ContinueButtonText="Далі" ContinueDestinationPageUrl="~/StudentHome/Default.aspx"
        NewPasswordLabelText="Новий пароль:" PasswordLabelText="Старий пароль:" SuccessText="Ваш пароль було змінено!"
        SuccessTitleText="Зміну пароля завершено" OnCancelButtonClick="chpassElms_CancelButtonClick"
        OnChangedPassword="chpassElms_ChangedPassword" OnChangePasswordError="chpassElms_ChangePasswordError">
        <CancelButtonStyle BorderWidth="1px" Width="150px" />
        <ChangePasswordButtonStyle BorderWidth="1px" Width="150px" />
        <ContinueButtonStyle BorderWidth="1px" Width="150px" />
        <TextBoxStyle BorderWidth="1px" Width="200px" />
    </asp:ChangePassword>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
