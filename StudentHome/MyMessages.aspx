<%@ Page Title="Мої повідомлення" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="MyMessages.aspx.cs" Inherits="ELMS13.StudentHome.MyMessages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="elmsSiteMapDS" ShowLines="True" ExpandDepth="1">
    </asp:TreeView>
    <asp:SiteMapDataSource ID="elmsSiteMapDS" runat="server" StartingNodeOffset="1" StartFromCurrentNode="false"
        ShowStartingNode="true" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <asp:GridView ID="gv_messadges" runat="server" DataKeyNames="ID" ShowHeader="false" AutoGenerateColumns="false" OnRowDataBound="gv_messadges_RowDataBound" AllowPaging="true" PageSize="30" OnPageIndexChanging="gv_messadges_PageIndexChanging">
        <Columns>
            <asp:TemplateField ControlStyle-Width="900px">
                <ItemTemplate>
                    От:
                        <asp:LinkButton ID="lb_m_from" runat="server" Text='<%#Eval("Sender") %>' Font-Bold="true" OnClick="lb_m_from_Click"
                            CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'></asp:LinkButton>

                    <asp:Panel ID="pan_m_text" runat="server" Visible="false"><%#Eval("Text") %></asp:Panel>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Date" DataFormatString="{0:d/M/yyyy HH:mm:ss}" />
        </Columns>
    </asp:GridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
    <asp:Label ID="lbl_test" runat="server"></asp:Label>
</asp:Content>
