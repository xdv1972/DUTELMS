<%@ Page Language="C#" Title="СДН :: Звіти" MasterPageFile="~/MasterPage.Master"
    AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ELMS13.TeacherHome.Reports.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <h1>
        Звіти</h1>
    <ul class="link-list-vertical">
        <li><a href="ReportUsersOnGroup.aspx" title="Слухачі на курсі">Слухачі у групі</a></li>
        <li><a href="ReportMatrixProgressOnCourse.aspx" title="Шахматка виконання контрольних завдань">Шахматка виконання контрольних завдань</a></li>
        <li><a href="ReportUserIteration.aspx" title="Відповіді співробітника на питання тестів">Відповіді співробітника на питання тестів</a></li> 
        <li><br /></li>
        <li><a href="ReportUserList.aspx" title="Список співробітників">Список співробітників</a></li>
        <li><a href="ReportUserProgressOnCourseEx.aspx" title="Результати тестування співробітника">Результати тестування співробітника</a></li>
        <li><a href="ReportProgressMatrixExWithFilters.aspx" title="Шахматка виконання контрольних завдань (з фільтрами)">
            Шахматка виконання контрольних завдань (з фільтрами)</a></li>

        <li><a href="ReportMostDificultQuestions.aspx" title="Найскладніші запитання для користувачів">
            Найскладніші запитання для користувачів</a></li>
              
    </ul>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
