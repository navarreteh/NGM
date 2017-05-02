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
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="SELECT * FROM [Products]"></asp:SqlDataSource>
            <div id="addBarContainer">
			<asp:TextBox type="search" id="addBar" runat="server" Placeholder="Add Items" />
				<a><asp:ImageButton runat="server" type="image" class="roundIcons" id="addIcon" src="images/roundIcons/addIcon.png" alt="addIcon"/></a>
			</div>
			<div id="searchBarContainer">
				<asp:Panel runat="server" DefaultButton="searchIcon">
				    <asp:TextBox runat="server" id="searchBar" ToolTip="Search Inventories" type="search" AutoPostBack="true" Placeholder="Search" ></asp:TextBox>
				    <a><asp:ImageButton runat="server" type="image" class="roundIcons" ID="searchIcon" src="images/roundIcons/searchIcon.png" ToolTip="Search" alt="searchIcon"/></a>
                    <div id="searchResults" runat="server"></div>
                </asp:Panel>
			</div>
			<div id="headerContainer">
				<a><asp:ImageButton runat="server" class="headerButtons" type="image" name="editIcon" id="pos_editIcon" src="images/headerIcons/overrideIcon.png"   ToolTip="Edit Transaction"/></a>
				<a><asp:ImageButton runat="server" class="headerButtons" type="image" name="voidIcon" id="pos_voidIcon" src="images/headerIcons/voidIcon.png"       ToolTip="Void Transaction"/></a>
				<a><asp:ImageButton runat="server" class="headerButtons" type="image" name="helpIcon" id="poshelpIcon"  src="images/headerIcons/helpIcon.png"       ToolTip="Help" OnClientClick = "SetTarget();"/></a>
			</div>
		</header>
		<div id="posScreenContainer">
            <asp:MultiView ID="posMultiView" runat="server">
                <asp:View ID="purchaseView" runat="server">
    		    <div id="purchaseScreen">
	    		   <asp:ImageButton runat="server"  src="images/banners/purchases.jpg" class="posBanners" id="purchaseBannerPurchase"	alt="purchaseBanner"/>
                   <div id="purchaseCart">
                       <asp:ListBox ID="purchaseList" runat="server" CssClass="purchaseList" Rows="20" Height="450px" Width="650" style="overflow:auto;"></asp:ListBox>
                       <asp:ListBox ID="purchasePriceLB" runat="server"></asp:ListBox>
                       <asp:Button ID="DeleteButton" runat="server" Text="Delete" style="float:right;" />
                   </div>
                        

	    		     <asp:ImageButton runat="server"  src="images/banners/returns.jpg" 	class="posBanners" id="returnBannerPurchase"	alt="returnBanner"/>
	    		     <asp:ImageButton runat="server"  src="images/banners/payments.jpg" 	class="posBanners" id="paymentBannerPurchase"	alt="paymentanner"/>
			    </div> 
                </asp:View>
                <asp:View ID="returnView" runat="server">
                <div id="returnScreen">
	    		     <asp:ImageButton runat="server"  src="images/banners/purchases.jpg" class="posBanners" id="purchaseBannerReturn"	alt="purchaseBanner"/>
	    		     <asp:ImageButton runat="server"  src="images/banners/returns.jpg" 	class="posBanners" id="returnBannerReturn"	    alt="returnBanner"/>
                     <div id="returnCart">
                        <asp:ListBox ID="returnList" runat="server" CssClass="purchaseList" Rows="20" Height="450px" Width="650" style="overflow:auto; margin-top:45px;"></asp:ListBox>
                        <asp:ListBox ID="returnPriceLB" runat="server"></asp:ListBox>
                         <asp:Button ID="DeleteRButton" runat="server" Text="Delete" style="float:right;" />
	    		    </div>
                    
                     <asp:ImageButton runat="server"  src="images/banners/payments.jpg" 	class="posBanners" id="paymentBannerReturn" 	alt="paymentanner"/>
			    </div> 
                </asp:View>
                <asp:View ID="paymentView" runat="server">
                <div id="paymentScreen">
	    		     <asp:ImageButton runat="server"  src="images/banners/purchases.jpg"    class="posBanners" id="purchaseBannerPayment"	alt="purchaseBanner"/>
	    		     <asp:ImageButton runat="server"  src="images/banners/returns.jpg" 	    class="posBanners" id="returnBannerPayment"	    alt="returnBanner"/>
                     <asp:ImageButton runat="server"  src="images/banners/payments.jpg"     class="posBanners" id="paymentBannerPayment"	    alt="paymentBanner"/>

                    

                     <div id="paymentMethodContainer">
					    <asp:ImageButton runat="server"  src="images/largeButtons/pos_cash.png" ID="cashButton" class="paymentButtons" alt="cashButton" /><br/>
					    <asp:ImageButton runat="server"  src="images/largeButtons/pos_card.png" ID="cardButton" class="paymentButtons" alt="cardButton"/><br/>
   			         </div>
			         
			         <div id="paymentInputContainer" runat="server">
                         <asp:TextBox ID="paymentTB" Width="150" style="height: 2em;" runat="server"></asp:TextBox><br />
                         <asp:ImageButton ID="submit" runat="server" class="formButtons" name="sumbitIcon" src="images/smallButtons/submitIcon.png"/>
			         </div>
			         
			    </div> 
                </asp:View>
            </asp:MultiView>
	    </div>
			<div id="posAside">
			<div id="posLoginBanner">
			     <div id="clockContainer">
                    <h2>
                        <asp:Literal runat="server" id="employeeDisplay" ></asp:Literal>
                        <br/>
                        <asp:Literal runat="server" id="dateDisplay" ></asp:Literal>
                        <br/>
                        <asp:Literal runat="server" id="timeDisplay" ></asp:Literal>
                    </h2>
                 </div>
			</div>
			<div id="posTotals">
		    	<img src="images/banners/totals.png" width="300" alt="totals banner"/>
		    	<div id="totalsView">
                    <p class="totalText">Purchases:</p> <p class="totalValue"><asp:Literal ID="purchaseTotal"   runat="server" Text="$0.00"></asp:Literal></p><br />
                    <p class="totalText">Returns:</p>   <p class="totalValue" id="returnTB"     runat="server"><asp:Literal ID="returnTotal"     runat="server" Text="$0.00"></asp:Literal></p><br />
                    <p class="totalText">SubTotal</p>   <p class="totalValue" id="subTotalTB"   runat="server"><asp:Literal  ID="subTotal"        runat="server" Text="$0.00"></asp:Literal></p><br />
                    <p class="totalText">Tax:</p>       <p class="totalValue" id="taxTB"        runat="server"><asp:Literal ID="tax"             runat="server" Text="$0.00"></asp:Literal></p><br />
                    <p class="totalText">Total:</p>     <p class="totalValue" id="totalTB"      runat="server"><asp:Literal ID="total"           runat="server" Text="$0.00"></asp:Literal></p>
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