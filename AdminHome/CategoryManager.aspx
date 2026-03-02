<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CategoryManager.aspx.cs" Inherits="ELMS13.AdminHome.CategoryManager" %>

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
    <p>
        &nbsp;<asp:UpdatePanel ID="update1" runat="server">
            <ContentTemplate>
                <asp:GridView ID="gv_groups" runat="server" AutoGenerateColumns="False"
                    OnRowCancelingEdit="gv_groups_RowCancelingEdit"
                    OnRowEditing="gv_groups_RowEditing" OnRowUpdating="gv_groups_RowUpdating"
                    OnRowDataBound="gv_groups_RowDataBound"
                    ShowFooter="True" OnRowDeleting="gv_groups_RowDeleting">
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:Panel ID="panel1" runat="server" Width="150px">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Прийняти" CssClass="edit"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Відміна" CssClass="edit"></asp:LinkButton>
                                </asp:Panel>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Редагувати"></asp:LinkButton>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Panel ID="panel2" runat="server" HorizontalAlign="Center">
                                    <asp:LinkButton ID="lnkAddGroup" runat="server" Text="Додати" Width="86px" Height="26px" CssClass="footer_add"
                                        OnClick="lnkAddGroup_Click" />
                                </asp:Panel>
                            </FooterTemplate>
                            <ControlStyle CssClass="edit" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Шифр категорії">
                            <EditItemTemplate>
                                <asp:TextBox ID="tb_category_code" runat="server" Text='<%# Bind("Code") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("Code") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Panel ID="pnl_add_code" runat="server" Height="26px" Width="186px">
                                    <span style="display: inline-block; float: left; margin-top: 1px">
                                        <asp:TextBox ID="tb_code_add" runat="server"></asp:TextBox></span>
                                </asp:Panel>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Опис категорії">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Panel ID="pnl_add_caption" runat="server" Height="26px" Width="186px">
                                    <span style="display: inline-block; float: left; margin-top: 1px">
                                        <asp:TextBox ID="tb_caption_add" runat="server"></asp:TextBox></span>
                                </asp:Panel>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Батько">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddl_parent" runat="server" Width="200" AutoPostBack="true"
                                    AppendDataBoundItems="true" DataTextField="Description" DataValueField="ID">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                                <asp:HiddenField ID="hfParentName" runat="server" Value='<%# Bind("Parent_ID_Name") %>' />
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lbl_PId" runat="server" Text='<%# Bind("Parent_ID_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:DropDownList ID="ddl_parent_add" runat="server" Width="200" AutoPostBack="true"
                                    AppendDataBoundItems="true" DataTextField="Description" DataValueField="ID">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:LinkButton ID="lb_delete" CommandName="Delete" runat="server" Text="Видалити" CssClass="edit"/>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#995936" CssClass="footer_add" Height="26px" HorizontalAlign="Left" VerticalAlign="Middle" />
                    <HeaderStyle BackColor="#995936" ForeColor="White" />
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>




