<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pos.aspx.vb" Inherits="NGM.pos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8"/>
<title>Point of Sale</title>
<link href="styleSheet/styleSheetIndex.css" rel="stylesheet" type="text/css"/>
<link href="styleSheet/styleSheetPos.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div id="posOverlay">
		<header>
			<div id="searchBarContainer">
				<input type="search" id="searchBar"/>
				<a><input type="image" class="roundIcons" id="searchIcon" src="images/roundIcons/searchIcon.png" width="50" height="50" alt="searchIcon"/></a>
			</div>
			<div id="headerContainer">
				<a><input class="headerButtons" type="image" name="editIcon" id="pos_editIcon" src="images/headerIcons/overrideIcon.png"/></a>
				<a><input class="headerButtons" type="image" name="voidIcon" id="pos_voidIcon" src="images/headerIcons/voidIcon.png"/></a>
				<a><input class="headerButtons" type="image" name="helpIcon" id="poshelpIcon" src="images/headerIcons/helpIcon.png"/></a>
			</div>
		</header>
		<div id="posScreenContainer">
    		<div id="posScreen">
	    		<img src="images/banners/purchases.png" class="posBanners" alt="purchaseBanner"/>
			</div> 
	    </div>
		<div id="posAside">
			<div id="posLoginBanner">
			</div>
			<div id="posTotals">
		    	<img src="images/banners/totals.png" width="300" height="auto" alt=""/> 
		    </div>
		</div>
		<footer id="posFooter">
			<p id="hotKeyRef"> 
				Escape - [ESC] &nbsp;|&nbsp; Search - [CTRL - S] &nbsp;|&nbsp; Shipment - [F8] &nbsp;|&nbsp; Email - [F9] &nbsp;|&nbsp; Time Clock - [F10] &nbsp;|&nbsp; Help - [F11]
			</p>
		<p id="companyName">&copy; New Generation Merchandising</p>
		</footer>
	</div>
</body>
</html>