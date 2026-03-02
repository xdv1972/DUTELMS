<%@ Page Language="C#" AutoEventWireup="true" Title="СДН :: Головна" MasterPageFile="~/MasterPage.Master"
    CodeBehind="Default.aspx.cs" Inherits="ELMS13.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
    <%--<style>
        body {
            font: 80%/120% Verdana, Arial, Helvetica, sans-serif;
            margin: 0 auto;
            width: 1000px;
        }

        a {
            text-decoration: none;
        }

        div.ot_header {
            background: #e6e6e6 url(../img/bg2px.jpg);
            padding: 26px 0 23px;
        }

            div.ot_header h3 {
                background: #75abc9;
                padding: 25px 28px;
                margin: 0;
                color: #fff;
                font-size: 26px;
                font-weight: normal;
            }

            div.ot_header h3 {
                background: #75abc9;
                padding: 25px 28px;
                margin: 0;
                color: #fff;
                font-size: 26px;
                font-weight: normal;
            }

        div.ot_sidebar {
            float: left;
            width: 340px;
        }

        div.role {
            /*margin-left: 350px;*/
            width: 640px;
        }

            div.role h1 {
                font-size: 22px;
                margin: 0.5em;
            }

        div.ot_content {
            margin-left: 350px;
            width: 640px;
        }

        img.ot_avatar {
            float: left;
            margin: 0 1em 1em 0;
        }

        div.ot_content h1 {
            color: #7a0347;
            font-size: 16px;
            margin: 0.5em;
        }

        div.ot_content p {
            margin: 0.5em 0.5em 1.5em 0.8em;
        }

        div.ot_content ul {
            list-style-position: inside;
        }

        .ot_sidebar ul {
            padding-left: 1em;
            margin: 0.5em 1.5em 1.5em 0.2em;
            vertical-align: baseline;
            color: #007320;
            font-size: 13px;
            font-weight: bold;
            list-style: none;
        }

            .ot_sidebar ul a {
                color: #7a0347;
            }

            .ot_sidebar ul ul {
                color: #2C5C74;
                font-size: 12px;
                font-weight: normal;
                padding: 0.6em 0.1em 0.6em 0;
                margin-left: 0em;
                border-bottom: 1px #7a0347 solid;
            }

                .ot_sidebar ul ul li {
                    padding-bottom: 0.2em;
                }

                .ot_sidebar ul ul a {
                    color: #7a0347;
                }

        .ot_courses {
            background-color: #E6E6E6;
            padding: 0.5em 0.8em 0.5em 0.8em;
        }

            .ot_courses ul {
                padding-left: 1em;
                margin: 0.5em 1.5em 1.5em 0.2em;
                color: #006F19;
                font-size: 12px;
                list-style: none;
            }

                .ot_courses ul ul {
                    color: #2C5C74;
                    font-size: 12px;
                }

                    .ot_courses ul ul li {
                        padding-bottom: 0.2em;
                    }

        div.ot_content h1 {
            color: #7a0347;
            font-size: 14px;
        }

        div.ot_teacher {
            margin-bottom: 18px;
        }

            div.ot_teacher h2 {
                color: #608496;
                font-size: 13px;
                margin: 0.5em;
                font-weight: normal;
            }

            div.ot_teacher h3 {
                color: #608496;
                font-size: 12px;
                margin: 0.5em;
                font-weight: normal;
            }

            div.ot_teacher p {
                font-size: 12px;
                margin-bottom: 6px;
            }
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="width:950px; height:300px">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="/Resources/slide_1.jpg" alt="Slide 1">
                <div class="carousel-caption">
                    <h3>СДН</h3>
                    <p>Система дистанційного навчання</p>
                </div>
            </div>
            <div class="item">
                <img src="/Resources/slide_2.jpg" alt="Slide 2">
                <div class="carousel-caption">
                    <h3>СДН</h3>
                    <p>Система дистанційного навчання</p>
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
        <h1>
        Вітаємо в системі дистанційного навчання</h1>
    <div>
        <p>
            Cистема дистанційного навчання створена для забезпечення процесу дистанційного навчання.
        </p>
        <p>
            Наша система дає можливість засвоювати навчальний матеріал, який подається в інтерактивній
            формі,<br />
            та враховувати індивідуальні особливості кожного слухача. Для викладачів забезпечена
            можливість<br />
            моніторінгу процессу навчання, формування звітних матеріалів та керування процесом
            навчання.
            <br />
            Кожний дистанційний курс складається з модулів, до складу яких можуть входити лекційна
            частина,<br />
            практичні завдання , самопідготовка до проходження тесту, контрольні заходи у вигляді
            тестів
            <br />
            та контрольних завдань.
        </p>
        Приємного Вам навчання!
    </div>
    <%--<asp:Button ID="b1" OnClick="b1_Click" runat="server" Visible="false" />--%>
    <!--saleadministrator role-->
    <div class="role" id="role_SaleAdmin" runat="server">
        <%--        <h1>Адміністратор масового продажу</h1>
        <ul>
            <li><a href="SaleAdminHome/MyGroups.aspx">Редагування навчальних груп</a></li>
        </ul>--%>
    </div>
    <!--saleadministrator role end-->

    <!--administrator role-->
    <div class="role" id="role_Admin" runat="server">
        <%--        <h1>Адміністратор</h1>
        <ul class="main-menu-list">
            <li><a href="AdminHome/CategoryManager.aspx">Редагування категорій</a></li>
            <li><a href="AdminHome/CourseManager.aspx">Редагування курсів</a></li>
            <li><a href="AdminHome/ControlTestManager.aspx">Редагування тестів</a></li>
            <li><a href="AdminHome/MyGroups.aspx">Редагування навчальних груп</a></li>
            <li><a href="AdminHome/UserManager.aspx">Користувачі</a></li>
            <li><a href="AdminHome/Reports/Default.aspx">Звіти</a></li>
            <li><a href="AdminHome/AttemptsManager.aspx">Спроби тестування</a></li>
            <li><a href="AdminHome/FeedbackTemplate.aspx">Шаблон зворотнього зв'язку</a></li>
        </ul>--%>
    </div>
    <!--administrator role end-->

    <!--teacher role-->
    <div class="role" id="role_teacher" runat="server">
        <%--       <h1>Викладач</h1>
        <ul class="main-menu-list">
            <li><a href="TeacherHome/MyGroups.aspx">Групи</a></li>
            <li><a href="TeacherHome/Reports/Default.aspx">Звіти</a></li>--%>
        <%--<li><a href="TeacherHome/MessadgeManager.aspx">Пошта</a></li>--%>
        <%--            <li><a href="TeacherHome/InternalMail.aspx">Внутрішня пошта</a></li>
            <li><a href="TeacherHome/TestManager.aspx">Оцінювання</a></li>
        </ul>--%>
    </div>
    <!--teacher role end-->

    <!--methodist role-->
    <div class="role" id="role_methodist" runat="server">
        <%--        <h1>Методист</h1>
        <ul class="main-menu-list">
            <li><a href="MethodistHome/MyGroups.aspx">Групи</a></li>
            <li><a href="MethodistHome/Reports/Default.aspx">Звіти</a></li>
        </ul>--%>
    </div>
    <!--methodist role end-->

    <!--student role-->
    <div class="role" id="role_student" runat="server">
        <%--        <h1>Студент</h1>
        <ul class="main-menu-list">
            <li><a href="StudentHome/AvailableGroups.aspx">Доступні групи</a></li>
            <li><a href="StudentHome/MyGroups.aspx">Мої групи</a></li>
            <li><a href="StudentHome/InternalMail.aspx">Моя пошта</a></li>
            <li><a href="StudentHome/Reports/ReportMyProgressOnCourseEx.aspx">Мій прогрес</a></li>
        </ul>
        <br />
        <ul>
            <li><a href="StudentHome/ELMS2013_Instruction_Student.docx">Завантажити інструкцію</a></li>
        </ul>--%>
    </div>
    <script>$('.carousel').carousel();</script>
    <!--student role end-->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
