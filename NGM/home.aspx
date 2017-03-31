<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="home.aspx.vb" Inherits="NGM.home" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Home</title>
<link href="styleSheet/styleSheetLogin.css" rel="stylesheet" type="text/css"/>
<link href="styleSheet/styleSheetHome.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div id="homeOverlay">
		<header>
			<a><input class="headerButtons" type="image" name="helpIcon" id="header_helpIcon" src="images/headerIcons/helpIcon.png"/></a>
		</header>
		<div id="homeLogoLogin">
		<img id="homeLogo" src="images/logos/logo_Big.png" alt="Logo"/><br/>
		</div>
		<div id="homeNavigation">
		
		</div>
		<footer id="home_footer">
			<p id="hotKeyRef"> 
				Escape - [ESC] &nbsp;|&nbsp; Search - [CTRL - S] &nbsp;|&nbsp; Shipment - [F8] &nbsp;|&nbsp; Email - [F9] &nbsp;|&nbsp; Time Clock - [F10] &nbsp;|&nbsp; Help - [F11]
			</p>
		<p id="companyName">&copy; New Generation Merchandising</p>
		</footer>
	</div>
</body>
</html>