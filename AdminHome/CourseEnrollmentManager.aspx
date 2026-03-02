<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CourseEnrollmentManager.aspx.cs" Inherits="ELMS13.AdminHome.CourseEnrollmentManager" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
    <link rel="stylesheet" href="../Scripts/jquery-ui-1.10.0.custom.min.css" />
    <script src="../Scripts/jquery-1.9.0.js"></script>
    <script src="../Scripts/jquery-ui-1.10.0.custom.min.js"></script>
    <script src="../Scripts/jquery.blockUI.js"></script>
    <style>
        #sortable {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

            #sortable li {
                margin: 0 3px 3px 3px;
                padding: 0.4em;
                padding-left: 1.5em;
                height: 10px;
            }

                #sortable li span {
                    position: absolute;
                    margin-left: -1.3em;
                }

        .pnl_tree {
            float: left;
            color: #fff;
            border: 1px #e0e0e0 solid;
            border-radius: 1px;
            box-shadow: 0px 0px 0px 6px #f6f6f6, 0px 0px 0px 7px #cccccc;
            width: 176px;
            padding: 10px;
        }

        .pnl_ct_data {
            float: right;
            padding: 0;
            font-size: 14px;
        }
    </style>
    <script>
        var activeIndex = 0;
        function rendControls() {
            $('#sortable').sortable({
                stop: function (event, ui) {
                    $('#courseOrderBlock').block();
                    //from EGroupManager
                    updateCourseOrder();
                }
            });
            $("#accordion").accordion({
                heightStyle: "content",
                collapsible: true,
                active: activeIndex,
                activate: onAccActivate
            });
            $(".posbackButton").bind("click", function (e) { e.stopPropagation(); });
        }
        function onAccActivate(event, ui) {
            activeIndex = $('#accordion').accordion('option', 'active');
        }
        function updateCourseOrder() {
            var courses = [];
            var i = 1;
            $('#sortable').find('li').each(function () {
                courses.push({
                    ID: $(this).attr('cid'),
                    Order: i
                });
                i++;
            });

            var options = {
                type: "POST",
                url: "CourseEnrollmentManager.aspx/UpdateCourseOrder",
                data: JSON.stringify({ "courses": courses }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (msg) {
                    $('#courseOrderBlock').unblock();
                }
            };
            $.ajax(options);
        }
        window.onload = load;
        function load() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(rendControls);
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <p>
        <asp:ScriptManager ID="sm" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        Група:
        <asp:DropDownList ID="ddl_groups" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_groups_SelectedIndexChanged"
            DataTextField="Code" DataValueField="ID" AppendDataBoundItems="true" Width="200px">
            <asp:ListItem Text="" Value=""></asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        &nbsp;<asp:Panel ID="pan_groupDetails" runat="server">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table style="border-collapse: collapse;" border="1" width="900px">
                        <tr>
                            <td>
                                <asp:Label ID="lbl_courses" runat="server" Text="Курси"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddl_courseStatus" runat="server" OnSelectedIndexChanged="ddl_courseStatus_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Selected="True" Text="Активні" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Не активні" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Архів" Value="3"></asp:ListItem>
                                </asp:DropDownList>
                                <asp:CheckBoxList ID="cbl_courses" runat="server" DataTextField="Name" DataValueField="ID" OnSelectedIndexChanged="cbl_courses_SelectedIndexChanged" OnDataBound="cbl_courses_DataBound" AutoPostBack="true"></asp:CheckBoxList>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lbl_courseOrder" runat="server" Text="Порядок"></asp:Label>
                            </td>
                            <td>
                                <div id="courseOrderBlock">
                                    <ul id="sortable">
                                        <asp:Repeater ID="rep_currentcoursesInGroup" runat="server">
                                            <ItemTemplate>
                                                <li class="ui-state-default" cid="<%#Eval("ID") %>"><span class="ui-icon ui-icon-arrowthick-2-n-s"></span><%#Eval("Name") %> </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btn_save" runat="server" Text="Прийняти" OnClick="btn_save_Click" ValidationGroup="groupDetail" />
                                <asp:Button ID="btn_cancel" runat="server" Text="Відмінити" OnClick="btn_cancel_Click" />
                            </td>
                        </tr>
                    </table>
                    <asp:Label ID="lbl_status" runat="server"></asp:Label>
                    <script>
                        rendControls();
                    </script>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btn_cancel" />
                    <asp:PostBackTrigger ControlID="btn_save" />
                </Triggers>
            </asp:UpdatePanel>
        </asp:Panel>
    </p>
    <asp:UpdatePanel ID="up_acordeon_group_course" runat="server">
        <ContentTemplate>
            <div id="accordion" style="width: 900px">
                <asp:Repeater ID="rep_group_courses" runat="server" OnItemDataBound="rep_group_courses_ItemDataBound">
                    <ItemTemplate>
                        <h6>
                            <asp:Label ID="lbl_group_courses_header" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                            <asp:HiddenField ID="hf_courseId" runat="server" Value='<%#Eval("ID") %>' />
                        </h6>
                        <asp:Panel runat="server" ID="pnl_rep_content">
                            <asp:Panel runat="server" ID="pnl_tree" Width="380px" ScrollBars="Auto" CssClass="drop-shadow pnl_tree">
                                <asp:TreeView ID="tv_course" runat="server" ShowLines="true" OnSelectedNodeChanged="tv_course_SelectedNodeChanged">
                                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black"
                                        HorizontalPadding="0px" NodeSpacing="0px" VerticalPadding="0px" />
                                    <ParentNodeStyle Font-Bold="False" />
                                    <SelectedNodeStyle Font-Underline="True" ForeColor="Green"
                                        HorizontalPadding="0px" VerticalPadding="0px" Font-Bold="true" />
                                </asp:TreeView>
                            </asp:Panel>
                            <asp:Panel ID="pnl_ct_data" runat="server" Visible="false" CssClass="pnl_ct_data" Width="380px">
                                <asp:HiddenField ID="hf_loId" runat="server" />
                                <table class="tablestyle">
                                    <tbody>
                                        <tr class="t">
                                            <th class="t">
                                                <asp:Label ID="lbl_passScore" runat="server" Text="Прохідний бал" Width="175"></asp:Label>
                                            </th>
                                            <td class="t">
                                                <asp:TextBox runat="server" ID="tb_passScore" Width="175"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="t">
                                            <th class="t">
                                                <asp:Label ID="lbl_maxScore" runat="server" Text="Максимальний бал"></asp:Label>
                                            </th>
                                            <td class="t">
                                                <asp:TextBox runat="server" ID="tb_maxScore" Width="175"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="t">
                                            <th class="t">
                                                <asp:Label ID="lbl_reviewTimes" runat="server" Text="Кількість спроб"></asp:Label>
                                            </th>
                                            <td class="t">
                                                <asp:TextBox runat="server" ID="tb_reviewTimes" Width="175"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="t">
                                            <th class="t">
                                                <asp:Label ID="lbl_question_duration" runat="server" Text="Секунди на питання"></asp:Label>
                                            </th>
                                            <td class="t">
                                                <asp:TextBox runat="server" ID="tb_question_duration" Width="175"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr class="t">
                                            <th class="t">
                                                <asp:Label ID="lbl_mixed" runat="server" Text="Випадкова вибірка?"></asp:Label>
                                            </th>
                                            <td style="text-align: center" class="t">
                                                <asp:CheckBox runat="server" ID="cb_mixed"></asp:CheckBox>
                                            </td>
                                        </tr>
                                        <tr class="t">
                                            <th class="t">
                                                <asp:Label ID="lbl_activeDateStart" runat="server" Text="Дата початку тесту"></asp:Label>
                                            </th>
                                            <td class="t">
                                                <asp:TextBox ID="tb_activeDateStart" runat="server" Width="175px"></asp:TextBox>
                                                <asp:CalendarExtender ID="tb_activeDateStart_calendarExtender" runat="server" TargetControlID="tb_activeDateStart"></asp:CalendarExtender>
                                            </td>
                                        </tr>
                                        <tr class="t">
                                            <th class="t">
                                                <asp:Label ID="lbl_activeDatefinish" runat="server" Text="Дата кінця тесту"></asp:Label>
                                            </th>
                                            <td class="t">
                                                <asp:TextBox ID="tb_activeDateFinish" runat="server" Width="175px"></asp:TextBox>
                                                <asp:CalendarExtender ID="tb_activeDateFinish_calendarExtender" runat="server" TargetControlID="tb_activeDateFinish"></asp:CalendarExtender>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <p>
                                    <asp:Label runat="server" ID="lbl_dateError" Font-Bold="true" ForeColor="Red" Visible="false" Text="Невірно обрані дати!"></asp:Label>
                                    <asp:Label runat="server" ID="lbl_isSuccess" Visible="false" Text="Зміни успішно збережені." ForeColor="#4085AC"></asp:Label>
                                </p>
                                <p>
                                    <asp:Button runat="server" ID="btn_save_ct" Text="Зберегти зміни" OnClick="btn_save_ct_Click" />
                                </p>
                            </asp:Panel>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <script>
                rendControls();
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>

    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>
