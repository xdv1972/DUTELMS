<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EContentContainer.ascx.cs" Inherits="ELMS13.Controls.EContentContainer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<body class="cdtotal">
    
    <div>
        <table width="100%" height="100%" border="0">
            <tr>
                <td class="cdmenu">
                    <asp:LinkButton ID="btnEndActivity" runat="server" OnClick="btnEndActivity_Click"
                        CssClass="cmenulink">Завершити заняття</asp:LinkButton>
                </td>
            </tr>
            <tr>
                <td class="cdisplay">
                    <asp:Label ID="lblError" runat="server" ForeColor="Red" Text="Систему стеження не ініціалізовано, результати зафіксировані не будуть!"
                        Visible="False"></asp:Label>
                    <iframe id="frmContent" name="frmContent" frameborder="1" src="BlankPage.htm" width="100%"
                        height="95%" runat="server"></iframe>
                </td>
            </tr>
        </table>
    </div>
    
</body>
</html>
