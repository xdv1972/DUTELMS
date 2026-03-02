<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EUserManager.ascx.cs"
    Inherits="ELMS13.Controls.EUserManager" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<p>
    <asp:TextBox ID="tb_f_userName" Width="600px" runat="server" AutoPostBack="true" OnTextChanged="tb_f_userName_TextChanged"></asp:TextBox>
    <asp:TextBoxWatermarkExtender ID="tb_w_f_userName"
        runat="server"
        WatermarkText="Введіть ім'я користувача"
        TargetControlID="tb_f_userName">
    </asp:TextBoxWatermarkExtender>
    <asp:LinkButton ID="lb_f_abort" runat="server" Text="Скинути фільтри" OnClick="lb_f_abort_Click" BackColor="LightPink"></asp:LinkButton>
</p>

<p>
    Користувачів:&nbsp;<asp:Label ID="lbl_userCount" runat="server" />
</p>

<asp:GridView ID="gv_users" OnSorting="gv_users_Sorting" AutoGenerateColumns="False" Width="80%"
    OnPageIndexChanging="gv_users_PageIndexChanging" PageSize="20" AllowPaging="True"
    AllowSorting="True" runat="server" DataKeyNames="Login"
    OnRowDataBound="gv_users_RowDataBound" OnPageIndexChanged="gv_users_PageIndexChanged">
    <Columns>
        <asp:BoundField HeaderText="Логін" DataField="Login" SortExpression="Login" />
        <asp:BoundField HeaderText="ПІБ" DataField="FullName" SortExpression="LName" />
        <%--        <asp:BoundField HeaderText="Посада" DataField="Job" SortExpression="Job" />--%>
        <asp:BoundField HeaderText="Місто" DataField="City" SortExpression="City" />
        <asp:BoundField HeaderText="Посада" DataField="Job" SortExpression="Job" />
        <asp:BoundField HeaderText="Дата реєстрації" DataField="CreateDate" SortExpression="CreateDate"
            DataFormatString="{0:d/M/yyyy}" />
        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
            <HeaderTemplate>
                <asp:CheckBox ID="cb_selectAll" runat="server" OnCheckedChanged="cb_selectAll_CheckedChanged"
                    AutoPostBack="true" />
            </HeaderTemplate>
            <ItemTemplate>
                <asp:CheckBox ID="cb_selectOne" runat="server" OnCheckedChanged="cb_selectOne_CheckedChanged"
                    AutoPostBack="true" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
            <HeaderTemplate>
                <asp:ImageButton ClientIDMode="Static" ID="ib_createUser" runat="server" Width="20px"
                    Height="20px" ImageUrl="~/Resources/Add-icon.png" OnClick="ib_createUser_Click" />
            </HeaderTemplate>
            <ItemTemplate>
                <asp:ImageButton CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                    ClientIDMode="Static" ID="ib_showProfile" runat="server" Width="20px" Height="20px"
                    ImageUrl="~/Resources/User-icon.png" OnClick="ib_showProfile_Click" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>

<div>
    Кількість записів на сторінці:
                <asp:TextBox ID="tb_rowCount" runat="server" Width="20px" Text="20" AutoPostBack="true"
                    OnTextChanged="tb_rowCount_TextChanged"></asp:TextBox>
</div>


