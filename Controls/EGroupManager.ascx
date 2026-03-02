<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EGroupManager.ascx.cs" Inherits="ELMS13.Controls.EGroupManager" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<style type="text/css">
    .pnl_teacher_submit {
        background-color: white;
        border: 1px solid #4085AC;
    }

    .PnlDesign {
        margin-bottom: 5px;
        height: 150px;
        width: 354px;
        overflow-y: scroll;
        background-color: white;
        font-size: 14px;
        font-family: Arial;
    }


    .ListControl input[type=checkbox], input[type=radio] {
        display: none;
    }

    .ListControl label {
        display: inline;
        float: left;
        color: #000;
        cursor: pointer;
        text-indent: 20px;
        white-space: nowrap;
    }

    .ListControl input[type=checkbox] + label {
        display: block;
        width: 1em;
        height: 1em;
        border: 0.0625em solid rgb(192,192,192);
        border-radius: 0.25em;
        background: #2f7398;
        background-image: -moz-linear-gradient(#559ec7,#2f7398);
        background-image: -ms-linear-gradient(#559ec7,#2f7398);
        background-image: -o-linear-gradient(#559ec7,#2f7398);
        background-image: -webkit-linear-gradient(#559ec7,#2f7398);
        background-image: linear-gradient(#559ec7,#2f7398);
        vertical-align: middle;
        line-height: 1em;
        font-size: 14px;
    }

    .ListControl input[type=checkbox]:checked + label::before {
        content: "\2714";
        color: #fff;
        height: 1em;
        line-height: 1.1em;
        width: 1em;
        font-weight: 900;
        margin-right: 6px;
        margin-left: -20px;
    }

    .ListControl input[type=checkbox]:checked + label {
        color: #4085AC;
    }
</style>
<p>
    &nbsp;<asp:Panel runat="server" ID="pan_active">
        <asp:Label ID="lbl_groupActiveStatus" runat="server" AssociatedControlID="ddl_groupActiveStatus"
            Text="Показати: "></asp:Label>

        <asp:DropDownList ID="ddl_groupActiveStatus" runat="server" AutoPostBack="true"
            OnSelectedIndexChanged="ddl_groupActiveStatus_SelectedIndexChanged">
            <asp:ListItem Selected="True" Text="Активні" Value="1"></asp:ListItem>
            <asp:ListItem Text="Не активні" Value="2"></asp:ListItem>
            <asp:ListItem Text="Архів" Value="3"></asp:ListItem>
        </asp:DropDownList>
    </asp:Panel>
</p>
<p>
    <div id="accordion">
        <asp:Repeater ID="rep_courses" runat="server" OnItemDataBound="rep_courses_ItemDataBound">
            <ItemTemplate>
                <h3>
                    <asp:ImageButton CommandArgument='<%#Eval("ID") %>' CssClass="posbackButton"
                        ID="ib_editGroup" runat="server" Width="20px" Height="20px"
                        ImageUrl="~/Resources/edit-icon.png" OnClick="ib_editGroup_Click" ToolTip="Редагувати групу" />
                    <asp:ImageButton CommandArgument='<%#Eval("ID") %>' CssClass="posbackButton"
                        ID="ib_showCourses" runat="server" Width="20px" Height="20px"
                        ImageUrl="~/Resources/training_icon.png" OnClick="ib_showCourses_Click" ToolTip="Приєднати курс до групи" />
                    <asp:ImageButton CommandArgument='<%#Eval("ID") %>' CssClass="posbackButton"
                        ID="ib_showUsers" runat="server" Width="20px" Height="20px"
                        ImageUrl="~/Resources/users-icon.png" OnClick="ib_showUsers_Click" ToolTip="Користувачі у групі" />
                    <asp:Label ID="lbl_header_code" runat="server" Text='<%#Eval("Code") %>'></asp:Label>
                </h3>
                <div>
                    <asp:GridView ID="gv_courses" runat="server" AutoGenerateColumns="false" OnRowDataBound="gv_groups_RowDataBound"
                        CssClass="mcour" DataKeyNames="ID">
                        <Columns>
                            <asp:BoundField DataField="Id" HeaderText="ID" ReadOnly="true" />
                            <asp:BoundField DataField="Name" HeaderText="Найменування курсу" ReadOnly="true" />
                            <asp:BoundField DataField="CategoryName" HeaderText="Категорія курсу" ReadOnly="true" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="hl_RunCourse" runat="server"
                                        Text="Відкрити курс" BackColor="LightBlue">
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle HorizontalAlign="Left" />
                    </asp:GridView>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</p>

<p>
    <asp:UpdatePanel runat="server" ID="up_group_edit" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pan_groupDetails" runat="server" Width="700px">
                <asp:Label ID="lbl_editInfo" runat="server"></asp:Label>
                <table class="table table-hover" id="tbl_add_group" runat="server">
                    <tr class="t">
                        <th class="active">
                            <asp:Label ID="lbl_code" runat="server" Text="Шифр"></asp:Label>
                        </th>
                        <td class="t">
                            <asp:TextBox ID="tb_code" runat="server" Width="350px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_code" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="tb_code" ValidationGroup="groupDetail"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="t">
                        <th class="active">
                            <asp:Label ID="lbl_name" runat="server" Text="Назва"></asp:Label>
                        </th>
                        <td class="t">
                            <asp:ComboBox ID="cb_group_name" runat="server" Width="330px" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDown"
                                DataTextField="Name" DataValueField="Name" RenderMode="Block" AutoPostBack="true">
                            </asp:ComboBox>
                            <asp:RequiredFieldValidator ID="rfv_name" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="cb_group_name" InitialValue="--Обрати--" ValidationGroup="groupDetail"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="t">
                        <th class="active">
                            <asp:Label ID="lbl_group_teacher" Text="Викладачі" runat="server"></asp:Label>
                        </th>
                        <td class="t">
                            <asp:TextBox runat="server" ID="tb_teachers" Width="350px" Text="--Обрати--">
                            </asp:TextBox>
                            <asp:Panel runat="server" ID="pnl_teacher_submit" CssClass="pnl_teacher_submit">
                                <asp:Panel ID="pnl_teacher_list" CssClass="PnlDesign" runat="server">
                                    <asp:CheckBoxList ID="cbl_teachers" runat="server" DataTextField="FullName" DataValueField="Login" CssClass="ListControl"></asp:CheckBoxList>
                                </asp:Panel>
                                <div style="padding: 5px 10px 5px 5px; border-top: 1px solid #4085AC">
                                    <asp:Button ID="btn_teachers_select" runat="server" Text="Обрати" OnClick="btn_teachers_select_Click" UseSubmitBehavior="false" />
                                    <asp:Button ID="btn_teachers_cancel" runat="server" Text="Відміна" OnClick="btn_teachers_cancel_Click" UseSubmitBehavior="false" />
                                </div>
                            </asp:Panel>
                            <asp:PopupControlExtender ID="pce_teacher_list" PopupControlID="pnl_teacher_submit" TargetControlID="tb_teachers" runat="server" Position="Bottom"></asp:PopupControlExtender>
                            <asp:RequiredFieldValidator ID="rfv_teacher" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="tb_teachers" ValidationGroup="groupDetail"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="t">
                        <th class="active">
                            <asp:Label ID="lbl_group_methodist" Text="Методист" runat="server"></asp:Label>
                        </th>
                        <td class="t">
                            <asp:ComboBox ID="cb_group_methodist" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDown" Width="330px"
                                DataTextField="FullName" DataValueField="Login" RenderMode="Block" AutoPostBack="true">
                            </asp:ComboBox>
                            <asp:RequiredFieldValidator ID="rfv_methodist" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="cb_group_methodist" InitialValue="--Обрати--" ValidationGroup="groupDetail"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="t">
                        <th class="active">
                            <asp:Label ID="lbl_group_admin" Text="Адміністратор" runat="server" Width="350px"></asp:Label>
                        </th>
                        <td class="t">
                            <asp:ComboBox ID="cb_group_admin" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="DropDown" Width="330px"
                                DataTextField="FullName" DataValueField="Login" RenderMode="Block" AutoPostBack="true">
                            </asp:ComboBox>
                            <asp:RequiredFieldValidator ID="rfv_admin" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="cb_group_admin" InitialValue="--Обрати--" ValidationGroup="groupDetail"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="t">
                        <th class="active">
                            <asp:Label ID="lbl_enrollPeriod" Width="350px" runat="server" Text="Відкрити реєстрацію*"></asp:Label>
                        </th>
                        <td class="t">З<asp:TextBox ID="tb_enrollDateStart" runat="server"></asp:TextBox>
                            <asp:CalendarExtender ID="tb_enrollDateStart_calendarExtender" runat="server" TargetControlID="tb_enrollDateStart" Format="d MMMM yyyy"></asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="rfv_tb_enrollDateStart" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="tb_enrollDateStart" ValidationGroup="groupDetail"></asp:RequiredFieldValidator>
                            По<asp:TextBox ID="tb_enrollDateFinish" runat="server"></asp:TextBox>
                            <asp:CalendarExtender ID="tb_enrollDateFinish_calendarExtender" runat="server" TargetControlID="tb_enrollDateFinish" Format="d MMMM yyyy"></asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="rfv_tb_enrollDateFinish" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="tb_enrollDateFinish" ValidationGroup="groupDetail"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="t">
                        <th class="active">
                            <asp:Label ID="lbl_activeDate" runat="server" Text="Відкрити групу**"></asp:Label>
                        </th>
                        <td class="t">З<asp:TextBox ID="tb_activeDateStart" runat="server"></asp:TextBox>
                            <asp:CalendarExtender ID="tb_activeDateStart_calenderExtender" runat="server" TargetControlID="tb_activeDateStart" Format="d MMMM yyyy"></asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="rfv_tb_activeDateStart" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="tb_activeDateStart" ValidationGroup="groupDetail"></asp:RequiredFieldValidator>
                            По<asp:TextBox ID="tb_activeDateFinish" runat="server"></asp:TextBox>
                            <asp:CalendarExtender ID="tb_activeDateFinish_calenderExtender" runat="server" TargetControlID="tb_activeDateFinish" Format="d MMMM yyyy"></asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="rfv_tb_activeDateFinish" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="tb_activeDateFinish" ValidationGroup="groupDetail"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="t">
                        <th class="active">
                            <asp:Label ID="lbl_expirationDate" Text="Регламентні роботи до***" runat="server"></asp:Label>
                        </th>
                        <td class="t">
                            <asp:TextBox ID="tb_expirationDate" runat="server" Width="350px"></asp:TextBox>
                            <asp:CalendarExtender ID="tb_expirationdate_calendarExtender" runat="server" TargetControlID="tb_expirationDate" Format="d MMMM yyyy"></asp:CalendarExtender>
                            <asp:RequiredFieldValidator ID="rfv_tb_expirationDate" runat="server" ErrorMessage="*" Display="Dynamic" ForeColor="Red"
                                ControlToValidate="tb_expirationDate" ValidationGroup="groupDetail"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr class="t">
                        <th class="active">
                            <asp:Label ID="lbl_groupStatus" runat="server" Text="Статус"></asp:Label>
                        </th>
                        <td class="t">
                            <asp:DropDownList ID="ddl_updateGroupStatus" runat="server" Width="350px">
                                <asp:ListItem Selected="True" Text="Активна" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Не активна" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Архів" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr class="t">
                        <td colspan="2" class="t">
                            <asp:Label ID="lbl_errors" runat="server" BackColor="#ff8a8a"></asp:Label>
                        </td>
                    </tr>
                    <tr class="t">
                        <td colspan="2" class="t">
                            <asp:Button ID="btn_save" runat="server" Text="Зберегти" OnClick="btn_save_Click" ValidationGroup="groupDetail" CssClass="btn btn-warning" />
                            <asp:Button ID="btn_cancel" runat="server" Text="Відмінити" OnClick="btn_cancel_Click" CssClass="btn btn-default" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btn_save" />
            <asp:PostBackTrigger ControlID="btn_cancel" />
            <%--<asp:AsyncPostBackTrigger ControlID="cb_group_teacher" EventName="SelectedIndexChanged" />--%>
            <asp:AsyncPostBackTrigger ControlID="cb_group_methodist" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="cb_group_admin" EventName="SelectedIndexChanged" />
            <asp:AsyncPostBackTrigger ControlID="cb_group_name" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>



</p>

<script>
    rendControls();
</script>
