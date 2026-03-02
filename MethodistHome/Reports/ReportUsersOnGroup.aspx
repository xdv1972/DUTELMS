<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="ReportUsersOnGroup.aspx.cs" Inherits="ELMS13.MethodistHome.Reports.ReportUsersOnGroup" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <p>
                <asp:LinkButton ID="lbtnBack" runat="server" PostBackUrl="~/MethodistHome/Reports/Default.aspx"><< Назад до переліку звітів...</asp:LinkButton>
            </p>
        </div>
        <div>
            <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
            <asp:DropDownList ID="ddl_groups" runat="server" DataTextField="Code" DataValueField="ID" Width="400px"></asp:DropDownList>
            <asp:Button ID="btn_showReport" runat="server" Text="Вивести слухачів" OnClick="btn_showReport_Click" />
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
