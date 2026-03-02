<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportUserList.aspx.cs" Inherits="ELMS13.AdminHome.Reports.ReportUserList" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <style type="text/css">
        html, body {
            height: 100%;
        }

        * html {
            height: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sm" runat="server">
        </asp:ScriptManager>
        <div>
            <rsweb:ReportViewer ID="repViewer" runat="server" DocumentMapCollapsed="True"
                Font-Names="Verdana" Font-Size="8pt" Height="768px" Width="1024px">
                <LocalReport ReportPath="ReportControls\ReportUserList.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="sqlDS" Name="ElmsDataSet" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:SqlDataSource ID="sqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:ELMS_2013ConnectionString %>" SelectCommand="ReportUserList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
