<%@ Page Language="C#" AutoEventWireup="true" Title="СДН :: Приватна кімната :: Мій профайл"
    MasterPageFile="~/MasterPage.Master" CodeBehind="MyProfile.aspx.cs" Inherits="ELMS13.StudentHome.MyProfile" %>

<%@ Register Src="../Controls/EUserRegister.ascx" TagName="EUserRegister" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="elmsSiteMapDS" ShowLines="True">
    </asp:TreeView>
    <asp:SiteMapDataSource ID="elmsSiteMapDS" runat="server" StartingNodeOffset="1" StartFromCurrentNode="false"
        ShowStartingNode="true" />
    </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <asp:ScriptManager ID="sm" runat="server">
    </asp:ScriptManager>
    <h2>
        Miй профайл</h2>
    <p>
        <uc1:EUserRegister ID="userRegister" runat="server" ViewRegisterMode="EditUser" />
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
