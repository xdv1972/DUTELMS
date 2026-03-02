<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="ReportUsersOnGroup.aspx.cs" Inherits="ELMS13.AdminHome.Reports.ReportUsersOnGroup" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link rel="stylesheet" href="/Resources/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/Resources/bootstrap/css/bootstrap-theme.min.css">
</head>
<body style="padding:0;margin-left:20px">
    <form id="form1" runat="server" class="form-horizontal">
        <div class="form-group">
            <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
            <asp:DropDownList CssClass="form-control col-sm-4" ID="ddl_groups" runat="server" DataTextField="Code" DataValueField="ID" Width="400px"></asp:DropDownList>
            <asp:Button CssClass="btn btn-default" ID="btn_showReport" runat="server" Text="Вивести слухачів" OnClick="btn_showReport_Click" />
            </div>
        <div class="form-group">
            <br />
            <rsweb:ReportViewer ID="repV_usersOnGroup" runat="server" Width="800px">
                <LocalReport ReportPath="ReportControls\ReportUsersOnGroup.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="sqlDS" Name="ElmsDataSet" />
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>

            <asp:SqlDataSource ID="sqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:ELMS_2013ConnectionString %>" SelectCommand="ReportUsersOnGroup" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_groups" Name="GroupID" PropertyName="SelectedValue" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
