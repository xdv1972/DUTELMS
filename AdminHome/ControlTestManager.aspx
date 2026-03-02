<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="ControlTestManager.aspx.cs" Inherits="ELMS13.AdminHome.ControlTestManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
    <style type="text/css">
        a.footer_add {
            padding: 3px 0px 0px 1px;
            color: white;
            -webkit-transition: background-color 0.5s ease;
            -webkit-transition: color 0.5s ease;
        }

            a.footer_add:hover {
                color: #995936;
                background-color: white;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <asp:ScriptManager runat="server" ID="scriptManager1"></asp:ScriptManager>
    <table width="100%" border="0">
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

    <p>
        <asp:UpdatePanel runat="server" ID="up">
            <ContentTemplate>
                <p>
                    <asp:GridView ID="gv_questions" runat="server" AutoGenerateColumns="False"
                        OnRowDataBound="gv_questions_RowDataBound" OnRowCommand="gv_questions_RowCommand" OnRowUpdating="gv_questions_RowUpdating" ShowFooter="true">
                        <Columns>
                            <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtn_answers" runat="server" CausesValidation="False" Text="Відповіді" CommandArgument='<%# Bind("_id") %>' OnClick="lbtn_answers_Click" ToolTip='<%# Bind("_id") %>'></asp:LinkButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Panel ID="panel2" runat="server" HorizontalAlign="Center">
                                        <asp:LinkButton ID="lbtn_add_question" runat="server" Text="Додати" Width="76px" Height="26px" CssClass="footer_add"
                                            OnClick="lbtn_add_question_Click" />
                                    </asp:Panel>
                                </FooterTemplate>
                                <ControlStyle CssClass="edit" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Текст питання">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("text") %>'></asp:Label>
                                    <asp:TextBox ID="tb_question_text" Width="700px" runat="server" Visible="false" Text='<%# Bind("text") %>'>></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Panel ID="pnl_add_code" runat="server" Height="26px">
                                        <span style="display: inline-block; float: left; margin-top: 1px">
                                            <asp:TextBox ID="tb_qtext_add" Width="700px" runat="server"></asp:TextBox></span>
                                    </asp:Panel>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Відповіді">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_qtype" runat="server" Text='<%# Eval("q_type") %>'></asp:Label>
                                    <asp:DropDownList ID="ddl_qtype" runat="server" Visible="false" AutoPostBack="true" CausesValidation="true">
                                        <asp:ListItem Value="1">Одна</asp:ListItem>
                                        <asp:ListItem Value="2">Багато</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="ddl_qtype_add" runat="server">
                                        <asp:ListItem Value="1">Одна</asp:ListItem>
                                        <asp:ListItem Value="2">Багато</asp:ListItem>
                                    </asp:DropDownList>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Питання видно?">
                                <ItemTemplate>
                                    <asp:Label ID="TickLabel" runat="server" Text='<%# Bind("isVisible") %>'></asp:Label>
                                    <asp:CheckBox ID="Tick" runat="server" Visible="false" AutoPostBack="true" />
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:CheckBox ID="cb_qvisible_add" runat="server"></asp:CheckBox>
                                </FooterTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <asp:TextBox runat="server" Text="dfsfsd"></asp:TextBox>
                        </EmptyDataTemplate>
                        <FooterStyle BackColor="#995936" CssClass="footer_add" Height="26px" HorizontalAlign="Left" VerticalAlign="Middle" />
                        <HeaderStyle BackColor="#995936" ForeColor="White" />
                    </asp:GridView>
                    <%--<asp:TextBox runat="server" ID="skdjs"></asp:TextBox>--%>
                </p>

                <asp:Panel ID="pnl_answers" runat="server" Visible="false">
                    <asp:LinkButton runat="server" ID="lbtn_back_to_question" OnClick="lbtn_back_to_question_Click" Text="<< Повернутися до питань"></asp:LinkButton>
                    <p>
                        <span><b>Ви редагуєте питання:&nbsp;</b></span>
                        <asp:Label runat="server" ID="lbl_text_question"></asp:Label>
                    </p>
                    <asp:GridView ID="gv_answers" runat="server" AutoGenerateColumns="False"
                        OnRowDataBound="gv_answers_RowDataBound" OnRowCommand="gv_answers_RowCommand" OnRowUpdating="gv_answers_RowUpdating" ShowFooter="true">
                        <Columns>
                            <asp:ButtonField Text="SingleClick" CommandName="SingleClick" Visible="False" />
                            <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbtn_answer_del" runat="server" Text="Видалити" CommandArgument='<%# Bind("ID") %>' OnClick="lbtn_answer_del_Click"></asp:LinkButton>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Panel ID="panel2" runat="server" HorizontalAlign="Center">
                                        <asp:LinkButton ID="lbtn_add_answer" runat="server" Text="Додати" Width="76px" Height="26px" CssClass="footer_add"
                                            OnClick="lbtn_add_answer_Click" />
                                    </asp:Panel>
                                </FooterTemplate>
                                <ControlStyle CssClass="edit" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Текст відповіді">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_answer_text" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                                    <asp:TextBox ID="tb_answer_text" runat="server" Visible="false" Text='<%# Bind("Description") %>'>></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="tb_atext_add" runat="server"></asp:TextBox>
                                </FooterTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Відповідь правильна?">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_acorr" runat="server" Text='<%# Bind("isCorrect") %>'></asp:Label>
                                    <asp:DropDownList ID="ddl_acorr" runat="server" Visible="false" AutoPostBack="true">
                                        <asp:ListItem Value="0">-</asp:ListItem>
                                        <asp:ListItem Value="1">+</asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="ddl_acorr_add" runat="server">
                                        <asp:ListItem Value="0">-</asp:ListItem>
                                        <asp:ListItem Value="1">+</asp:ListItem>
                                    </asp:DropDownList>
                                </FooterTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#995936" ForeColor="White" />
                        <FooterStyle BackColor="#995936" CssClass="footer_add" Height="26px" HorizontalAlign="Center" VerticalAlign="Middle" />
                    </asp:GridView>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </p>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>




