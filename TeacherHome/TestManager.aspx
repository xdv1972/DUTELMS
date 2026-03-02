<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="TestManager.aspx.cs" Inherits="ELMS13.TeacherHome.TestManager" %>

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
                <asp:Label ID="lbl_tests" runat="server" Text="Оберіть контрольне завдання:"></asp:Label>
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
                    <asp:GridView ID="gv_tests" runat="server" BackColor="White" BorderColor="#e9ecef" AutoGenerateColumns="False" DataKeyNames="uid"
                        OnRowDataBound="gv_tests_RowDataBound" OnRowCommand="gv_tests_RowCommand" OnRowUpdating="gv_tests_RowUpdating" OnPageIndexChanging="gv_tests_PageIndexChanging"
                        AllowSorting="True" AllowPaging="True" PageSize="20">
                        <Columns>
                            <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                            <asp:TemplateField HeaderText="uid" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_uid" runat="server" Text='<%# Eval("uid") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="П.І.Б.">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_fullname" runat="server" Text='<%# Eval("U_FullName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Контрольне завдання">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_loname" runat="server" Text='<%# Eval("LO_Name") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Бали">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_pscore" runat="server" Text='<%# Bind("P_Score") %>'></asp:Label>
                                    <asp:TextBox ID="tb_pscore" runat="server" Text='<%# Bind("P_Score") %>' Width="30px" Visible="false"></asp:TextBox>
                                    <asp:RangeValidator ID="RangeValidator1"
                                        ControlToValidate="tb_pscore"
                                        Display="Dynamic"
                                        Type="Integer"
                                        MinimumValue="0"
                                        MaximumValue="100"
                                        ErrorMessage="Оцінка має бути числом від 0 до 100"
                                        runat="server">
                    <img src="/../../Resources/warning.png" alt="Оцінка має бути числом від 0 до 100" title="Оцінка має бути числом від 0 до 100" width="24" height="24" style="margin:0px;padding:0px" />
                                    </asp:RangeValidator>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#995936" ForeColor="White" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div style="float: right; width: 350px">
            Щоб оцінити слухача:<br />
            1. Наведіть курсором на <strong>комірку з балом</strong> навпроти необхідного користувача<br />
            2. Натисніть <strong>ліву кнопку</strong> миші.<br />
            3. Введіть оцінку та натисніть <strong>Enter</strong>
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>
