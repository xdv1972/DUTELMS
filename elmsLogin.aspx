<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="elmsLogin.aspx.cs" Title="СДН :: Вхід до системи"
    MasterPageFile="~/MasterPage.Master" Inherits="ELMS13.elmsLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <h1>
        Вхід до системи</h1>
    <div>
        <asp:Login ID="LoginELMS" runat="server" DisplayRememberMe="False" LoginButtonText="Вхід"
            PasswordLabelText="Пароль:" RememberMeText="Запам'ятати мене." TitleText="" UserNameLabelText="Ім'я входу:"
            Width="302px" DestinationPageUrl="~/Default.aspx" FailureText="Спроба входу невдала. Перевірте ваш логін та пароль і спробуйте ще раз.">
            <CheckBoxStyle Wrap="False" />
            <TextBoxStyle BorderWidth="1px" Width="200px" />
            <LoginButtonStyle BorderWidth="1px" Width="100px" />
            <LayoutTemplate>
                <table border="0" cellpadding="3" cellspacing="3" class="tlogino">
                    <tr>
                        <td style="width: 305px">
                            <table border="0" cellpadding="0" style="width: 302px" class="tlogin">
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Ім'я входу:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="UserName" runat="server" BorderWidth="1px" Width="180px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                                            ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="LoginELMS">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Пароль:</asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="Password" runat="server" BorderWidth="1px" TextMode="Password" Width="180px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                                            ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="LoginELMS">*</asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="color: red">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2">
                                        <asp:Button ID="LoginButton" runat="server" BorderStyle="Solid" BorderWidth="1px"
                                            CommandName="Login" Text="Вхід" ValidationGroup="LoginELMS" CssClass="bLogin" />
                                    </td>
                                </tr>
                                <%--<tr>
                                <td align="right" colspan="2">
                                    <asp:HyperLink ID="hlGoToPassRecovery" runat="server" NavigateUrl="~/elmsPasswordRecovery.aspx">Забули пароль?</asp:HyperLink>
                                    &nbsp;
                                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</td>
                            </tr>--%>
                            </table>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
        </asp:Login>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
