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
    <form runat="server">
	<div id="posOverlay">
		<header>
            <div id="addBarContainer">
			<input type="search" id="addBar"/>
				<a><input type="image" class="roundIcons" id="addIcon" src="images/roundIcons/addIcon.png" width="50" height="50" alt="addIcon"/></a>
			</div>
			<div id="searchBarContainer">
				<input type="search" id="searchBar"/>
				<a><input type="image" class="roundIcons" id="searchIcon" src="images/roundIcons/searchIcon.png" width="50" height="50" alt="searchIcon"/></a>
			</div>
			<div id="headerContainer">
				<a><asp:ImageButton runat="server" class="headerButtons" type="image" name="editIcon" id="pos_editIcon" src="images/headerIcons/overrideIcon.png"/></a>
				<a><asp:ImageButton runat="server" class="headerButtons" type="image" name="voidIcon" id="pos_voidIcon" src="images/headerIcons/voidIcon.png"/></a>
				<a><asp:ImageButton runat="server" class="headerButtons" type="image" name="helpIcon" id="poshelpIcon" src="images/headerIcons/helpIcon.png"/></a>
			</div>
		</header>
		<div id="posScreenContainer">
            <asp:MultiView ID="posMultiView" runat="server">
                <asp:View ID="purchaseView" runat="server">
    		    <div id="purchaseScreen">
	    		     <asp:ImageButton runat="server"  src="images/banners/purchases.jpg" class="posBanners" id="purchaseBannerPurchase"	alt="purchaseBanner"/>
	    		     <asp:ImageButton runat="server"  src="images/banners/returns.jpg" 	class="posBanners" id="returnBannerPurchase"	alt="returnBanner"/>
	    		     <asp:ImageButton runat="server"  src="images/banners/payments.jpg" 	class="posBanners" id="paymentBannerPurchase"	alt="paymentanner"/>
			    </div> 
                </asp:View>
                <asp:View ID="returnView" runat="server">
                <div id="returnScreen">
	    		     <asp:ImageButton runat="server"  src="images/banners/purchases.jpg" class="posBanners" id="purchaseBannerReturn"	alt="purchaseBanner"/>
	    		     <asp:ImageButton runat="server"  src="images/banners/returns.jpg" 	class="posBanners" id="returnBannerReturn"	    alt="returnBanner"/>
	    		     <asp:ImageButton runat="server"  src="images/banners/payments.jpg" 	class="posBanners" id="paymentBannerReturn" 	alt="paymentanner"/>
			    </div> 
                </asp:View>
                <asp:View ID="paymentView" runat="server">
                <div id="paymentScreen">
	    		     <asp:ImageButton runat="server"  src="images/banners/purchases.jpg" class="posBanners" id="purchaseBannerPayment"	alt="purchaseBanner"/>
	    		     <asp:ImageButton runat="server"  src="images/banners/returns.jpg" 	class="posBanners" id="returnBannerPayment"	    alt="returnBanner"/>
	    		     <asp:ImageButton runat="server"  src="images/banners/payments.jpg" 	class="posBanners" id="paymentBannerPayment"	alt="paymentanner"/>

                     <div id="paymentMethodContainer">
					    <img src="images/largeButtons/pos_cash.png" class="paymentButtons" alt="cashButton"/><br/>
					    <img src="images/largeButtons/pos_card.png" class="paymentButtons" alt="cardButton"/><br/>
					    <img src="images/largeButtons/manual.png" 	class="paymentButtons" alt="manualButton"/> 
   			         </div>
			    </div> 
                </asp:View>
            </asp:MultiView>
	    </div>
			<div id="posAside">
			<div id="posLoginBanner">
			</div>
			<div id="posTotals">
		    	<img src="images/banners/totals.png" width="300" alt="totals banner"/>
		    	<div id="totalsView">
				</div>
		    </div>
		    <asp:ImageButton runat="server" src="images/largeButtons/pos_checkout.png" width="325" id="checkoutButton" alt="checkout button"/> 
		</div>
		<footer id="posFooter">
			<p id="hotKeyRef"> 
				Escape - [ESC] &nbsp;|&nbsp; Add Items - [F1] &nbsp;|&nbsp; Search - [CTRL-S] &nbsp;|&nbsp; Edits - [CTRL-F8] &nbsp;|&nbsp; Void Transaction - [CTRL-F12] &nbsp;|&nbsp; Help - [F11]
			</p>
		<p id="companyName">&copy; New Generation Merchandising</p>
		</footer>
	</div>
    </form>
</body>
</html>