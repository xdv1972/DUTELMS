<%@ Page Language="C#" AutoEventWireup="true" Title="СДН :: Про систему" MasterPageFile="~/MasterPage.Master"
    CodeBehind="About.aspx.cs" Inherits="ELMS13.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphSide1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMainContent" runat="Server">
    <a name="notRegisteredUser"></a>
    <h3>
        Якщо Ви не зареєстровані в системі</h3>
    1. Натисніть на посилання <b>Реєстрація</b>.
    <br />
    <asp:Image ID="Image1" runat="server" CssClass="imBorder" AlternateText="ЦПО ПАТ &quot;Укртелеком&quot;"
        ImageUrl="~/Resources/AboutImages/001.gif" />
    <br />
    2. Заповніть анкету на сторінці <b>Реєстрація</b>.<br />
    Оберіть в полі <b>Група</b> номер своєї групи, який вам повідомили попередньо. <b>Ім'я
        входу (логін)</b> та <b>пароль</b> визначте самостійно, ці дані будуть використовуватися
    для входу в систему в майбутньому.
    <br />
    3. Натисніть кнопку <b>Зареєструвати</b>.
    <br />
    <asp:Image ID="Image2" runat="server" CssClass="imBorder" AlternateText="ЦПО ПАТ &quot;Укртелеком&quot;"
        ImageUrl="~/Resources/AboutImages/002.gif" />
    <br />
    4. Натисніть кнопку <b>Продовжити</b>.
    <br />
    <asp:Image ID="Image3" runat="server" CssClass="imBorder" AlternateText="ЦПО ПАТ &quot;Укртелеком&quot;"
        ImageUrl="~/Resources/AboutImages/003.gif" />
    <br />
    5. В списку курсів знайдіть курс з номером Вашої групи.
    <br />
    6. Натисніть посилання <b>Обрати цей курс</b> (при першому вході на курс) або <b>Відкрити
        курс</b> (в процесі навчання) праворуч від назви курсу.
    <br />
    <asp:Image ID="Image4" runat="server" CssClass="imBorder" AlternateText="ЦПО ПАТ &quot;Укртелеком&quot;"
        ImageUrl="~/Resources/AboutImages/004.gif" />
    <br />
    7. Для перегляду змісту курсу натисніть на посилання <b>Відкрити курс</b>.
    <br />
    <asp:Image ID="Image5" runat="server" CssClass="imBorder" AlternateText="ЦПО ПАТ &quot;Укртелеком&quot;"
        ImageUrl="~/Resources/AboutImages/005.gif" />
    <br />
    8. Для перегляду матеріалу курсу натисніть на необхідне посилання в змісті. Результати
    навчання можна переглянути за допомогою кнопки <b>Результати тестування</b>.
    <br />
    <asp:Image ID="Image9" runat="server" CssClass="imBorder" AlternateText="ЦПО ПАТ &quot;Укртелеком&quot;"
        ImageUrl="~/Resources/AboutImages/006.gif" />
    <br />
    <a name="registeredUser"></a>
    <h3>
        Якщо Ви зареєстровані в системі</h3>
    1. Натисніть на посилання <b>Вхід</b>.
    <br />
    <asp:Image ID="Image6" runat="server" CssClass="imBorder" AlternateText="ЦПО ПАТ &quot;Укртелеком&quot;"
        ImageUrl="~/Resources/AboutImages/007.gif" />
    <br />
    2. Вкажіть ім'я входу (логін) та пароль, які були вказані при реєстрації. Натисніть
    кнопку <b>Вхід</b>
    <br />
    <asp:Image ID="Image7" runat="server" CssClass="imBorder" AlternateText="ЦПО ПАТ &quot;Укртелеком&quot;"
        ImageUrl="~/Resources/AboutImages/008.gif" />
    <br />
    3. Натисніть посилання <b>[Приватна кімната]</b>.
    <br />
    4. Натисніть посилання <b>Мої курси</b>. В переліку курсів оберіть курс відповідно
    до номеру Вашої групи.<br />
    <asp:Image ID="Image8" runat="server" CssClass="imBorder" AlternateText="ЦПО ПАТ &quot;Укртелеком&quot;"
        ImageUrl="~/Resources/AboutImages/009.gif" />
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphSide2" runat="Server">
</asp:Content>
