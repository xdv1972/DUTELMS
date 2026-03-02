<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AvailableGroups.aspx.cs" Inherits="ELMS13.StudentHome.AvailableGroups"
    MasterPageFile="~/MasterPage.Master" Title="СДН :: Приватна кімната :: Доступні групи" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <p>
        <asp:GridView ID="gv_available_groups" runat="server" CssClass="edit" AutoGenerateColumns="False" OnRowCancelingEdit="gv_available_groups_RowCancelingEdit" OnRowEditing="gv_available_groups_RowEditing" OnRowUpdating="gv_available_groups_RowUpdating" OnSelectedIndexChanged="gv_available_groups_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="Code" HeaderText="Шифр групи" ReadOnly="True" />
                <asp:BoundField DataField="Caption" HeaderText="Назва групи" ReadOnly="True" />
                <asp:CheckBoxField HeaderText="Заявка" DataField="IsConfirm" />
                <asp:CommandField CancelText="Відміна" EditText="Обрати" ShowEditButton="True" UpdateText="Ок">
                    <ControlStyle CssClass="edit" />
                </asp:CommandField>
            </Columns>
            <HeaderStyle BackColor="#995936" ForeColor="White" />
        </asp:GridView>
    </p>
    <p>
        <asp:Label ID="lbl_no_requests" runat="server" Text="На даний момент доступних груп немає." Font-Bold="true"></asp:Label>
    </p>
    <p>
        <asp:Label ID="lbl_advice" runat="server" Text="Щоб подати заявку для реєстрації до групи необхідно:<br/>1. Натиснути <strong>Обрати</strong><br/>2. Поставити галочку <strong>Заявка</strong><br/>3. Натиснути <strong>Ок</strong><br/>"></asp:Label>
    </p>
    <asp:Label ID="lbl_warning" runat="server" ForeColor="Red" Font-Bold="true" Text="Чекайте підтвердження від адміністратора." Visible="false"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
