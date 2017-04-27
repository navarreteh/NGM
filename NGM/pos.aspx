<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="pos.aspx.vb" Inherits="NGM.pos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8"/>
<title>Point of Sale</title>
<link href="styleSheet/styleSheetIndex.css" rel="stylesheet" type="text/css"/>
<link href="styleSheet/styleSheetPos.css" rel="stylesheet" type="text/css"/>
<script type = "text/javascript">
     function SetTarget() {
         document.forms[0].target = "_blank";
     }
</script>
</head>
<body>
    <form runat="server">
	<div id="posOverlay">
		<header>
            <div id="addBarContainer">
			<asp:TextBox type="search" id="addBar" runat="server"/>
				<a><asp:ImageButton runat="server" class="roundIcons" id="addIcon" src="images/roundIcons/addIcon.png" width="50" height="50" alt="addIcon"/></a>
			</div>
			<div id="searchBarContainer">
				<input type="search" id="searchBar"/>
				<a><input type="image" class="roundIcons" id="searchIcon" src="images/roundIcons/searchIcon.png" width="50" height="50" alt="searchIcon"/></a>
			</div>
			<div id="headerContainer">
				<a><asp:ImageButton runat="server" class="headerButtons" type="image" name="editIcon" id="pos_editIcon" src="images/headerIcons/overrideIcon.png"/></a>
				<a><asp:ImageButton runat="server" class="headerButtons" type="image" name="voidIcon" id="pos_voidIcon" src="images/headerIcons/voidIcon.png"/></a>
				<a><asp:ImageButton runat="server" class="headerButtons" type="image" name="helpIcon" id="poshelpIcon" src="images/headerIcons/helpIcon.png" OnClientClick = "SetTarget();"/></a>
			</div>
		</header>
		<div id="posScreenContainer">
            <asp:MultiView ID="posMultiView" runat="server">
                <asp:View ID="purchaseView" runat="server">
    		    <div id="purchaseScreen">
	    		     <asp:ImageButton runat="server"  src="images/banners/purchases.jpg" class="posBanners" id="purchaseBannerPurchase"	alt="purchaseBanner"/>
                   <!--The Category DropdownList, populated on pageload if not on autopostback -->
                    <br /> Select Category: <asp:DropDownList ID="CategoriesDD" runat="server" Width="200px" Height="2em" AutoPostBack="True" OnSelectedIndexChanged="CategoriesDD_SelectedIndexChanged"></asp:DropDownList>
                   <!--The Product DropdownList, not initially visible but made visible and populated on selectedindexchanged of Category -->
                    <br /> Select Products: <asp:DropDownList ID="ProductsDD" runat="server" Width="200px" Height="2em" AutoPostBack="True" OnSelectedIndexChanged="ProductsDD_SelectedIndexChanged"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="SELECT * FROM Products">
                    </asp:SqlDataSource>

                    <asp:DetailsView ID="ProductDetails" runat="server" AutoGenerateRows="True" DataKeyNames="Product_ID" DataSourceID="SqlDataSource1"></asp:DetailsView>
                    <asp:Label runat="server" Text="Quantity on Hand: ">

                    </asp:Label>


                    <table>
                        <tr>
                            <td>554456</td>
                            <td>Iphone</td>
                            <td>64GB</td>
                            <td>RED EDITION</td>
                            <td>$699.99</td>
                        </tr>
                    </table>
	    		     <asp:ImageButton runat="server"  src="images/banners/returns.jpg" 	class="posBanners" id="returnBannerPurchase"	alt="returnBanner"/>
	    		     <asp:ImageButton runat="server"  src="images/banners/payments.jpg" 	class="posBanners" id="paymentBannerPurchase"	alt="paymentanner"/>
			    </div> 
                </asp:View>
                <asp:View ID="returnView" runat="server">
                <div id="returnScreen">
	    		     <asp:ImageButton runat="server"  src="images/banners/purchases.jpg" class="posBanners" id="purchaseBannerReturn"	alt="purchaseBanner"/>
	    		     <asp:ImageButton runat="server"  src="images/banners/returns.jpg" 	class="posBanners" id="returnBannerReturn"	    alt="returnBanner"/>
                    <!-- -->
	    		    
                    
                     <asp:ImageButton runat="server"  src="images/banners/payments.jpg" 	class="posBanners" id="paymentBannerReturn" 	alt="paymentanner"/>
			    </div> 
                </asp:View>
                <asp:View ID="paymentView" runat="server">
                <div id="paymentScreen">
	    		     <asp:ImageButton runat="server"  src="images/banners/purchases.jpg" class="posBanners" id="purchaseBannerPayment"	alt="purchaseBanner"/>
	    		     <asp:ImageButton runat="server"  src="images/banners/returns.jpg" 	class="posBanners" id="returnBannerPayment"	    alt="returnBanner"/>
	    		     <asp:ImageButton runat="server"  src="images/banners/payments.jpg" 	class="posBanners" id="paymentBannerPayment"	alt="paymentanner"/>
                    <!-- -->


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
			<p id="hotKeyRef"></p>
		<p id="companyName" style="margin-left:800px">&copy; New Generation Merchandising</p>
		</footer>
	</div>
    </form>
</body>
</html>