<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="AttemptsManager.aspx.cs" Inherits="ELMS13.AdminHome.AttemptsManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>

    <table width="100%" border="0">
        <tr>
            <td style="width: 100px">
                <asp:Label ID="lbl_groups" runat="server" Text="Оберіть групу:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_groups" runat="server" Width="300" AutoPostBack="True" OnSelectedIndexChanged="ddl_groups_SelectedIndexChanged"
                    AppendDataBoundItems="true" DataTextField="Code" DataValueField="ID">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:Label ID="lbl_courses" runat="server" Text="Оберіть курс:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_courses" runat="server" Width="300" AutoPostBack="True" OnSelectedIndexChanged="ddl_courses_SelectedIndexChanged"
                    DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 100px">
                <asp:Label ID="lbl_tests" runat="server" Text="Оберіть тест:"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddl_tests" runat="server" Width="300" DataTextField="Name" AutoPostBack="True"
                    DataValueField="ID" AppendDataBoundItems="true" OnSelectedIndexChanged="ddl_tests_SelectedIndexChanged">
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />
    <br />
    <asp:Panel runat="server" ID="pnl_users" Visible="false">
        <div style="float: left">
            <asp:UpdatePanel runat="server" ID="up">
                <ContentTemplate>
                    <asp:GridView ID="gv_tests" runat="server" BackColor="White" BorderColor="#e9ecef" AutoGenerateColumns="False" DataKeyNames="UID"
                        OnRowDataBound="gv_tests_RowDataBound" OnRowCommand="gv_tests_RowCommand" OnRowUpdating="gv_tests_RowUpdating" OnPageIndexChanging="gv_tests_PageIndexChanging"
                        AllowSorting="True" AllowPaging="true" PageSize="30">
                        <Columns>
                            <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                            <asp:TemplateField HeaderText="uid" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_uid" runat="server" Text='<%# Eval("UID") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ПІБ">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_fullname" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Дозволена спроба?">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_loname" runat="server" Text='<%# Eval("isAllowText") %>'></asp:Label>
                                    <asp:CheckBox ID="cb_isAllow" runat="server" Visible="false" AutoPostBack="true" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Сума спроб">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_sum_att" runat="server" Text='<%# Bind("Count") %>'></asp:Label>
                                    <asp:TextBox ID="tb_sum_att" runat="server" Text='<%# Bind("Count") %>' Width="30px" Visible="false"></asp:TextBox>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#995936" ForeColor="White" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div style="float: right; width: 350px">
            Щоб виставити <strong>додаткові спроби</strong> слухачу:<br />
            1. Наведіть курсором на комірку <strong>Дозволити спроби?</strong> навпроти необхідного слухача<br />
            2. Натисніть <strong>ліву кнопку</strong> миші.<br />
            3. Натисніть <strong>чекбокс</strong><br />
            4. Далі наведіть курсор на комірку <strong>Сума сброб</strong> і натисніть <strong>ліву кнопку</strong> миші <br />
            5. Введіть кількість дозволених спроб та натисніть <strong>Enter</strong>
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>
