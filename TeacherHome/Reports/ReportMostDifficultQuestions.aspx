<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportMostDifficultQuestions.aspx.cs" Inherits="ELMS13.TeacherHome.Reports.ReportMostDifficultQuestions" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sm" runat="server">
        </asp:ScriptManager>
        <div>
            <asp:Label ID="lbl_courses" runat="server" Text="Оберіть курс:"></asp:Label>
            <asp:DropDownList ID="ddl_courses" runat="server" Width="300"
                DataTextField="Name" DataValueField="ID">
                <asp:ListItem Text="" Value=""></asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
        <asp:Button ID="btn_runReport" BorderWidth="1" Width="200" runat="server" Text="Виконати"
                OnClick="btn_runReport_Click"/>

            <rsweb:ReportViewer ID="repV_dificultQuestions" runat="server" Font-Names="Verdana" Font-Size="8pt"
                Height="768px" Width="1024px">
                <LocalReport ReportPath="ReportControls\ReportMostDificultQuestions.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="sqlDS" Name="ElmsDataSet"></rsweb:ReportDataSource>
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>
            <asp:SqlDataSource ID="sqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:ELMS_2013ConnectionString %>" SelectCommand="ReportMostDificultQuestions" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_courses" Name="cid" PropertyName="SelectedValue" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>
