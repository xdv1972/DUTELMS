<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ELMS13.TeacherHome.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="server">
    <!--teacher role-->
    <script>
        function showReport() {
            switch (document.getElementById("sReport").value) {
                case "1": document.getElementById("ifReport").src = "Reports/ReportUsersOnGroup.aspx"; break;
                case "2": document.getElementById("ifReport").src = "Reports/ReportMatrixProgressOnCourse.aspx"; break;
                case "4": document.getElementById("ifReport").src = "Reports/ReportUserIteration.aspx"; break;
                case "5": document.getElementById("ifReport").src = "Reports/ReportUserList.aspx"; break;
                case "6": document.getElementById("ifReport").src = "Reports/ReportUserProgressOnCourseEx.aspx"; break;
                case "7": document.getElementById("ifReport").src = "Reports/ReportProgressMatrixExWithFilters.aspx"; break;
                case "8": document.getElementById("ifReport").src = "Reports/ReportMostDifficultQuestions.aspx"; break;
            }

        }
    </script>
    <div class="role" id="role_teacher" runat="server">
        <h1>Панель управління</h1>
        <form class="form-horizontal">
            <div class="form-group">
                <div class="btn-group" role="group" aria-label="...">
                    <a href="MyGroups.aspx" class="btn btn-default">
                        <span class="glyphicon glyphicon-th-list" style="text-align: center; display: block"></span>
                        <span style="text-align: center">Групи</span>
                    </a>
                    <a href="TestManager.aspx" class="btn btn-default">
                        <span style="text-align: center; display: block" class="glyphicon glyphicon-ok"></span>
                        <span style="text-align: center">Оцінювання</span>
                    </a>
                    <a href="InternalMail.aspx" class="btn btn-default">
                        <span class="glyphicon glyphicon-envelope" style="text-align: center; display: block"></span>
                        <span style="text-align: center">Пошта</span>
                    </a>
                </div>
            </div>
        </form>
        <div class="form-group">
            <label for="sReport" class="col-sm-1 control-label">Звіт</label>
            <div class="col-sm-5">
                <select class="form-control" id="sReport">
                    <option value="1">Слухачі у групі</option>
                    <option value="2">Шахматка виконання контрольних завдань</option>
                    <option value="4">Відповіді співробітника на питання тестів</option>
                    <option disabled>--------------</option>
                    <option value="5">Список співробітників</option>
                    <option value="6">Результати тестування співробітника</option>
                    <option value="7">Шахматка виконання контрольних завдань (з фільтрами)</option>
                    <option value="8">Найскладніші запитання для користувачів</option>
                </select>
            </div>
            <button type="button" class="btn btn-default" onclick="showReport()">Показати</button>
        </div>
        <div class="form-group">
            <iframe style="border: 0" id="ifReport" width="100%" height="800px"></iframe>
        </div>
    </div>
    <!--teacher role end-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="server">
</asp:Content>
