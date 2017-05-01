<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="NGM.index"%>
<%@ Import Namespace ="System.Data" %>
<%@ Import Namespace ="System.Data.SqlClient" %>
<%@ Import Namespace ="System.Configuration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>NGM - Login </title>
    <meta charset="utf-8"/>
    <link href="styleSheet/styleSheetIndex.css" rel="stylesheet" type="text/css"/>
     <script type="text/javascript">
         function SetTarget() {
             document.forms[0].target = "_blank";
         }
    </script>
</head>
<body>
 <form runat="server">
 <header>
     <div id="headerContainer">
 	    <a><asp:ImageButton class="headerButtons" id="header_helpIcon" src="images/headerIcons/helpIcon.png" ToolTip="Help" runat="server" target="_blank"/></a>
     </div>
 </header>
<div id="loginOverlay">
	<img id="loginLogo" src="images/logos/logo_Small.png" width="287" height="292" alt="Logo"/><br/>
	
    <div id="index_loginForm" > 
        <asp:Panel runat="server" DefaultButton="login_submitButton">
            <img src="images/banners/kioskLoginBanner.png" alt="" width="310" height="50" class="loginBanner"/>  
            <asp:Label ID="InvalidCredLabel" runat="server"></asp:Label><br />
            <img class="roundIcons" id="userIcon" src="images/roundIcons/userIcon.png" alt="userIcon"/>
	        <asp:TextBox class="textBoxes" autocomplete="off" autofocus="true" type="text" name="textfield" id="login_usernameTB" runat="server"/><br/>
	        <img class="roundIcons"  id="passwordIcon" src ="images/roundIcons/passwordIcon.png" alt=""/>
	        <asp:TextBox class="textBoxes" autocomplete="off" type="password" name="textfield2" id="login_passwordTB" runat="server"/><br/>
	        <asp:ImageButton class="formButtons" ID="login_submitButton" type="submit" name="sumbitIcon" src="images/smallButtons/submitIcon.png" runat="server"/>
        </asp:Panel>
    </div>
<footer id="login_footer">
	<p id="companyName">&copy; New Generation Merchandising</p>
</footer>
</div>
</form>
</body>
</html>

