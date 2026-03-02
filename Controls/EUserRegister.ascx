<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EUserRegister.ascx.cs"
    Inherits="ELMS13.Controls.EUserRegister" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<script type="text/javascript">
    function printdiv(divID) {
        var headstr = "<html><head><title></title></head><body>";
        var footstr = "</body>";
        var newstr = document.all.item(divID).innerHTML;
        var oldstr = document.body.innerHTML;
        document.body.innerHTML = headstr + newstr + footstr;
        window.print();
        document.body.innerHTML = oldstr;
        return false;
    }
</script>
<div id="div_user_edit">
    <asp:DetailsView ID="dv_user" runat="server" AutoGenerateRows="false" BorderWidth="0px">
        <Fields>
            <asp:TemplateField ShowHeader="false">
                <ItemTemplate>
                    <div>
                        <asp:Label ID="lbl_login" runat="server" Text='<%#Eval("Login") %>' Font-Italic="true"></asp:Label>
                        <br />
                        <asp:Label ID="lbl_fullName" runat="server" Text='<%#Eval("FullName") %>' Font-Bold="true"></asp:Label>
                        <br />
                        <asp:LinkButton ID="lb_sendMessedge" runat="server" OnClientClick="aspnetForm.target ='_blank';"
                            Text="Залишити повідомлення" OnClick="lb_sendMessedge_Click"></asp:LinkButton>
                        <br />
                        <asp:HyperLink ID="hl_sendEmail" runat="server" NavigateUrl='<%#Eval("Email", "mailto:{0}") %>'
                            Text="Надіслати листа(Outlook)"></asp:HyperLink>
                        <br />
                        <br />
                        <asp:Label ID="lbl_job" runat="server" Text='<%#Eval("Job") %>'></asp:Label>,&nbsp;
                        <asp:Label ID="lbl_filial" runat="server" Text='<%#Eval("Filial") %>'></asp:Label>,&nbsp;
                        <asp:Label ID="lbl_city" runat="server" Text='<%#Eval("City") %>'></asp:Label>
                        <br />
                        <fieldset>
                            <legend>Групи</legend>
                            <asp:Repeater ID="rep_userGroups" runat="server" DataSource='<%#Eval("UserGroups") %>'>
                                <HeaderTemplate>
                                    <ul>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li>
                                        <asp:LinkButton runat="server" ID="lb_userGroup" OnClientClick="aspnetForm.target ='_blank';"
                                            Text='<%#Eval("Name") %>' OnClick="lb_userGroup_Click"></asp:LinkButton>
                                    </li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                        </fieldset>
                    </div>
                </ItemTemplate>
                <InsertItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <table id="table_reg" runat="server">
                                    <tr>
                                        <td align="left" colspan="2">
                                            <hr />
                                            * Прізвище, Ім'я та По-батькові вносити українською мовою! *
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lbl_lname" runat="server">Прізвище:</asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="tb_lname" runat="server" BorderWidth="1px" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfvlastName" runat="server" ControlToValidate="tb_lname"
                                                ErrorMessage="Вкажіть прізвище!" Display="Dynamic" ValidationGroup="elmsCreateUserWizard"
                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lbl_fname" runat="server">Ім'я:</asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="tb_fname" runat="server" BorderWidth="1px" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_fname" runat="server" ControlToValidate="tb_fname"
                                                ErrorMessage="Вкажіть ім'я!" ValidationGroup="elmsCreateUserWizard" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lbl_mname" runat="server">По-батькові:</asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="tb_mname" runat="server" BorderWidth="1px" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_MIddleName" runat="server" ControlToValidate="tb_mname"
                                                ErrorMessage="Вкажіть ім'я по-батькові!" ValidationGroup="elmsCreateUserWizard"
                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lbl_email" Text="E-mail(корпоративний)" runat="server"></asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="tb_email" runat="server" BorderWidth="1px" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="tb_email"
                                                ErrorMessage="Вкажіть корпоративну пошту!" ValidationGroup="elmsCreateUserWizard"
                                                ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:RegularExpressionValidator ID="rev_email" runat="server" ErrorMessage="Некоректний формат"
                                                ValidationGroup="elmsCreateUserWizard" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                ControlToValidate="tb_email"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lbl_phone" runat="server">Телефон:</asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="tb_phone" runat="server" BorderWidth="1px" Width="200px"></asp:TextBox>
                                            <%--                                            <asp:RequiredFieldValidator ID="rfv_tb_phone" runat="server" ControlToValidate="tb_phone"
                                                ErrorMessage="Вкажіть телефон!" ToolTip="Вкажіть телефон!" ValidationGroup="elmsCreateUserWizard"
                                                Text="Вкажіть телефон!" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:RegularExpressionValidator ID="rev_tb_phone" runat="server" ErrorMessage="Некоректний формат"
                                                ValidationGroup="elmsCreateUserWizard" Display="Dynamic" ValidationExpression="[0-9]+(?:[0-9]*)"
                                                ControlToValidate="tb_phone"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lbl_city" runat="server">Місто:</asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="tb_city" runat="server" BorderWidth="1px" Width="200px" Text='<%#Eval("City") %>'></asp:TextBox>
                                            <asp:AutoCompleteExtender ID="tb_city_AutoCompleteExtender" runat="server" Enabled="True"
                                                ServiceMethod="GetCompletionCityList" ServicePath="~/WebServices/AutoComplete.asmx"
                                                TargetControlID="tb_city" UseContextKey="True" MinimumPrefixLength="2" CompletionInterval="10"
                                                EnableCaching="true" CompletionSetCount="10">
                                            </asp:AutoCompleteExtender>
                                            <asp:RequiredFieldValidator ID="rfv_city" runat="server" ControlToValidate="tb_city"
                                                ErrorMessage="Вкажіть місто!" ForeColor="Red" ValidationGroup="elmsCreateUserWizard"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Label ID="lbl_job" runat="server">Посада:</asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="tb_job" runat="server" BorderWidth="1px" Width="200px"></asp:TextBox>
                                            <asp:AutoCompleteExtender ID="tb_job_AutoCompleteExtender" ServicePath="~/WebServices/AutoComplete.asmx"
                                                runat="server" Enabled="True" ServiceMethod="GetCompletionJobList" TargetControlID="tb_job"
                                                UseContextKey="True" MinimumPrefixLength="2" CompletionInterval="10" EnableCaching="true"
                                                CompletionSetCount="10">
                                            </asp:AutoCompleteExtender>
                                            <asp:RequiredFieldValidator ID="rfv_job" runat="server" ControlToValidate="tb_job"
                                                ErrorMessage="Вкажіть посаду!" ForeColor="Red" ValidationGroup="elmsCreateUserWizard"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr id="tr_prelogin" runat="server">
                                        <td align="right" colspan="2">
                                            <hr />
                                            <div style="text-align: left;">
                                                * Логін та пароль можуть включати тільки латинські, російські, українські літери
                                                та цифри *<br />
                                                * Мінімальна довжина пароля - 7 символів *<br />
                                                * Обов&#39;язково запишіть та збережіть логін та пароль для подальшого використання
                                                *
                                            </div>
                                        </td>
                                    </tr>
                                    <tr align="right" id="tr_login" runat="server">
                                        <td align="right">
                                            <asp:Label ID="lbl_userName" runat="server" AssociatedControlID="tb_userName">Ім&#39;я входу (логін):</asp:Label>
                                        </td>
                                        <td align="left">
                                            <asp:TextBox ID="tb_userName" runat="server" BorderWidth="1px" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_userName" runat="server" ControlToValidate="tb_userName"
                                                ErrorMessage="Вкажіть логін!" ForeColor="Red" Text="Вкажіть логін!" ToolTip="Вкажіть логін!"
                                                ValidationGroup="elmsCreateUserWizard"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr id="tr_pass" runat="server">
                                        <td align="right">
                                            <asp:Label ID="lbl_pass" runat="server" AssociatedControlID="tb_pass">Пароль:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tb_pass" runat="server" BorderWidth="1px" TextMode="Password" Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_pass" runat="server" ControlToValidate="tb_pass"
                                                ErrorMessage="Вкажіть пароль!" ForeColor="Red" Text="Вкажіть пароль!" ToolTip="Вкажіть пароль!"
                                                ValidationGroup="elmsCreateUserWizard"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr id="tr_confirmPass" runat="server">
                                        <td align="right">
                                            <asp:Label ID="lbl_confirmPass" runat="server" AssociatedControlID="tb_confirmPass">Підтвердити пароль:</asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tb_confirmPass" runat="server" BorderWidth="1px" TextMode="Password"
                                                Width="200px"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_confirmPass" runat="server" ControlToValidate="tb_confirmPass"
                                                ErrorMessage="Підтвердіть пароль!" ForeColor="Red" ValidationGroup="elmsCreateUserWizard"> </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr id="tr_validPass" runat="server">
                                        <td align="center" colspan="2">
                                            <asp:CompareValidator ID="cfv_confirmPass" runat="server" ControlToCompare="tb_pass"
                                                ControlToValidate="tb_confirmPass" Display="Dynamic" ErrorMessage="Паролі повинні співпадати!"
                                                ValidationGroup="elmsCreateUserWizard"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color: red">
                                            <asp:Label ID="lbl_error" runat="server" EnableViewState="False" Text="" ForeColor="Red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr id="tr_captchaImage" runat="server">
                                        <td align="right"></td>
                                        <td>
                                            <asp:Image ID="imCaptcha" runat="server" CssClass="captchaImg" ImageUrl="~/Utils/ZCaptcha.ashx"
                                                resourcekey="imCaptcha" />
                                            <asp:ImageButton ID="imb_reload" runat="server" ImageUrl="~/Resources/reload.png"
                                                OnClick="imb_reload_Click" />
                                        </td>
                                    </tr>
                                    <tr id="tr_captchaValidation" runat="server">
                                        <td align="right">
                                            <asp:Label ID="lbl_captcha" runat="server" AssociatedControlID="tb_confirmPass">Введіть цифри: </asp:Label>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="tbCaptchaText" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_captcha" runat="server" ControlToValidate="tbCaptchaText"
                                                ForeColor="red" Text="Введіть перевірочні дані!" ValidationGroup="elmsCreateUserWizard"></asp:RequiredFieldValidator>
                                            <asp:CustomValidator ID="cvCapthcaText" runat="server" ControlToValidate="tbCaptchaText"
                                                ForeColor="Red" OnServerValidate="CAPTCHAValidate" Text="Невірні перевірочні дані!"
                                                ValidationGroup="elmsCreateUserWizard"></asp:CustomValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" align="center">
                                            <asp:Button ID="btn_register" Text="Зареєструвати" runat="server" CausesValidation="true"
                                                OnClick="btn_register_Click" ValidationGroup="elmsCreateUserWizard" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                <asp:Panel runat="server" ID="pan_roles">
                                    Ролі:<br />
                                    <asp:CheckBoxList ID="cbRoles" runat="server">
                                    </asp:CheckBoxList>
                                </asp:Panel>
                            </td>
                        </tr>
                    </table>
                </InsertItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ID="ib_print" runat="server" Width="32px" Height="32px"
                        ImageUrl="~/Resources/print-icon.png" OnClientClick="printdiv('print_info');"
                        ToolTip="Роздрукувати анкету користувача" />
                    <div id="print_info">
                        <table>
                            <tr>
                                <td>
                                    <table id="table_reg" runat="server">
                                        <tr>
                                            <td align="left" colspan="2">
                                                <hr />
                                                * Прізвище, Ім'я та По-батькові вносити українською мовою! *
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lbl_lname" runat="server">Прізвище:</asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="tb_lname" runat="server" BorderWidth="1px" Width="200px" Text='<%#Eval("LName") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfvlastName" runat="server" ControlToValidate="tb_lname"
                                                    ErrorMessage="Вкажіть прізвище!" Display="Dynamic" ValidationGroup="elmsCreateUserWizard"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lbl_fname" runat="server">Ім'я:</asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="tb_fname" runat="server" BorderWidth="1px" Width="200px" Text='<%#Eval("FName") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfv_fname" runat="server" ControlToValidate="tb_fname"
                                                    ErrorMessage="Вкажіть ім'я!" ValidationGroup="elmsCreateUserWizard" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lbl_mname" runat="server">По-батькові:</asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="tb_mname" runat="server" BorderWidth="1px" Width="200px" Text='<%#Eval("MName") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfv_MIddleName" runat="server" ControlToValidate="tb_mname"
                                                    ErrorMessage="Вкажіть ім'я по-батькові!" ValidationGroup="elmsCreateUserWizard"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lbl_email" Text="E-mail(корпоративний)" runat="server"></asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="tb_email" runat="server" BorderWidth="1px" Width="200px" Text='<%#Eval("EMail") %>'></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="tb_email"
                                                    ErrorMessage="Вкажіть корпоративну пошту!" ValidationGroup="elmsCreateUserWizard"
                                                    ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">
                                                <asp:RegularExpressionValidator ID="rev_email" runat="server" ErrorMessage="Некоректний формат"
                                                    ValidationGroup="elmsCreateUserWizard" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                    ControlToValidate="tb_email"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lbl_phone" runat="server">Телефон:</asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="tb_phone" runat="server" BorderWidth="1px" Width="200px" Text='<%#Eval("Phone") %>'></asp:TextBox>
                                                <%--                                                <asp:RequiredFieldValidator ID="rfv_tb_phone" runat="server" ControlToValidate="tb_phone"
                                                    ErrorMessage="Вкажіть телефон!" ToolTip="Вкажіть телефон!" ValidationGroup="elmsCreateUserWizard"
                                                    Text="Вкажіть телефон!" ForeColor="Red"></asp:RequiredFieldValidator>--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center">
                                                <asp:RegularExpressionValidator ID="rev_tb_phone" runat="server" ErrorMessage="Некоректний формат"
                                                    ValidationGroup="elmsCreateUserWizard" Display="Dynamic" ValidationExpression="[0-9]+(?:[0-9]*)"
                                                    ControlToValidate="tb_phone"></asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                        <%--                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lblFilial" runat="server">Організація:</asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="tb_filial" runat="server" BorderWidth="1px" Width="200px" Text='<%#Eval("Filial") %>'></asp:TextBox>
                                                <asp:AutoCompleteExtender ID="tb_filial_AutoCompleteExtender" runat="server" Enabled="True"
                                                    ServiceMethod="GetCompletionFilialList" ServicePath="~/WebServices/AutoComplete.asmx"
                                                    TargetControlID="tb_filial" UseContextKey="True" MinimumPrefixLength="2" CompletionInterval="10"
                                                    EnableCaching="true" CompletionSetCount="10">
                                                </asp:AutoCompleteExtender>
                                                <asp:RequiredFieldValidator ID="rfv_filial" runat="server" ControlToValidate="tb_filial"
                                                    ErrorMessage="Вкажіть організацію!" ToolTip="Вкажіть організацію!" ValidationGroup="elmsCreateUserWizard"
                                                    Text="Вкажіть організацію!" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>--%>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lbl_city" runat="server">Місто:</asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="tb_city" runat="server" BorderWidth="1px" Width="200px" Text='<%#Eval("City") %>'></asp:TextBox>
                                                <asp:AutoCompleteExtender ID="tb_city_AutoCompleteExtender" runat="server" Enabled="True"
                                                    ServiceMethod="GetCompletionCityList" ServicePath="~/WebServices/AutoComplete.asmx"
                                                    TargetControlID="tb_city" UseContextKey="True" MinimumPrefixLength="2" CompletionInterval="10"
                                                    EnableCaching="true" CompletionSetCount="10">
                                                </asp:AutoCompleteExtender>
                                                <asp:RequiredFieldValidator ID="rfv_city" runat="server" ControlToValidate="tb_city"
                                                    ErrorMessage="Вкажіть місто!" ForeColor="Red" ValidationGroup="elmsCreateUserWizard"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right">
                                                <asp:Label ID="lbl_job" runat="server">Посада:</asp:Label>
                                            </td>
                                            <td align="left">
                                                <asp:TextBox ID="tb_job" runat="server" BorderWidth="1px" Width="200px" Text='<%#Eval("Job") %>'></asp:TextBox>
                                                <asp:AutoCompleteExtender ID="tb_job_AutoCompleteExtender" ServicePath="~/WebServices/AutoComplete.asmx"
                                                    runat="server" Enabled="True" ServiceMethod="GetCompletionJobList" TargetControlID="tb_job"
                                                    UseContextKey="True" MinimumPrefixLength="2" CompletionInterval="10" EnableCaching="true"
                                                    CompletionSetCount="10">
                                                </asp:AutoCompleteExtender>
                                                <asp:RequiredFieldValidator ID="rfv_job" runat="server" ControlToValidate="tb_job"
                                                    ErrorMessage="Вкажіть посаду!" ForeColor="Red" ValidationGroup="elmsCreateUserWizard"></asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" style="color: red">
                                                <asp:Label ID="lbl_error" runat="server" EnableViewState="False" Text="" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr id="tr_captchaImage" runat="server">
                                            <td align="right"></td>
                                            <td>
                                                <asp:Image ID="imCaptcha" runat="server" CssClass="captchaImg" ImageUrl="~/Utils/ZCaptcha.ashx"
                                                    resourcekey="imCaptcha" />
                                                <asp:ImageButton ID="imb_reload" runat="server" ImageUrl="~/Resources/reload.png"
                                                    OnClick="imb_reload_Click" />
                                                <%--<asp:Button ID="btnReloadCaptcha" runat="server" CausesValidation="false" CssClass="refreshCaptcha"
                        OnClick="btnReloadCaptcha_Click" Text="Оновити" />--%>
                                            </td>
                                        </tr>
                                        <tr id="tr_captchaValidation" runat="server">
                                            <td align="right">
                                                <asp:Label ID="lbl_captcha" runat="server" AssociatedControlID="tbCaptchaText">Введіть цифри: </asp:Label>
                                            </td>
                                            <td>
                                                <asp:TextBox ID="tbCaptchaText" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="rfv_captcha" runat="server" ControlToValidate="tbCaptchaText"
                                                    ForeColor="red" Text="Введіть перевірочні дані!" ValidationGroup="elmsCreateUserWizard"></asp:RequiredFieldValidator>
                                                <asp:CustomValidator ID="cvCapthcaText" runat="server" ControlToValidate="tbCaptchaText"
                                                    ForeColor="Red" OnServerValidate="CAPTCHAValidate" Text="Невірні перевірочні дані!"
                                                    ValidationGroup="elmsCreateUserWizard"></asp:CustomValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" align="center"></td>
                                        </tr>
                                    </table>
                                </td>
                                <td>
                                    <asp:Panel runat="server" ID="pan_roles">
                                        Ролі:<br />
                                        <asp:CheckBoxList ID="cbRoles" runat="server">
                                        </asp:CheckBoxList>
                                    </asp:Panel>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <asp:Button ID="btn_save" Text="Зберегти" runat="server" CausesValidation="true"
                        ValidationGroup="elmsCreateUserWizard" OnClick="btn_save_Click" />
                    <asp:Button ID="btn_cancel" Text="Відміна" runat="server" CausesValidation="true"
                        ValidationGroup="elmsCreateUserWizard" OnClick="btn_cancel_Click" />
                </EditItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
</div>
