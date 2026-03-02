<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportFloatMatrixProgressOnCourse.aspx.cs" Inherits="ELMS13.AdminHome.Reports.ReportFloatMatrixProgressOnCourse" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="sm" runat="server">
        </asp:ScriptManager>
        <div>
            <table width="100%" border="0">
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="lbl_groups" runat="server" Text="Оберіть групу:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddl_groups" runat="server" Width="300" AutoPostBack="True" OnSelectedIndexChanged="ddl_groups_SelectedIndexChanged"
                            AppendDataBoundItems="true" DataTextField="Code" DataValueField="ID">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_groups" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddl_groups" ValidationGroup="paramsValidation"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="lbl_courses" runat="server" Text="Оберіть курс:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddl_courses" runat="server" Width="300" AutoPostBack="True"
                            DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_courses" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="ddl_courses" ValidationGroup="paramsValidation"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <br />
            <asp:Button ID="btn_runReport" BorderWidth="1" Width="200" runat="server" Text="Виконати"
                OnClick="btn_runReport_Click" ValidationGroup="paramsValidation" />

            <rsweb:ReportViewer ID="repV_MatrixProgressOnCourse" runat="server" Height="556px" Width="100%">
                <LocalReport ReportPath="ReportControls\ReportFloatMatrixProgressOnCourse.rdlc">
                    <DataSources>
                        <rsweb:ReportDataSource DataSourceId="sqlDS" Name="ElmsDataSet"></rsweb:ReportDataSource>
                    </DataSources>
                </LocalReport>
            </rsweb:ReportViewer>

            <asp:SqlDataSource ID="sqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:ELMS_2013ConnectionString %>"
                SelectCommand="ReportProgressMatrixEx" SelectCommandType="StoredProcedure" OldValuesParameterFormatString="original_{0}">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddl_courses" Name="cid" PropertyName="SelectedValue" Type="Int64" />
                    <asp:ControlParameter ControlID="ddl_groups" Name="group_id" PropertyName="SelectedValue" Type="Int64" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </form>
</body>
</html>
