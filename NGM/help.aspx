<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="help.aspx.vb" Inherits="NGM.help" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>help</title>
<link href="styleSheet/styleSheetHelp.css" 	rel="stylesheet" type="text/css"/>
<link href="styleSheet/styleSheetIndex.css" 	rel="stylesheet" type="text/css"/>
</head>
<body id="manualOverlay">
    <form runat="server">
	<header>
		<div id="headerButtons" class="headerContainer">
			<a><asp:ImageButton runat="server"  class="headerButtons" type="image" name="printIcon" id="printIcon" 	    src="images/headerIcons/printIcon.png"/></a>
		</div>
		<h1 class="headerContainer">Help: Manual</h1>
	</header>
	<div id="manualContainer">
        <div id="manualMenu">
            menu
		</div>
		<div id="displays">
            displays
		</div>
	</div>
	<footer id="manualFooter">
		<p id="hotKeyRef"> 
				Escape - [ESC] &nbsp;|&nbsp; Home - [CTRL-H] &nbsp;|&nbsp; Print - [CTRL-P]
			</p>
		<p id="companyName">&copy; New Generation Merchandising</p>
	</footer>
    </form>
</body>
</html>