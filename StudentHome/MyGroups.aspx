<%@ Page Language="C#" AutoEventWireup="true" Title="СДН :: Приватна кімната :: Мої групи"
    MasterPageFile="~/MasterPage.Master" CodeBehind="MyGroups.aspx.cs" Inherits="ELMS13.StudentHome.MyGroups" %>

<%@ Register Src="../Controls/EGroupManager.ascx" TagName="EGroupManager" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
    <link rel="stylesheet" href="../Scripts/jquery-ui-1.10.0.custom.min.css" />
    <script src="../Scripts/jquery-1.9.1.js"></script>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <asp:ScriptManager ID="sm" runat="server" EnablePageMethods="true">
        <Services>
            <asp:ServiceReference Path="../WebServices/AutoComplete.asmx" />
        </Services>
    </asp:ScriptManager>
    <uc1:EGroupManager ID="EGroupManager1" runat="server" VisibleAccess="Student" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>
