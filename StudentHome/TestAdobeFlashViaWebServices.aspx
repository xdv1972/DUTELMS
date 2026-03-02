<%@ Page Language="C#" AutoEventWireup="true" Title="EXAMPLE :: Adobe Flash Tracking"
    MasterPageFile="~/MasterPage.Master" CodeBehind="TestAdobeFlashViaWebServices.aspx.cs"
    Inherits="ELMS13.StudentHome.TestAdobeFlashViaWebServices" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <asp:ScriptManager ID="MainScriptManager" runat="server">
        <Scripts>
            <asp:ScriptReference Path="JSTrack.js" />
        </Scripts>
        <Services>
            <asp:ServiceReference Path="wsElmsTrack.asmx" />
        </Services>
    </asp:ScriptManager>
    <div>
        JavaScript Example:
        <br />
        <button id="Button3" onclick="Add('50'); return false;">
            Add</button>
        <asp:Literal ID="Literal2" runat="server" />
    </div>
    <hr />
    <div>
        Result of JavaScript call: <span id="ResultId"></span>
    </div>
    <div>
        <hr />
        Call from IFrame
        <iframe id="frmJSContent" name="frmJSContent" frameborder="1" src="BlankPage2.htm"
            width="100%" height="400" runat="server"></iframe>
        <hr />
        Flash call:<br />
        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0"
            width="550" height="400" id="MyFlash" style="vertical-align: middle;">
            <param name="allowScriptAccess" value="sameDomain" />
            <asp:Literal ID="FlashParams" runat="server" />
            <param name="quality" value="high" />
            <param name="bgcolor" value="#ffffff" />
            <asp:Literal ID="Literal1" runat="server" />
        </object>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
