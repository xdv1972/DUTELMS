<%@ Page Language="C#" AutoEventWireup="true" Title="СДН :: Приватна кімната" MasterPageFile="~/MasterPage.Master"
    CodeBehind="Default.aspx.cs" Inherits="ELMS13.StudentHome.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
    <%--    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="elmsSiteMapDS"
        ShowLines="True" ExpandDepth="1">
    </asp:TreeView>
    <asp:SiteMapDataSource ID="elmsSiteMapDS" runat="server" StartFromCurrentNode="true" ShowStartingNode="true" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <!--student role-->
    <div class="role" id="role_student" runat="server">
        <h1>Панель керування</h1>
        <form class="form-horizontal">
            <div class="form-group">
                <div class="btn-group" role="group" aria-label="...">
                    <a href="AvailableGroups.aspx" class="btn btn-default">
                        <span style="text-align: center; display: block" class="glyphicon glyphicon-check"></span>
                        <span style="text-align: center">Доступні групи</span>
                    </a>
                    <a href="MyGroups.aspx" class="btn btn-default">
                        <span class="glyphicon glyphicon-th-list" style="text-align: center; display: block"></span>
                        <span style="text-align: center">Мої групи</span>
                    </a>
                    <a href="InternalMail.aspx" class="btn btn-default">
                        <span class="glyphicon glyphicon-envelope" style="text-align: center; display: block"></span>
                        <span style="text-align: center">Пошта</span>
                    </a>
                </div>
            </div>
        </form>
    </div>
    <!--student role end-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
