<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="home.aspx.vb" Inherits="NGM.home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8"/>
<title>Home</title>
<link href="styleSheet/styleSheetIndex.css" rel="stylesheet" type="text/css"/>
<link href="styleSheet/styleSheetHome.css" rel="stylesheet" type="text/css"/>
    <script>
        function SetTarget() {
            document.forms[0].target = "_blank";
        }
    </script>
</head>
<body onload ="alertOpenKiosk()">
	<form id="form" runat="server">
	<div id="homeOverlay">
		<header>
            <div id="searchBarContainer">
                <asp:Panel runat="server" DefaultButton="searchIcon">
				    <asp:TextBox runat="server" id="searchBar" ToolTip="Search Inventories" type="search" AutoPostBack="true" Placeholder="Search" ></asp:TextBox>
				    <a><asp:ImageButton runat="server" type="image" class="roundIcons" ID="searchIcon" src="images/roundIcons/searchIcon.png" ToolTip="Search" alt="searchIcon"/></a>
                    <div id="searchResults" runat="server"></div>
                </asp:Panel>
			</div>
			<div id="headerContainer">
				<a><asp:ImageButton runat="server" ID="messageButton"   class="headerButtons" ToolTip="Message of the Day"  type="image" name="messageIcon"   src="images/headerIcons/mailIcon.png" /></a>
				<a><asp:ImageButton runat="server" ID="clockButton"     class="headerButtons" ToolTip="TimeClock"           type="image" name="clockIcon"     src="images/headerIcons/clockIcon.png"/></a>
                <a><asp:ImageButton runat="server" ID="onlineButton"    class="headerButtons" ToolTip="Web Orders"          type="image" name="internetIcon"  src="images/headerIcons/internetIcon.png"/></a>
				<a><asp:ImageButton runat="server" ID="helpButton"      class="headerButtons" ToolTip="Help"                type="image" name="helpIcon"      src="images/headerIcons/helpIcon.png" OnClientClick ="SetTarget();"/></a>
			</div>
		</header>
        <asp:MultiView ID="homeMultiView" runat="server">
            <asp:View ID="homeLogoView" runat="server">
                <div id="homeCircle">&nbsp;</div>
            </asp:View>
            <asp:View ID="homeLoginView" runat="server">
                <div id="homeLoginCircle">
                    <div id="homeLoginForm">
                    <asp:Panel runat="server" DefaultButton="login_submitButton">
                        <asp:Label ID="InvalidCredLabel" Style="color:#FFFFFF;" runat="server"></asp:Label><br />
                        <img class="roundIcons" id="userIcon" src="images/roundIcons/userIcon.png" alt="userIcon"/>
	                    <asp:TextBox class="textBoxes" autocomplete="off" autofocus="true" type="text" name="textfield" id="login_usernameTB" runat="server"/><br/>
	                    <img class="roundIcons"  id="passwordIcon" src ="images/roundIcons/passwordIcon.png" alt=""/>
	                    <asp:TextBox class="textBoxes" autocomplete="off" type="password" name="textfield2" id="login_passwordTB" runat="server"/><br/>
	                    <a><asp:ImageButton class="formButtons" type="image" name="sumbitIcon" ToolTip="Submit" id="login_submitButton" src="images/smallButtons/submitIcon.png" runat="server"/></a>
                    </asp:Panel>
                    </div>
		        </div>

            </asp:View>
            <asp:View ID="closePosView" runat="server">
                <div id="closePosContainer">
                    <asp:Panel runat="server" DefaultButton="submitClose">
                        <div id="closePosForm">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="SELECT [Bank_ID] FROM [Bank]"></asp:SqlDataSource>
                            <h3>End of day closing</h3>
                            <p class="formLabel">Bank ID:        </p><asp:DropDownList ID="BankDD" runat="server" Width="145px" DataSourceID="SqlDataSource1" DataTextField="Bank_ID" DataValueField="Bank_ID"></asp:DropDownList>
                            <p class="formLabel">Kiosk ID:       </p><asp:TextBox ID="closeKioksID" runat="server" ReadOnly="true"></asp:TextBox><br />
                            <p class="formLabel">Employee:       </p><asp:TextBox ID="closeEmpUser" runat="server" ReadOnly="true"></asp:TextBox><br />
                            <p class="formLabel">Date:           </p><asp:TextBox ID="closeDate" runat="server" ReadOnly="true"></asp:TextBox><br />
                            <p class="formLabel">Deposit Amount: </p><asp:TextBox ID="closeDepAmt" runat="server"></asp:TextBox><br />
                            <asp:ImageButton ID="submitClose" runat="server" class="formButtons" name="sumbitIcon" src="images/smallButtons/submitIcon.png"/>
                            <asp:ImageButton ID="cancelClose" runat="server" class="formButtons" name="sumbitIcon" src="images/smallButtons/cancelIcon.png" CausesValidation="false" />
                        </div>
                        
                    </asp:Panel>
		        </div>
            </asp:View>
         </asp:MultiView>
        <div id="homeNavigation">
			<a><asp:ImageButton ID="posButton"           src="images/largeButtons/home_pos.png"          alt="pos"           class="largeButtons"   runat="server" ToolTip="Point of Sale"/></a><br/>
	    	<a><asp:ImageButton ID="reportsButton"       src="images/largeButtons/home_reports.png"      alt="reports"       class="largeButtons"   runat="server" ToolTip="Reports"/></a><br/>
	    	<a><asp:ImageButton ID="backOfficeButton"    src="images/largeButtons/home_backOffice.png"   alt="backOffice"    class="largeButtons"   runat="server" ToolTip="BackOffice"/></a><br/>
	    	<a><asp:ImageButton ID="closeButton"         src="images/largeButtons/home_closePos.png"     alt="closePos"      class="largeButtons"   runat="server" ToolTip="Close Point of Sale"/></a><br/> 
		</div>
        <footer id="homefooter">
            <p id="companyName" style="margin-left:800px">&copy; New Generation Merchandising</p>
	    </footer>
	</div>
    </form>
</body>
</html>