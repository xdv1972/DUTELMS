<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeedbackTemplate.aspx.cs" Inherits="ELMS13.AdminHome.FeedbackTemplate"
    MasterPageFile="~/MasterPage.Master" Title="Шаблон зворотнього зв'язку" ValidateRequest="false" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <asp:ScriptManager ID="sm" runat="server">
    </asp:ScriptManager>

    <asp:Panel ID="pan_feedback" runat="server" Visible="true">
        <p>
            <FTB:FreeTextBox ID="ftb_feedback" runat="server" Width="700px"
                ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;|InsertTable,EditTable">
            </FTB:FreeTextBox>
            <asp:RequiredFieldValidator ID="rfv_messBody" ControlToValidate="ftb_feedback" ErrorMessage="Пустий шаблон" ForeColor="Red" runat="server" ValidationGroup="textBody"></asp:RequiredFieldValidator>
        </p>
        <p>
            <asp:TextBox ID="tb_usertag" runat="server" Text="{user}" ReadOnly="true" Width="90px"></asp:TextBox>
            <asp:Label ID="lbl_usertag" Text=" - буде замінено на ім'я студента" runat="server"></asp:Label><br />
            <asp:TextBox ID="tb_coursetag" runat="server" Text="{course}" ReadOnly="true" Width="90px"></asp:TextBox>
            <asp:Label ID="lbl_course" Text=" - буде замінено на назву курсу" runat="server"></asp:Label><br />
            <asp:TextBox ID="tb_date_start" runat="server" Text="{course_start}" ReadOnly="true" Width="90px"></asp:TextBox>
            <asp:Label ID="lbl_date_start" Text=" - буде замінено на початкову дату, коли курс відкритий" runat="server"></asp:Label><br />
            <asp:TextBox ID="tb_date_finish" runat="server" Text="{course_finish}" ReadOnly="true" Width="90px"></asp:TextBox>
            <asp:Label ID="lbl_date_finish" Text=" - буде замінено на кінцеву дату, коли курс відкритий" runat="server"></asp:Label><br />
            <asp:TextBox ID="tb_teachertag" runat="server" Text="{teacher}" ReadOnly="true" Width="90px"></asp:TextBox>
            <asp:Label ID="lbl_teachertag" Text=" - буде замінено на ім'я викладача" runat="server"></asp:Label><br />
            <asp:TextBox ID="tb_teacher_mailtag" runat="server" Text="{teacher_mail}" ReadOnly="true" Width="90px"></asp:TextBox>
            <asp:Label ID="Label1" Text=" - буде замінено на пошту викладача" runat="server"></asp:Label><br />
            <asp:TextBox ID="tb_admintag" runat="server" Text="{admin}" ReadOnly="true" Width="90px"></asp:TextBox>
            <asp:Label ID="lbl_admintag" Text=" - буде замінено на ім'я адміністратора" runat="server"></asp:Label><br />
            <asp:TextBox ID="tb_admin_mailtag" runat="server" Text="{admin_mail}" ReadOnly="true" Width="90px"></asp:TextBox>
            <asp:Label ID="lbl_admin_mailtag" Text=" - буде замінено на пошту адміністратора" runat="server"></asp:Label><br />
            <asp:TextBox ID="tb_admin_phonetag" runat="server" Text="{admin_phone}" ReadOnly="true" Width="90px"></asp:TextBox>
            <asp:Label ID="lbl_admin_phonetag" Text=" - буде замінено на телефон адміністратора" runat="server"></asp:Label><br />
        </p>
        <asp:Button ID="btn_save_feedback" runat="server" Text="Зберегти шаблон" ValidationGroup="textBody" OnClick="btn_save_feedback_Click" />
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
