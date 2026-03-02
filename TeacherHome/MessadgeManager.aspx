<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" ValidateRequest="false" CodeBehind="MessadgeManager.aspx.cs" Inherits="ELMS13.TeacherHome.MessadgeManager" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<%@ Register Src="~/Controls/EUserManager.ascx" TagPrefix="uc1" TagName="EUserManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <asp:ScriptManager ID="sm" runat="server">
    </asp:ScriptManager>
    <p>
        <asp:Label ID="lbl_groups" runat="server" Text="Група:" Width="50px"></asp:Label>
        <asp:DropDownList ID="ddl_groups" runat="server" Width="300" AutoPostBack="True" OnSelectedIndexChanged="ddl_groups_SelectedIndexChanged"
            AppendDataBoundItems="true" DataTextField="Code" DataValueField="ID">
            <%--<asp:ListItem Text="Будь-яка" Value="irrelevant"></asp:ListItem>--%>
            <asp:ListItem Text="" Value=""></asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="lbl_courses" runat="server" Text="Курс:" Width="50px"></asp:Label>
        <asp:DropDownList ID="ddl_courses" runat="server" Width="300" AutoPostBack="True" OnSelectedIndexChanged="ddl_courses_SelectedIndexChanged"
            DataTextField="Name" DataValueField="ID">
            <asp:ListItem Text="" Value=""></asp:ListItem>
        </asp:DropDownList>
    </p>

    <asp:Panel ID="pnl_users" runat="server">
        <asp:UpdatePanel runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <uc1:EUserManager runat="server" ID="uc_userManager" AllowCreateUser="False" AllowPickUser="False"
                    AllowSelectUser="True" FilterCheckBoxRowCount="3" ShowFilters="True" OnSelectedUserChanged="uc_userManager_SelectedUserChanged" />


                <br />
                <p>
                    Кількість&nbsp;обраних&nbsp;користувачів:&nbsp;
            <asp:Label ID="lbl_selectedCount" runat="server" Text="0"></asp:Label>
                </p>
                <asp:Panel ID="pan_sendMessadge" runat="server" Visible="false">
                    <p>
                        <FTB:FreeTextBox ID="ftb_textBody" runat="server"
                            ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;|InsertTable,EditTable;CreateLink,Unlink">
                        </FTB:FreeTextBox>
                        <asp:RequiredFieldValidator ID="rfv_messBody" ControlToValidate="ftb_textBody" ErrorMessage="Пусте повідомлення" ForeColor="Red" runat="server" ValidationGroup="textBody"></asp:RequiredFieldValidator>
                    </p>

                    <asp:Button ID="btn_send" runat="server" Text="Відправити" OnClick="btn_send_Click" ValidationGroup="textBody" />
                    <asp:Button ID="btn_cancel" runat="server" Text="Скасувати" OnClick="btn_cancel_Click" />
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btn_send" />
                <asp:PostBackTrigger ControlID="btn_cancel" />
            </Triggers>
        </asp:UpdatePanel>
        <div style="float:right"> <asp:FileUpload ID="fu_mail_attached" runat="server" ToolTip="Прикріпити файл до листа" EnableViewState="true" ViewStateMode="Enabled" /></div>
           
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>
