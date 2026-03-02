<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportMyProgressOnCourseEx.aspx.cs"
    Inherits="ELMS13.StudentHome.Reports.ReportMyProgressOnCourseEx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <a href="../Default.aspx">Повернутися до приватної кімнати</a>
        		&nbsp; 		&nbsp; 		&nbsp; 		&nbsp; 
        <a runat="server" id="link" href="../Default.aspx">Повернутися до курсу</a><br />
        <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>
        <div>
            <table width="100%" border="0">
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="lbl_groups" runat="server" Text="Оберіть групу:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddl_groups" runat="server" Width="300" AutoPostBack="True"
                            OnSelectedIndexChanged="ddl_groups_SelectedIndexChanged"
                            DataTextField="Code" DataValueField="ID">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        <asp:Label ID="lbl_courses" runat="server" Text="Оберіть курс:"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddl_courses" runat="server" Width="300" AutoPostBack="True"
                            DataTextField="Name" DataValueField="ID" AppendDataBoundItems="true" OnSelectedIndexChanged="ddl_courses_SelectedIndexChanged">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfv_courses" runat="server" ErrorMessage="*" ForeColor="Red"
                            ControlToValidate="ddl_courses" ValidationGroup="paramsValidation"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
            <br />
            <%--            <asp:Button ID="btn_runReport" BorderWidth="1" Width="200" runat="server" Text="Виконати"
                OnClick="btn_runReport_Click" ValidationGroup="paramsValidation"/>--%>
            <cc1:TabContainer runat="server" ActiveTabIndex="0">

                <cc1:TabPanel HeaderText="Прогрес слухача" runat="server">
                    <ContentTemplate>
                        <rsweb:ReportViewer ID="repV_userIteration1" runat="server" Font-Names="Verdana" Font-Size="8pt"
                            Height="768px" Width="1024px">
                            <LocalReport ReportPath="ReportControls\ReportMyProgressOnCourse.rdlc">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="sqlDS1" Name="ElmsDataSet"></rsweb:ReportDataSource>
                                </DataSources>
                            </LocalReport>
                        </rsweb:ReportViewer>
                        <asp:SqlDataSource ID="sqlDS1" runat="server" ConnectionString="<%$ ConnectionStrings:ELMS_2013ConnectionString %>" SelectCommand="ReportUserProgressOnCourse" SelectCommandType="StoredProcedure">

                        </asp:SqlDataSource>
                    </ContentTemplate>
                </cc1:TabPanel>
                <cc1:TabPanel HeaderText="Результати тестування" runat="server">
                    <ContentTemplate>
                        <rsweb:ReportViewer ID="repV_userIteration" runat="server" Font-Names="Verdana" Font-Size="8pt"
                            Height="768px" Width="1024px">
                            <LocalReport ReportPath="ReportControls\ReportUserProgressOnCourseEx.rdlc">
                                <DataSources>
                                    <rsweb:ReportDataSource DataSourceId="sqlDS" Name="ElmsDataSet"></rsweb:ReportDataSource>
                                </DataSources>
                            </LocalReport>
                        </rsweb:ReportViewer>
                        <asp:SqlDataSource ID="sqlDS" runat="server" ConnectionString="<%$ ConnectionStrings:ELMS_2013ConnectionString %>" SelectCommand="ReportUserProgressOnCourseEx" SelectCommandType="StoredProcedure">

                        </asp:SqlDataSource>
                    </ContentTemplate>
                </cc1:TabPanel>
            </cc1:TabContainer>




        </div>
    </form>
</body>
</html>
