<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="UserAdd.aspx.cs" Inherits="ELMS13.AdminHome.UserAdd" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <p>
        <asp:Label runat="server" ID="lbl_enter_login" Text="Введіть логін:" Width="200px"></asp:Label>
        <asp:TextBox runat="server" ID="tb_login" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_login"
            ErrorMessage="Вкажіть логін!" Display="Dynamic" ValidationGroup="enterLogin"
            ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:Button runat="server" ID="btn_enter_login" Text="Прийняти" OnClick="btn_enter_login_Click" CausesValidation="true" ValidationGroup="enterLogin" /><br />
        <asp:Label ID="lbl_is_login_exist" runat="server" Text="Даний логін вже є в системі. Введіть інший." Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label><br />
    </p>
    <asp:Panel runat="server" ID="pnl_user_info" Visible="false">
        <asp:Label runat="server" ID="Label1" Text="Прізвище:" Width="200px"></asp:Label>
        <asp:TextBox runat="server" ID="tb_lname" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvlname" runat="server" ControlToValidate="tb_lname"
            ErrorMessage="Вкажіть прізвище!" Display="Dynamic" ValidationGroup="elmsCreateUserWizard"
            ForeColor="Red"></asp:RequiredFieldValidator><br />
        <asp:Label runat="server" ID="Label2" Text="Ім'я:" Width="200px"></asp:Label>
        <asp:TextBox runat="server" ID="tb_fname" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_fname" runat="server" ControlToValidate="tb_fname"
            ErrorMessage="Вкажіть ім'я!" ValidationGroup="elmsCreateUserWizard" ForeColor="Red"></asp:RequiredFieldValidator><br />
        <asp:Label runat="server" ID="Label3" Text="По-батькові:" Width="200px"></asp:Label>
        <asp:TextBox runat="server" ID="tb_mname" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_MIddleName" runat="server" ControlToValidate="tb_mname"
            ErrorMessage="Вкажіть ім'я по-батькові!" ValidationGroup="elmsCreateUserWizard"
            ForeColor="Red"></asp:RequiredFieldValidator><br />
        <asp:Label runat="server" ID="Label4" Text="Email (корпоративний):" Width="200px"></asp:Label>
        <asp:TextBox runat="server" ID="tb_mail" Width="200px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_email" runat="server" ControlToValidate="tb_mail"
            ErrorMessage="Вкажіть корпоративну пошту!" ValidationGroup="elmsCreateUserWizard"
            ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="rev_email" runat="server" ErrorMessage="Некоректний формат"
            ValidationGroup="elmsCreateUserWizard" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ControlToValidate="tb_mail"></asp:RegularExpressionValidator><br />
        <asp:Label runat="server" ID="Label5" Text="Організація:" Width="200px"></asp:Label>
        <asp:TextBox runat="server" ID="tb_filial" Width="200px"></asp:TextBox>
        <asp:AutoCompleteExtender ID="tb_filial_AutoCompleteExtender" runat="server" Enabled="True"
            ServiceMethod="GetCompletionFilialList" ServicePath="~/WebServices/AutoComplete.asmx"
            TargetControlID="tb_filial" UseContextKey="True" MinimumPrefixLength="2" CompletionInterval="10"
            EnableCaching="true" CompletionSetCount="10">
        </asp:AutoCompleteExtender>
        <asp:RequiredFieldValidator ID="rfv_filial" runat="server" ControlToValidate="tb_filial"
            ErrorMessage="Вкажіть організацію!" ToolTip="Вкажіть організацію!" ValidationGroup="elmsCreateUserWizard"
            Text="Вкажіть організацію!" ForeColor="Red"></asp:RequiredFieldValidator><br />
        <asp:Label runat="server" ID="Label6" Text="Місто:" Width="200px"></asp:Label>
        <asp:TextBox runat="server" ID="tb_city" Width="200px"></asp:TextBox>
        <asp:AutoCompleteExtender ID="tb_city_AutoCompleteExtender" runat="server" Enabled="True"
            ServiceMethod="GetCompletionCityList" ServicePath="~/WebServices/AutoComplete.asmx"
            TargetControlID="tb_city" UseContextKey="True" MinimumPrefixLength="2" CompletionInterval="10"
            EnableCaching="true" CompletionSetCount="10">
        </asp:AutoCompleteExtender>
        <asp:RequiredFieldValidator ID="rfv_city" runat="server" ControlToValidate="tb_city"
            ErrorMessage="Вкажіть місто!" ForeColor="Red" ValidationGroup="elmsCreateUserWizard"></asp:RequiredFieldValidator><br />
        <asp:Label runat="server" ID="Label7" Text="Посада:" Width="200px"></asp:Label>
        <asp:TextBox runat="server" ID="tb_job" Width="200px"></asp:TextBox>
        <asp:AutoCompleteExtender ID="tb_job_AutoCompleteExtender" ServicePath="~/WebServices/AutoComplete.asmx"
            runat="server" Enabled="True" ServiceMethod="GetCompletionJobList" TargetControlID="tb_job"
            UseContextKey="True" MinimumPrefixLength="2" CompletionInterval="10" EnableCaching="true"
            CompletionSetCount="10">
        </asp:AutoCompleteExtender>
        <asp:RequiredFieldValidator ID="rfv_job" runat="server" ControlToValidate="tb_job"
            ErrorMessage="Вкажіть посаду!" ForeColor="Red" ValidationGroup="elmsCreateUserWizard"></asp:RequiredFieldValidator><br />
        <asp:Label runat="server" ID="Label8" Text="Роль:" Width="200px"></asp:Label>
        <asp:DropDownList runat="server" ID="ddl_role" Width="206px">
            <asp:ListItem Text="Student" Value="Student"></asp:ListItem>
            <asp:ListItem Text="Administrator" Value="Administrator"></asp:ListItem>
            <asp:ListItem Text="SaleAdministrator" Value="SaleAdministrator"></asp:ListItem>
            <asp:ListItem Text="Teacher" Value="Teacher"></asp:ListItem>
            <asp:ListItem Text="Methodist" Value="Methodist"></asp:ListItem>
        </asp:DropDownList>
        <p>
            <asp:Button runat="server" ID="btn_add_user" Text="Додати" OnClick="btn_add_user_Click" CausesValidation="true"
                ValidationGroup="elmsCreateUserWizard" />
            <asp:Button runat="server" ID="btn_cancel" Text="Відміна" OnClick="btn_cancel_Click" />
        </p>
        <asp:Label runat="server" ID="lbl_error_add" ForeColor="Red" Font-Bold="true" Visible="false"></asp:Label>
    </asp:Panel>
    <asp:Label runat="server" ID="lbl_user_add_ok" ForeColor="Green" Visible="false" Text="Користувач у системі."></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>
