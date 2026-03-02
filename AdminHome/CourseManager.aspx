<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CourseManager.aspx.cs" Inherits="ELMS13.AdminHome.CourseManager" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
    <link rel="stylesheet" href="../Scripts/jquery-ui-1.10.0.custom.min.css" />
    <script src="../Scripts/jquery-1.9.0.js"></script>
    <script src="../Scripts/jquery-ui-1.10.0.custom.min.js"></script>
    <script>
        window.onload = load;
        var activeIndex = 0;
        function rendAccordition() {
            $("#accordion").accordion({
                heightStyle: "content",
                collapsible: true,
                active: activeIndex,
                activate: onAccActivate
            });
        }
        function onAccActivate(event, ui) {
            activeIndex = $('#accordion').accordion('option', 'active');
        }
        function load() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(rendAccordition);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <p>
                <asp:Panel runat="server" ID="pan_visibleFilter">
                    Показати:
        <asp:DropDownList ID="ddl_course_activeStatus" runat="server" OnSelectedIndexChanged="ddl_course_activeStatus_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Selected="True" Text="Активні" Value="1"></asp:ListItem>
            <asp:ListItem Text="Не активні" Value="2"></asp:ListItem>
            <asp:ListItem Text="Архів" Value="3"></asp:ListItem>
        </asp:DropDownList>
                </asp:Panel>
            </p>
            <div id="accordion">
                <asp:Repeater ID="rep_courses" runat="server" OnItemDataBound="rep_courses_ItemDataBound">
                    <ItemTemplate>
                        <h3><%#Eval("Key") %></h3>
                        <div>
                            <asp:GridView ID="gv_courses" runat="server" AutoGenerateColumns="false" OnRowDataBound="gv_courses_RowDataBound"
                                CssClass="mcour" DataKeyNames="ID">
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                                    <asp:TemplateField HeaderText="Найменування курсу">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_course_name" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="tb_course_name" runat="server" Width="200px" Text='<%#Eval("Name") %>'></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_course_name" runat="server" ErrorMessage="*" ControlToValidate="tb_course_name" ForeColor="Red" ValidationGroup="courseEdit"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Категорія">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_course_category" runat="server" Text='<%#Eval("CategoryName") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddl_course_category" runat="server" DataTextField="Description" DataValueField="ID"></asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <EditItemTemplate>
                                            <asp:DropDownList ID="ddl_course_status" runat="server">
                                                <asp:ListItem Selected="True" Text="Активні" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="Не активні" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="Архів" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lb_course_edit" runat="server" Text="Редагувати" OnClick="lb_course_edit_Click"
                                                BackColor="LightGreen"
                                                CommandArgument='<%#DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:LinkButton ID="lb_course_save" runat="server" Text="Зберегти" OnClick="lb_course_save_Click"
                                                BackColor="LightGreen" ValidationGroup="courseEdit"></asp:LinkButton>
                                            <asp:LinkButton ID="lb_course_cancel" runat="server" Text="Відмінити" OnClick="lb_course_cancel_Click"
                                                BackColor="LightYellow"></asp:LinkButton>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
<%--                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lb_course_delete" runat="server" Text="Видалити" OnClick="lb_course_delete_Click"
                                                BackColor="LightPink"
                                                CommandArgument='<%#DataBinder.Eval(Container, "RowIndex") %>'
                                                OnClientClick='<%#Eval("Name","return confirm(\"Ви дійсно бажаєти видалити курс {0}?\")") %>'></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hl_RunCourse" runat="server" NavigateUrl='<%# Eval("Id", "../StudentHome/CourseContainer.aspx?CourseID={0}") %>'
                                                Text="Відкрити курс" BackColor="LightBlue">
                                            </asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Left" />
                            </asp:GridView>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <script>
                rendAccordition();

            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:LinkButton ID="lb_show_course_add" runat="server" OnClick="lb_show_course_add_Click" Text="Додати новий курс"></asp:LinkButton>
    <br />
    <asp:Panel ID="pan_course_add" runat="server" BorderWidth="1px" Visible="false">
        <b>Виберіть файл курсу для завантаження у систему:</b>
        <br />
        <asp:FileUpload ID="fupload" runat="server" BorderWidth="1px" Width="400px" ViewStateMode="Enabled" EnableViewState="true" />

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <%--<asp:RequiredFieldValidator ID="rfv_course_add_fupload" runat="server" ControlToValidate="fupload" ErrorMessage="*" ForeColor="Red" ValidationGroup="courseAdd"></asp:RequiredFieldValidator>--%>
                <br />
                <b>Введіть назву папки для курсу:</b>
                <br />
                (папка буде створена у каталозі курсів:
                            <asp:Label ID="lb_couserPath" runat="server" Font-Bold="True"></asp:Label>
                )<br />

                <asp:TextBox ID="tb_course_add_name" runat="server" BorderWidth="1px" Width="400px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfv_couser_add_name" runat="server" ControlToValidate="tb_course_add_name" ErrorMessage="*" ForeColor="Red" ValidationGroup="courseAdd"></asp:RequiredFieldValidator>
                <br />
                <b>Категорія</b>
                <br />
                <asp:DropDownList ID="ddl_couser_add_category" runat="server" AutoPostBack="true" DataTextField="Description" DataValueField="ID" Width="400px">
                </asp:DropDownList>
                <br />
                <asp:Label ID="UploadStatusLabel" runat="server"></asp:Label>
                <br />

            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:LinkButton ID="lb_course_add_load" runat="server" BackColor="LightBlue" OnClick="lb_course_add_load_Click" Text="Завантажити" ValidationGroup="courseAdd"></asp:LinkButton>
        <asp:LinkButton ID="lb_course_add_cancel" runat="server" BackColor="LightGray" OnClick="lb_course_add_cancel_Click" Text="Скасувати"></asp:LinkButton>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>
