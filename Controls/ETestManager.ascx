<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ETestManager.ascx.cs" Inherits="ELMS13.Controls.ETestManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        html, body, form {
            height: 100%;
        }

        * html {
            height: 100%;
        }
    </style>


    <script language="javascript" type="text/javascript">
        var warn_on_unload = "You have unsaved changes!"
        function warnOnUnload() {
            warn_on_unload = "";
        }

        window.onbeforeunload = function () {

            if (warn_on_unload != '') {
                var hf_pid = document.getElementById("hf_pid").value;
                ELMS13.WebServices.UpdateProgress.OnUnload(hf_pid);
                return warn_on_unload;
            }

        }


        setInterval(TimerTick, 1000);
        function TimerTick() {

            if (document.getElementById("lblTimer").innerHTML != "") {
                if (document.getElementById("lblTimer").innerHTML <= 0) {

                    var btn = document.getElementById("btnNext");
                    console.log(btn);
                    //if (btn) btn.click();
                    document.getElementById("btnNext").click();
                }
                else
                    document.getElementById("lblTimer").innerHTML -= 1;
            }

        }
        function btnClik() {
            if (window.document.forms["form1"].elements["btnNext"]) {
                window.document.forms["form1"].elements["btnNext"].click(); //нажать на кнопку.
            }
            else if (window.document.forms["form1"].elements["btnSendResults"]) {
                window.document.forms["form1"].elements["btnSendResults"].click(); //нажать на кнопку.
            }
        }
    </script>
</head>
<body class="testbody">
    <%--<form id="form1" runat="server">--%>
    &nbsp;<table align="center" class="testcont" id="form1">
        <tr valign="top">
            <td class="testext">
                <asp:ScriptManager ID="sm" runat="server" EnablePageMethods="true">
                    <Services >
                        <asp:ServiceReference Path="/WebServices/UpdateProgress.asmx" />
                    </Services>
                        </asp:ScriptManager>

                <asp:HiddenField runat="server" ID="hf_pid" ClientIDMode="Static" />

                <asp:Panel ID="Panel1" runat="server" BorderWidth="0">
                    <p>
                        Тестове питання включає питання та одну або декілька (дві і більше) вірних відповідей,
                        а також невірні відповіді.
                    </p>
                    <p>
                        Якщо в питанні декілька (дві і більше) вірних відповідей, потрібно вказати всі вірні
                        відповіді, інакше відповідь на тестове питання буде визнана невірною.
                    </p>
                    <p runat="server" id="lblQestionDurationDesc">
                        На виконання тесту дається обмежена кількість часу – <strong>
                            <asp:Label ID="lblQestionDuration" runat="server"></asp:Label>
                            секунд </strong>на виконання одного питання. Інформація про кількість часу,
                        що залишилась, постійно знаходитися зліва вгорі екрану.
                    </p>
                    <p>
                        Для успішного проходження тесту необхідно набрати не менше <strong>
                            <asp:Label ID="lblPassScore" runat="server"></asp:Label>
                            балів </strong>(це процент правильних відповідей).
                    </p>
                    <p>
                        Кнопка “Далі” використовується для переходу до наступного питання. Якщо ви не обрали
                        жодного варіанту відповіді, то при натисненні цієї кнопки відповідь буде визнана
                        невірною.
                    </p>
                    <p>
                        Для початку тествування натисніть кнопку “Розпочати тестування”.
                    </p>
                    <%-- <p style="color:Red;">Увага! У вас є одна спроба пройти тест. Будьте уважні!</p>--%>
                    <p>
                        <asp:Button ID="btnBeginTest" runat="server" Text="Розпочати тестування" OnClick="btnBeginTest_Click" OnClientClick="warnOnUnload()" />
                        <asp:Button ID="btnGoBack" runat="server" Text="Повернутися до курсу" OnClick="btnGoBack_Click" />
                    </p>
                    <p>
                        <asp:Label ID="lblAttemptsState" runat="server" Font-Bold="true" ForeColor="Red" />
                    </p>
                    <p>
                        <asp:Label ID="lblDateState" runat="server" Font-Bold="true" ForeColor="Red"></asp:Label>
                    </p>
                </asp:Panel>
                <asp:Timer Enabled="false" ID="tmTimer" runat="server" OnTick="tmTimer_OnTick" Interval="1000">
                </asp:Timer>

                <asp:UpdatePanel Visible="false" ID="upTimer" runat="server">
                    <ContentTemplate>
                        Залишилось:
                        <asp:Label ID="lblTimer" ClientIDMode="Static" runat="server"></asp:Label>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="tmTimer" EventName="Tick" />
                    </Triggers>
                </asp:UpdatePanel>
                <%--                <asp:UpdatePanel ID="Panel2" runat="server" BorderWidth="0" Visible="false">
                    <ContentTemplate>
                    Залишилось: <span id="MyTimer"></span>
                        </ContentTemplate>
                </asp:UpdatePanel>--%>
               <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Panel ID="pnQuestion" runat="server" BorderWidth="0" Visible="false">

                            <%--<input type="text" name="disp2" size="7" readonly style="border-style:solid; border-width:1pt; background-color: #CBCBCB;">--%>
                            <hr />
                            <asp:Label ID="lblQuestionNumber" runat="server" Visible="false"></asp:Label>
                            <hr />
                            <p>
                                <asp:Label ID="lbl_Current_question" runat="server"></asp:Label>
                            </p>
                            <asp:CheckBoxList ID="cbl_answers" runat="server" Visible="false"></asp:CheckBoxList>
                            <asp:RadioButtonList ID="rbl_answers" Visible="false" runat="server"></asp:RadioButtonList>
                            <asp:MultiView ID="mwQ" runat="server">
                            </asp:MultiView>
                            <table width="100%">
                                <tr>
                                    <td align="left">
                                        <asp:Button ID="btnNext" ClientIDMode="Static" Visible="false" UseSubmitBehavior="true" runat="server" Text="Далі" OnClick="Button3_Click" />
                                        <asp:Button ID="btnSendResults" runat="server" OnClick="btnSendResults_Click" Text="Відправити"
                                            Visible="false" OnClientClick="warnOnUnload()" />

                                    </td>
                                    <td align="right">
                                        <asp:Button ID="btnCancelTest" Visible="false" runat="server" Text="Перервати" OnClick="btnCancel_Click" />&nbsp;
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                     </ContentTemplate>
                   <Triggers>
                        <asp:PostBackTrigger ControlID="btnSendResults" />
                    </Triggers>
                </asp:UpdatePanel>

            </td>
        </tr>
        <tr>
            <td class="testbuttons">
                <%--                <table width="100%">
                    <tr>
                        <td align="left">
                            <asp:Button ID="btnNext" ClientIDMode="Static" Visible="false" runat="server" Text="Далі" OnClick="Button3_Click" />
                            <asp:Button ID="btnSendResults" runat="server" OnClick="btnSendResults_Click" Text="Відправити"
                                Visible="false" />

                        </td>
                        <td align="right">
                            <asp:Button ID="btnCancelTest" Visible="false" runat="server" Text="Перервати" OnClick="btnCancel_Click" />&nbsp;
                        </td>
                    </tr>
                </table>--%>
            </td>
        </tr>
    </table>
    <%--</form>--%>
</body>
</html>
