<%@ Page Language="C#" AutoEventWireup="true" Title="СДН :: Приватна кімната :: Мої курси :: Звіт про успішність"
    CodeBehind="MyProgress.aspx.cs" Inherits="ELMS13.StudentHome.MyProgress" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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
</head>
<body class="rview_body">
    <div class="rview_container">
        <form id="form1" runat="server" style="height: 100%; width: 100%;">
        <asp:ScriptManager ID="Scriptmanager1" runat="server">
        </asp:ScriptManager>
        <div class="rviewtotal">
            <table>
                <tr>
                    <td>
                        <asp:LinkButton ID="lbtnBack" runat="server" OnClick="lbtnBack_Click" CssClass="cmenulink"><< Назад до курсу...</asp:LinkButton><br />
                        <asp:Label ID="lbError" runat="server" Text="" Visible="false" ForeColor="red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <rsweb:ReportViewer ID="ReportViewer1" CssClass="repview" runat="server" DocumentMapCollapsed="True"
                            ShowRefreshButton="False">
                            <LocalReport ReportPath="StudentHome\repMyProgressOnCourse.rdlc">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="dsELMS_SelectUserProgressOnCourse" />
                                </DataSources>
                            </LocalReport>
                        </rsweb:ReportViewer>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetData"
                            TypeName="ELMS13.Old_App_Code.DAL.dsELMSTableAdapters.SelectUserProgressOnCourseTableAdapter"
                            OldValuesParameterFormatString="original_{0}">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="CourseID" QueryStringField="CourseId" Type="Int64" />
                                <asp:QueryStringParameter Name="UserID" QueryStringField="UserId" Type="Int64" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </div>
        </form>
    </div>
</body>
</html>
