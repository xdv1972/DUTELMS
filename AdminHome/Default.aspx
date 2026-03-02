<%@ Page Language="C#" AutoEventWireup="true" Title="СДН :: Адміністрування" MasterPageFile="~/MasterPage.Master"
    CodeBehind="Default.aspx.cs" Inherits="ELMS13.AdminHome.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <!--administrator role-->
    <script>
        function showReport() {
            switch (document.getElementById("sReport").value) {
                case "1": document.getElementById("ifReport").src = "Reports/ReportUsersOnGroup.aspx"; break;
                case "2": document.getElementById("ifReport").src = "Reports/ReportMatrixProgressOnCourse.aspx"; break;
                case "3": document.getElementById("ifReport").src = "Reports/ReportFloatMatrixProgressOnCourse.aspx"; break;
                case "4": document.getElementById("ifReport").src = "Reports/ReportUserIteration.aspx"; break;
                case "5": document.getElementById("ifReport").src = "Reports/ReportUserList.aspx"; break;
                case "6": document.getElementById("ifReport").src = "Reports/ReportUserProgressOnCourseEx.aspx"; break;
                case "7": document.getElementById("ifReport").src = "Reports/ReportProgressMatrixExWithFilters.aspx"; break;
                case "8": document.getElementById("ifReport").src = "Reports/ReportMostDifficultQuestions.aspx"; break;
            }
            
        }
    </script>
    <div class="role" id="role_Admin" runat="server">
        <h1>Панель управління</h1>
        <form class="form-horizontal">
            <div class="form-group">
                <div class="btn-group" role="group" aria-label="...">
                    <a href="UserManager.aspx" class="btn btn-default">
                        <span class="glyphicon glyphicon-user" style="text-align: center; display: block"></span>
                        <span style="text-align: center">Користувачі</span>
                    </a>
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                            <span class="glyphicon glyphicon-edit" style="text-align: center; display: block"></span>
                            <span style="text-align: center">Редагувати</span>
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="CategoryManager.aspx">Категорії</a></li>
                            <li><a href="CourseManager.aspx">Курси</a></li>
                            <li><a href="MyGroups.aspx">Групи</a></li>
                            <li><a href="ControlTestManager.aspx">Тести</a></li>
                        </ul>
                    </div>
                    <a href="AttemptsManager.aspx" class="btn btn-default">
                        <span style="text-align: center; display: block" class="glyphicon glyphicon-list-alt"></span>
                        <span style="text-align: center">Спроби тестування</span>
                    </a>
                    <a href="FeedbackTemplate.aspx" class="btn btn-default">
                        <span class="glyphicon glyphicon-envelope" style="text-align: center; display: block"></span>
                        <span style="text-align: center">Шаблон зворотнього зв’язку</span>
                    </a>
                </div>
            </div>
            <div class="form-group">
                <label for="sReport" class="col-sm-1 control-label">Звіт</label>
                <div class="col-sm-5">
                    <select class="form-control" id="sReport">
                        <option value="1">Слухачі у групі</option>
                        <option value="2">Шахматка виконання контрольних завдань</option>
                        <option value="3">Розширена шахматка виконання контрольних завдань</option>
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
                <iframe style="border:0" id="ifReport" width="100%" height="800px"></iframe>
            </div>
        </form>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
