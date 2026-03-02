<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true"
    CodeBehind="MyGroupManager.aspx.cs" Inherits="ELMS13.StudentHome.MyGroupManager" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <table>
        <tr>
            <th>
                Група
            </th>
            <th>
                Курси
            </th>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="gv_groups" RowStyle-BorderStyle="None" runat="server" AutoGenerateColumns="False"
                    DataKeyNames="ID" ShowHeader="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="lb_selectGroup" runat="server" Text='<%#Eval("Name") %>' CommandArgument='<%# DataBinder.Eval(Container, "RowIndex") %>'
                                    OnClick="lb_selectGroup_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BorderStyle="None" BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
            <td>
                <asp:GridView ID="gv_courses" runat="server" AutoGenerateColumns="true" ShowHeader="false">
                </asp:GridView>
            </td>
            <td>
                <asp:LinkButton ID="lb_enrollUserInCourse" Text="Подати заявку" runat="server" 
                    onclick="lb_enrollUserInCourse_Click" Visible="false"></asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
    <br />
    <asp:LinkButton  ID="lb_gotoDefault" runat="server" BackColor="#99CCFF" Text="Повенрутись до приватної кімнати" PostBackUrl="~/StudentHome/Default.aspx" ForeColor="Black"></asp:LinkButton>
</asp:Content>
