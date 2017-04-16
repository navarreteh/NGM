<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="onlineorders.aspx.vb" Inherits="NGM.onlineorders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Online Orders</title>
<link href="styleSheet/styleSheetHelp.css" 	rel="stylesheet" type="text/css"/>
<link href="styleSheet/styleSheetIndex.css" 	rel="stylesheet" type="text/css"/>
</head>
<body id="manualOverlay">
    <form runat="server">
	<header>
		<div id="headerButtons" class="headerContainer">
			<a><asp:ImageButton runat="server" class="headerButtons" type="image" name="editIcon"   id="homeIcon" 		src="images/headerIcons/homeIcon.png"/></a>
			<a><asp:ImageButton runat="server"  class="headerButtons" type="image" name="printIcon" id="printIcon" 	    src="images/headerIcons/printIcon.png"/></a>
			<a><asp:ImageButton runat="server"  class="headerButtons" type="image" name="helpIcon"  id="poshelpIcon" 	src="images/headerIcons/helpIcon.png"/></a>
		</div>
		<h1 class="headerContainer">Online Orders</h1>
	</header>
	<div id="manualContainer">
        This is a page reserved for an optional future online webstore development.
	</div>
	<footer id="manualFooter">
		<p id="hotKeyRef"> 
				Escape - [ESC] &nbsp;|&nbsp; Home - [CTRL-H] &nbsp;|&nbsp; Print - [CTRL-P] &nbsp;|&nbsp; Help - [F11]
			</p>
		<p id="companyName">&copy; New Generation Merchandising</p>
	</footer>
        </form>
</body>
</html>