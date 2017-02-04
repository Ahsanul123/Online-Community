<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demopage3.aspx.cs" Inherits="demopage3" %>

<script type="text/javascript" language="javascript">

    //Set timeouts for when the warning message
    //should be displayed, and what should happen 
    //when the session actually expires.
    function BodyOnLoad() {
        setTimeout('ShowSessionTimeoutWarning()', '<%=iWarningTimeoutInMilliseconds%>');
            setTimeout('ShowSessionExpiredNotification()', '<%=iSessionTimeoutInMilliseconds%>');
        }

        //Notify the user that his session is ABOUT to expire.
        //Do so by making our warning div tag visible.
        function ShowSessionTimeoutWarning() {
            var divSessionTimeoutWarning =
                document.getElementById('<%=divSessionTimeoutWarning.ClientID%>');

            divSessionTimeoutWarning.style.display = 'inline';
        }

        //Notify the user that his session HAS expired.
        function ShowSessionExpiredNotification() {
            var divSessionTimeoutWarning =
                document.getElementById('<%=divSessionTimeoutWarning.ClientID%>');

            //Send the user to a new page.
            window.location = '<%=sTargetURLForSessionTimeout%>';

            //To tell the user that his session has expired, WITHOUT redirecting, 
            //remove the above line, and uncomment this section:
            ////Re-use the existing label, but change the text.
            //var lblSessionWarning = document.getElementById('<%=lblSessionWarning.ClientID%>');
            //lblSessionWarning.innerText = 'Your session has expired. You are SOL.';
            ////Hide button.
            //var btnContinueWorking = document.getElementById('<%=btnContinueWorking.ClientID%>');
            //btnContinueWorking.style.display = 'none';
        }

    function ResetClientSideSessionTimers() {
        var divSessionTimeoutWarning =
            document.getElementById('<%=divSessionTimeoutWarning.ClientID%>');
            divSessionTimeoutWarning.style.display = 'none';

            //Reset timers so we can warn the user the NEXT time the session is about to expire.
            setTimeout('ShowSessionTimeoutWarning()', '<%=iWarningTimeoutInMilliseconds%>');
            setTimeout('ShowSessionExpiredNotification()', '<%=iSessionTimeoutInMilliseconds%>');
        }
    </script>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server"><h1>asdfasdfasdf</h1>
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>
        <%--In a real application, use a CSSClass and set these 
                 display properties in a CSS file, not inline.--%>
        <div id="divSessionTimeoutWarning" runat="server" 
                  style="position: fixed; left: 250px; top: 100px; 
                         background-color: Yellow; border-style: solid">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lblSessionWarning" runat="server" 
                       Text="Warning.  Your server session is about to expire due to inactivity."
                    ></asp:Label>
                    <br />
                    <asp:Button ID="btnContinueWorking" runat="server" Text="Continue Working" 
                       OnClientClick="ResetClientSideSessionTimers()" 
                       OnClick="btnContinueWorking_Click" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    </form>
</body>
</html>
