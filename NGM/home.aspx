<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="home.aspx.vb" Inherits="NGM.home" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Home</title>
<link href="styleSheet/styleSheetIndex.css" rel="stylesheet" type="text/css"/>
<link href="styleSheet/styleSheetHome.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<form id="form" runat="server">
	<div id="homeOverlay">
		<header>
            <div id="searchBarContainer">
				<asp:TextBox runat="server" id="searchBar"></asp:TextBox>
				<a><asp:ImageButton runat="server" type="image" class="roundIcons" id="searchIcon" src="images/roundIcons/searchIcon.png" alt="searchIcon"/></a>
			</div>
			<div id="headerContainer">
				<a><asp:ImageButton runat="server" ID="shipmentButton"  class="headerButtons" type="image" name="shipmentIcon"  src="images/headerIcons/truckIcon.png"/></a>
				<a><asp:ImageButton runat="server" ID="messageButton"   class="headerButtons" type="image" name="messageIcon"   src="images/headerIcons/mailIcon.png"/></a>
				<a><asp:ImageButton runat="server" ID="clockButton"     class="headerButtons" type="image" name="clockIcon"     src="images/headerIcons/clockIcon.png"/></a>
				<a><asp:ImageButton runat="server" ID="helpButton"      class="headerButtons" type="image" name="helpIcon"      src="images/headerIcons/helpIcon.png"/></a>
			</div>
		</header>
        <asp:MultiView ID="homeMultiView" runat="server">
            <asp:View ID="homeLogoView" runat="server">
                <div id="homeCircle">&nbsp;</div>
            </asp:View>
            <asp:View ID="homeLoginView" runat="server">
                <div id="homeLoginCircle">
                    <div id="homeLoginForm">
                        <img class="roundIcons" id="userIcon" src="images/roundIcons/userIcon.png" alt="userIcon"/>
	                    <asp:TextBox class="textBoxes" autofocus="true" type="text" name="textfield" id="login_usernameTB" runat="server"/><br/>
	                    <img class="roundIcons"  id="passwordIcon" src ="images/roundIcons/passwordIcon.png" alt=""/>
	                    <asp:TextBox class="textBoxes" type="text" name="textfield2" id="login_passwordTB" runat="server"/><br/>
	                    <a><asp:ImageButton class="formButtons" type="image" name="sumbitIcon" id="login_submitButton" src="images/smallButtons/submitIcon.png" runat="server"/></a>
                    </div>
		        </div>

            </asp:View>
         </asp:MultiView>
        <div id="homeNavigation">
			<a><asp:ImageButton ID="posButton"           src="images/largeButtons/home_pos.png"          alt="pos"           class="largeButtons"   runat="server" /></a><br>
	    	<a><asp:ImageButton ID="reportsButton"       src="images/largeButtons/home_reports.png"      alt="reports"       class="largeButtons"   runat="server"/></a><br>
	    	<a><asp:ImageButton ID="backOfficeButton"    src="images/largeButtons/home_backOffice.png"   alt="backOffice"    class="largeButtons"   runat="server"/></a><br>
	    	<a><asp:ImageButton ID="closeButton"         src="images/largeButtons/home_closePos.png"     alt="closePos"      class="largeButtons"   runat="server"/></a><br> 
		</div>
		<footer id="home_footer">
			<p id="hotKeyRef"> 
				Escape - [ESC] &nbsp;|&nbsp; Search - [CTRL - S] &nbsp;|&nbsp; Shipment - [F8] &nbsp;|&nbsp; Email - [F9] &nbsp;|&nbsp; Time Clock - [F10] &nbsp;|&nbsp; Help - [F11]
			</p>
		<p id="companyName">&copy; New Generation Merchandising</p>
		</footer>
	</div>
    </form>
</body>
</html>