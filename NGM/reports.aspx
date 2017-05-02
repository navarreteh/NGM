<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="reports.aspx.vb" Inherits="NGM.reports" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports</title>
    <link href="styleSheet/styleSheetIndex.css" rel="stylesheet" type="text/css"/>
    <link href="styleSheet/styleSheetReports.css" rel="stylesheet" type="text/css"/>
    <script type = "text/javascript">
         function SetTarget() {
         document.forms[0].target = "_blank";
     }
</script>
</head>
<body>
<form runat="server">
	<div id="reportsOverlay">
	<header>
		<%--<div id="calendarDDContainer" class="headerContainer">
		    <img class="roundIcons" id="calenderIcon" src="images/roundIcons/calendarIcon.png" width="50" height="50" alt="calendarIcon"/>
            <asp:DropDownList ID="calenderStartDD" runat="server"  class="calendarDD">
            </asp:DropDownList>
            <asp:DropDownList ID="calenderEndDD" runat="server"  class="calendarDD">
            </asp:DropDownList>
		</div>--%>
		
		<div id="headerButtons" class="headerContainer" style="float:right;">
			<a><asp:ImageButton runat="server" class="headerButtons" type="image" name="homeIcon" id="homeIcon" src="images/headerIcons/homeIcon.png"       ToolTip="Home"  /></a>
			<a><asp:ImageButton runat="server" class="headerButtons" type="image" name="printIcon" id="printIcon" src="images/headerIcons/printIcon.png"    ToolTip="Print" /></a>
			<a><asp:ImageButton runat="server" class="headerButtons" type="image" name="helpIcon" id="poshelpIcon" src="images/headerIcons/helpIcon.png"    ToolTip="Help" OnClientClick = "SetTarget();"/></a>
		</div>
	</header>
	<div id="reportsContainer">
        <asp:MultiView ID="reportsMultiView" runat="server">
            <asp:View ID="summaryView" runat="server">
		        <div id="hourlyReportsContatiner" class="reportsSection">
			        <img src="images/banners/reports_hourly.jpg" width="330" height="40" alt="hourlyTopper"/>

                    <p class="reportsDescription">Net Sales:</p>
				        <p class="reportNumbers"><asp:Literal ID="netSalesHourlyTB" runat="server" ></asp:Literal></p>
			        <p class="reportsDescription">Average Sales:</p>
				        <p class="reportNumbers"><asp:Literal ID="avgHourlyTB" runat="server" ></asp:Literal></p>
			        <p class="reportsDescription">Unit Per Transaction:</p>
				        <p class="reportNumbers"><asp:Literal ID="unitsPerHourlyTB" runat="server" ></asp:Literal></p>
			        <p class="reportsDescription">Number of Transaction:</p>
				        <p class="reportNumbers"><asp:Literal ID="numTransHourlyTB" runat="server" ></asp:Literal></p>

	            </div>
		        <div id="dailyReportsContainer" class="reportsSection">
			        <img src="images/banners/reports_daily.jpg" width="330" height="40" alt="dailyTopper"/>
                    <p class="reportsDescription">Net Sales:</p>
				        <p class="reportNumbers"><asp:Literal ID="netSalesDailyTB" runat="server" ></asp:Literal></p>
			        <p class="reportsDescription">Average Sales:</p>
				        <p class="reportNumbers"><asp:Literal ID="avgDailyTB" runat="server"></asp:Literal></p>
			        <p class="reportsDescription">Unit Per Transaction:</p>
				        <p class="reportNumbers"><asp:Literal ID="unitsPerDailyTB" runat="server"></asp:Literal></p>
			        <p class="reportsDescription">Number of Transaction:</p>
				        <p class="reportNumbers"><asp:Literal ID="numTransDailyTB" runat="server"></asp:Literal></p>
		        </div>
            </asp:View>
            <asp:View ID="detailedView" runat="server">
		        <div id="detailedContainer">
			        <img src="images/banners/reports_detailed.jpg" width="680" height="40" alt="detailedTopper"/>
                 
                    <asp:DetailsView ID="DetailedReport" runat="server" Height="50px" Width="125px"></asp:DetailsView>

	            </div>
            </asp:View>
        </asp:MultiView>
		<div id="asideContainer" class="reportsSection">
            <div id="reportsLogo">
                <div id="clockContainer">
                    <h2>
                        <asp:Literal runat="server" id="timeDisplay" ></asp:Literal>
                  
                        <br/>
                        <asp:Literal runat="server" id="dateDisplay" ></asp:Literal>
                    </h2>
                 </div>
            </div>
			<asp:ImageButton runat="server" src="images/largeButtons/reports_detailed.png" id="detailedButton" width="300" alt="detailedButton"/>
		</div>
	</div>
	<footer id="reportsFooter">
		<p id="hotKeyRef"></p>
		<p id="companyName" style="margin-left:800px">&copy; New Generation Merchandising</p>
	</footer>
	</div>
</form>
</body>
</html>