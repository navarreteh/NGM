<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="NGM.index" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>NGM - Login </title>
    <meta charset="utf-8"/>
    <link href="styleSheet/styleSheetLogin.css" rel="stylesheet" type="text/css"/>
</head>
<body>
 <header>
 	<input type="image" class="headerButtons" id="header_helpIcon" src="images/headerIcons/helpIcon.png"/>
 </header>
<div id="loginOverlay">
	<img id="loginLogo" src="images/logos/logo_Small.png" width="287" height="292" alt="Logo"/><br/>
	
<form id="login_form" runat="server">
  <img src="images/banners/kioskLoginBanner.png" alt="" width="310" height="50" class="loginBanner"/>    
    <img class="roundIcons" id="userIcon" src="images/roundIcons/userIcon.png" alt="userIcon"/>
	<asp:TextBox class="textBoxes" autofocus="true" type="text" name="textfield" id="login_usernameTB" runat="server"/><br/>
	<img class="roundIcons"  id="passwordIcon" src ="images/roundIcons/passwordIcon.png" alt=""/>
	<asp:TextBox class="textBoxes" type="text" name="textfield2" id="login_passwordTB" runat="server"/><br/>
	<asp:ImageButton class="formButtons" type="image" name="sumbitIcon" id="login_submitButton" src="images/smallButtons/submitIcon.png" runat="server"/>
</form>
<footer>
	<p id="companyName">&copy; New Generation Merchandising</p>
</footer>
</div>

</body>
</html>
