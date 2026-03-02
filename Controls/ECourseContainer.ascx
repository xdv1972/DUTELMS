<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ECourseContainer.ascx.cs" Inherits="ELMS13.Controls.ECourseContainer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%--<head id="Head1" runat="server">
    <title>Курс</title>
    <style type="text/css">
        html, body
        {
            height: 100%;
        }
        * html
        {
            height: 100%;
        }
    </style>
</head>--%>
<body>
    <%--    <form id="form1" runat="server" style="">--%>

    <asp:ScriptManager ID="mngr1" runat="server" />

    <asp:UpdatePanel ID="upanel" runat="server" UpdateMode="Always" RenderMode="Block">
        <ContentTemplate>
            <%--<div id="divTree" style="float: left; height: 100%; border-right: red thin solid; border-top: red thin solid; border-left: red thin solid; border-bottom: red thin solid;">--%>

            <br />
            <%--            <cc1:CollapsiblePanelExtender ID="cpe" runat="Server" TargetControlID="pnTree" ExpandControlID="btnExpand"
                CollapseControlID="btnExpand" Collapsed="False" TextLabelID="Label1" ExpandedText=""
                CollapsedText="" ImageControlID="btnExpand" ExpandedImage="../App_Themes/default/arrow_left_blue.png"
                CollapsedImage="../App_Themes/default/arrow_right_blue.png" SuppressPostBack="true"
                ExpandDirection="Horizontal">
            </cc1:CollapsiblePanelExtender>--%>

            <div class="CourseTree">
                <h2>Структура курсу</h2>

                <asp:Panel ID="pnTree" runat="server" BorderWidth="0" Height="100%">
                    <asp:Label ID="lblEx" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                    <asp:TreeView ID="trCourse" runat="server" OnInit="TreeView1_Init" OnSelectedNodeChanged="trCourse_SelectedNodeChanged"
                        ShowLines="True">
                    </asp:TreeView>
                    <asp:HiddenField ID="hfPreviousNode" runat="server" Value="Nothing" />
                    <asp:HiddenField ID="hfActivityID" runat="server" Value="Nothing" />
                    <asp:HiddenField ID="hfActivityParentID" runat="server" Value="Nothing" />
                    <asp:HiddenField ID="hfActivityType" runat="server" Value="Nothing" />
                    <asp:HiddenField ID="hfActivityPassScore" runat="server" Value="Nothing" />
                    <asp:HiddenField ID="hfActivityMaxScore" runat="server" Value="Nothing" />
                    <asp:HiddenField ID="hfActivityState" runat="server" Value="Nothing" />
                    <asp:HiddenField ID="hfStartTime" runat="server" Value="Nothing" />
                    <asp:HiddenField ID="hfEndTime" runat="server" Value="Nothing" />
                    <asp:HiddenField ID="hfCourseID" runat="server" Value="Nothing" />
                    <asp:HiddenField ID="hfAssesmentID" runat="server" Value="Nothing" />
                    <asp:HiddenField ID="hfNewWindow" runat="server" Value="Nothing" />
                    <asp:HiddenField ID="hfActivityTitle" runat="server" Value="Nothing" />
                    <%--  <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>--%>
                    <div class="testresult">
                        <span class="button">
                            <%--<asp:Button ID="btnShowProgress" runat="server" Text="Результати тестування" OnClick="btnShowProgress_Click" />--%></span>
                    </div>
                </asp:Panel>
            </div>
            <div class="MAnnou">
                <asp:Panel ID="pnContent" runat="server" Height="100%" Width="100%">
                    <div class="cmenu">
                        <%--                        <asp:Image ID="btnExpand" runat="server" ImageUrl="../App_Themes/default/arrow_right_blue.png"
                            ToolTip="Показать/спрятать дерево курса" />--%>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="cmenulink"><img src="../App_Themes/ut/arrow.png"/>&nbspВ каталог курсів</asp:LinkButton>
                        <asp:LinkButton ID="btnEndActivity" runat="server" OnClick="btnEndActivity_Click" CssClass="cmenulink">Завершить занятие</asp:LinkButton>
                        <asp:LinkButton ID="btnMyPrgrs" runat="server" OnClick="btnMyPrgrs_Click" CssClass="cmenulink">Мiй прогрес</asp:LinkButton>

                    </div>

                    <iframe id="frmContent" name="frmContent" src="BlankPage1.htm" runat="server" height="410px"></iframe>

                </asp:Panel>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="trCourse" />
            <asp:PostBackTrigger ControlID="LinkButton1" />
            <asp:PostBackTrigger ControlID="btnEndActivity" />
            <asp:PostBackTrigger ControlID="btnMyPrgrs" />
        </Triggers>
    </asp:UpdatePanel>
    <%--</form>--%>
</body>
</html>
