<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EUserEnrollmentManager.ascx.cs" Inherits="ELMS13.Controls.EUserEnrollmentManager" %>
<%@ Register Src="../Controls/EUserManager.ascx" TagName="EUserManager" TagPrefix="uc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <p>
            Група:
        <asp:DropDownList ID="ddl_groups" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_groups_SelectedIndexChanged"
            DataTextField="Code" DataValueField="ID" AppendDataBoundItems="true" Width="200px">
            <%--<asp:ListItem Text="" Value=""></asp:ListItem>--%>
        </asp:DropDownList>
        </p>
        <p>
            <asp:Label runat="server" ID="lbl_t" Text="Викладачі:" Width="100px"></asp:Label>&nbsp<asp:Label ID="lbl_group_teachers" runat="server" Font-Bold="True" ForeColor="#4E97C0"></asp:Label><br />
            <asp:Label runat="server" ID="lbl_m" Text="Методист:" Width="100px"></asp:Label>&nbsp<asp:Label ID="lbl_group_methodist" runat="server" Font-Bold="True" ForeColor="#4E97C0"></asp:Label><br />
            <asp:Label runat="server" ID="lbl_a" Text="Адміністратор:" Width="100px"></asp:Label>&nbsp<asp:Label ID="lbl_group_admin" runat="server" Font-Bold="True" ForeColor="#4E97C0"></asp:Label><br />
        </p>
        <p>
            &nbsp;<uc1:EUserManager ID="uc_users" runat="server" AllowSelectUser="true" OnSelectedUserChanged="uc_users_SelectedUserChanged" />
        </p>
        <div id="control_btns" runat="server" style="width: 872px">
            <div style="float: left; width: 400px">
                <asp:LinkButton ID="lbtn_Enroll" runat="server" OnClick="lbtn_Enroll_Click" ToolTip="Перейти до списку бажаючих"></asp:LinkButton>
                <asp:LinkButton ID="lbtn_All_Enroll" runat="server" OnClick="lbtn_All_Enroll_Click" ToolTip="Перейти до списку усіх слухачів" Text="Усі слухачі"></asp:LinkButton>
                <asp:Button ID="btn_unEnroll" runat="server" Text="Відрахувати" OnClick="btn_unEnroll_Click" />
                <asp:Button ID="btn_Enroll" runat="server" Text="Зарахувати" OnClick="btn_Enroll_Click" />
                <asp:Button ID="btn_EnrollCancel" runat="server" Text="Назад" OnClick="btn_EnrollCancel_Click" />
            </div>
            <div style="float: right; width: 100px">
                <asp:Button ID="btn_Delete" runat="server" Text="Видалити" OnClick="btn_Delete_Click" />
            </div>
            <br />
            <asp:Label ID="lbl_status" runat="server"></asp:Label>
        </div>
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="lbtn_Enroll"/>
        <asp:PostBackTrigger ControlID="lbtn_All_Enroll"/>
        <asp:PostBackTrigger ControlID="btn_unEnroll"/>
        <asp:PostBackTrigger ControlID="btn_Enroll"/>
        <asp:PostBackTrigger ControlID="btn_EnrollCancel"/>
        <asp:PostBackTrigger ControlID="btn_Delete"/>
    </Triggers>
</asp:UpdatePanel>


