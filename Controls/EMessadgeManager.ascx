<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EMessadgeManager.ascx.cs" Inherits="ELMS13.Controls.EMessadgeManager" %>

<%@ Register Assembly="FreeTextBox" Namespace="FreeTextBoxControls" TagPrefix="FTB" %>

<%@ Register Src="../Controls/EUserManager.ascx" TagName="EUserManager" TagPrefix="uc1" %>

<link rel="stylesheet" href="../Scripts/jquery-ui-1.10.0.custom.min.css" />
<script src="../Scripts/jquery-1.9.0.js"></script>
<script src="../Scripts/jquery-ui-1.10.0.custom.min.js"></script>
<script src="../Scripts/jquery.blockUI.js"></script>

<script>
    var activeIndex = 0;
    function rendControls() {
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
    window.onload = load;
    function load() {
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(rendControls);
    }
</script>

<asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>


<asp:UpdatePanel runat="server" ID="up1">
    <ContentTemplate>
        <p>
            <asp:Button runat="server" ID="btn_new_msg" OnClick="btn_new_msg_Click" Text="Новий лист" />
            <asp:LinkButton ID="lbtn_back" runat="server" OnClick="lbtn_back_Click" Text="<< Назад"></asp:LinkButton>
        </p>
        <asp:Panel runat="server" ID="pnl_main_menu" Style="width: 100%; min-height: 150px;">
            <div style="float: left; width: 140px; margin-top: 12px; padding: 0px">
                <asp:TreeView runat="server" ID="tv_mail_category" OnSelectedNodeChanged="tv_mail_category_SelectedNodeChanged">
                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black"
                        HorizontalPadding="0px" NodeSpacing="0px" VerticalPadding="0px" ImageUrl="~/Resources/folder.png" />
                    <ParentNodeStyle Font-Bold="False" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="Green"
                        HorizontalPadding="0px" VerticalPadding="0px" Font-Bold="true" />
                    <Nodes>
                        <asp:TreeNode Expanded="True" Text="Вхідні"></asp:TreeNode>
                        <asp:TreeNode Text="Відправлені"></asp:TreeNode>
                        <asp:TreeNode Expanded="True" Text="Видалені"></asp:TreeNode>
                        <%--<asp:TreeNode Text="Чернетка"></asp:TreeNode>--%>
                    </Nodes>
                </asp:TreeView>
            </div>
            <div style="float: right; width: 800px;">
                <p>
                    <div id="accordion">
                        <asp:Repeater ID="rep_mails" runat="server" OnItemDataBound="rep_mails_ItemDataBound">
                            <ItemTemplate>
                                <div style="vertical-align: central">
                                    <asp:Label ID="lbl_header_code" runat="server" Text='<%#Eval("Name") %>' Font-Size="12px"></asp:Label>
                                    <%--                                        <div style="float: right; display: inline-block; width: 30px;">
                                            <asp:ImageButton runat="server" ID="ibtn_delete_selected_mail" ImageUrl="~/Resources/mail_delete.png" OnClick="ibtn_delete_selected_mail_Click" ToolTip="Видалити листи" Visible="true" />
                                        </div>--%>
                                </div>
                                <div style="max-height: 500px; min-height: 0px; overflow-y: scroll">
                                    <asp:ListView runat="server" ID="lv_mails" OnItemDataBound="lv_mails_ItemDataBound">
                                        <ItemTemplate>
                                            <div style="display: inline-block; width: 30px; padding: 0px; margin: 0px">
                                                <asp:ImageButton runat="server" ID="ibtn_read_mail" ImageUrl="~/Resources/mail_new.png" CommandArgument='<%#Eval("ID") %>' OnClick="ibtn_read_mail_Click" ToolTip="Відкрити лист" />
                                            </div>
                                            <div style="margin-left: 10px; display: inline-block; width: 610px">
                                                <asp:Label ID="lbl_mail_sender_rep" runat="server" Font-Bold="true" Text='<%#Eval("SenderFIO") %>' Font-Size="10"></asp:Label>
                                                <asp:Label ID="lbl_mail_sendDate_rep" runat="server" Text='<%#Eval("Date","{0:dd/MM/yyyy}") %>' Font-Size="10" Font-Bold="true"></asp:Label>
                                                <br />
                                                <asp:Label ID="lbl_mail_subject_rep" runat="server" ForeColor="Gray" Text='<%#Eval("Thema") %>' Font-Size="10"></asp:Label>
                                            </div>
                                            <div style="display: inline-block; width: 30px">
                                                <asp:ImageButton runat="server" ID="ibtn_delete_mail" ImageUrl="~/Resources/mail_delete.png" CommandArgument='<%#Eval("ID") %>' OnClick="ibtn_delete_mail_Click" ToolTip="Видалити лист" />
                                            </div>
                                            <%--                                                <div style="display: inline-block; width: 30px">
                                                    <asp:CheckBox ID="cb_select_mail" runat="server" OnCheckedChanged="cb_select_mail_CheckedChanged" />
                                                </div>--%>
                                        </ItemTemplate>
                                    </asp:ListView>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </p>
            </div>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnl_mail" Style="width: 100%" Visible="false">
            <asp:Panel ID="pnl_mail_btns" runat="server" Width="100%" Height="30px">
                <div style="display: inline-block; float: left">
                    <asp:ImageButton runat="server" ID="ib_mail_reply" ImageUrl="~/Resources/mail_back.png" ToolTip="Відповісти" OnClick="ib_mail_reply_Click" />
                    <asp:ImageButton runat="server" ID="ib_mail_transfer" ImageUrl="~/Resources/mail_transfer.png" ToolTip="Переслати" OnClick="ib_mail_transfer_Click" />
                    <asp:ImageButton runat="server" ID="ib_mail_toinput" ImageUrl="~/Resources/mail_input.png" ToolTip="Перемістити у вхідні" OnClick="ib_mail_toinput_Click" />
                </div>
                <div style="display: inline-block; float: right">
                    <asp:ImageButton runat="server" ID="ib_mail_delete" ImageUrl="~/Resources/mail_delete.png" ToolTip="Видалити" OnClick="ib_mail_delete_Click" />
                </div>
            </asp:Panel>
            <asp:Label runat="server" ID="lbl_mail_subject" Font-Bold="true"></asp:Label><br />
            <span style="width: 90px; color: #4085AC">Відправник:&nbsp;</span>
            <asp:Label runat="server" ID="lbl_mail_sender"></asp:Label><br />
            <span style="width: 90px; color: #4085AC">Відправлено:&nbsp;</span>
            <asp:Label runat="server" ID="lbl_mail_date_send"></asp:Label><br />
            <p>
                <asp:Label runat="server" ID="lbl_body"></asp:Label>
            </p>
            <a id="link_attachfile" runat="server" target="_blank"></a>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnl_new_msg">
            <asp:Panel ID="pnl_repliers" runat="server">
                <%--<asp:ImageButton runat="server" ID="ib_mail_draft" ImageUrl="~/Resources/mail_draft.png" ToolTip="Зберегти як чернетку" />--%>
                <p>
                    <asp:Label ID="lbl_groups" runat="server" Text="Група:" Width="50px"></asp:Label>
                    <asp:DropDownList ID="ddl_groups" runat="server" Width="300" AutoPostBack="True" OnSelectedIndexChanged="ddl_groups_SelectedIndexChanged"
                        AppendDataBoundItems="true" DataTextField="Code" DataValueField="ID">
                        <%--<asp:ListItem Text="Будь-яка" Value="irrelevant"></asp:ListItem>--%>
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lbl_courses" runat="server" Text="Курс:" Width="50px"></asp:Label>
                    <asp:DropDownList ID="ddl_courses" runat="server" Width="300" AutoPostBack="True" OnSelectedIndexChanged="ddl_courses_SelectedIndexChanged"
                        DataTextField="Name" DataValueField="ID">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </p>

                <asp:Panel runat="server" ID="pnl_users">
                    <uc1:EUserManager runat="server" ID="uc_userManager" AllowCreateUser="False" AllowPickUser="False"
                        AllowSelectUser="True" FilterCheckBoxRowCount="3" ShowFilters="True" OnSelectedUserChanged="uc_userManager_SelectedUserChanged" />
                    <br />
                    <p>
                        Кількість&nbsp;обраних&nbsp;користувачів:&nbsp;
                    <asp:Label ID="lbl_selectedCount" runat="server" Text="0"></asp:Label>
                    </p>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="pnl_sendMessadge" runat="server" Visible="false">
                <p>
                    <b>Кому:</b>&nbsp;<asp:Label runat="server" ID="lbl_recipient"></asp:Label><br />
                    <b>Тема:</b>&nbsp;<asp:TextBox ID="tb_subject" runat="server" Width="850px"></asp:TextBox><br />

                    <FTB:FreeTextBox ID="ftb_textBody" runat="server" Width="900px"
                        ToolbarLayout="ParagraphMenu,FontFacesMenu,FontSizesMenu,FontForeColorsMenu,FontForeColorPicker,FontBackColorsMenu,FontBackColorPicker|Bold,Italic,Underline,Strikethrough,Superscript,Subscript,RemoveFormat|JustifyLeft,JustifyRight,JustifyCenter,JustifyFull;BulletedList,NumberedList,Indent,Outdent;|InsertTable,EditTable;CreateLink,Unlink">
                    </FTB:FreeTextBox>
                    <asp:RequiredFieldValidator ID="rfv_messBody" ControlToValidate="ftb_textBody" ErrorMessage="Пусте повідомлення" ForeColor="Red" runat="server" ValidationGroup="textBody"></asp:RequiredFieldValidator>
                </p>
                <asp:FileUpload ID="fu_mail_attached" runat="server" ToolTip="Прикріпити файл до листа" EnableViewState="true" ViewStateMode="Enabled" />
                <a id="link_attachname" runat="server" target="_blank" visible="false"></a>
                <asp:Panel ID="pnl_funcButtons" runat="server">
                    <asp:Button ID="btn_send" runat="server" Text="Відправити" OnClick="btn_send_Click" ValidationGroup="textBody" />
                    <asp:Button ID="btn_cancel" runat="server" Text="Скасувати" OnClick="btn_cancel_Click" />
                </asp:Panel>
            </asp:Panel>
        </asp:Panel>
        <script>
            rendControls();
        </script>
    </ContentTemplate>
    <Triggers>
        <asp:PostBackTrigger ControlID="btn_send" />
        <asp:PostBackTrigger ControlID="btn_cancel" />
    </Triggers>
</asp:UpdatePanel>

