<%@ Page Title="" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" Inherits="NGM.inventory" Codebehind="inventory.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .sectionContent{
            width:700px;
            height:400px;
            padding-left:50px;
            padding-right:50px;
        }
        #kioskDD{
            width:30em;
            height:2em;
        }
        h3{display:inline-block;}
        .detailedView{
            height:50px;
            width: 650px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT Products.Product_ID, Product_Name, Product_Description, Product_Price, Products.Category_ID, Product_QOH FROM (Products INNER JOIN Product_QOH ON Products.Product_ID = Product_QOH.Product_ID)"></asp:SqlDataSource>
     <section>
		<div id="sectionHeader">Inventory</div>
         <div id="bank" class="sectionContent" style="overflow-y:scroll; height:400px; width:625px;">
            <h3>Kiosk ID: </h3>
		    <asp:DropDownList ID="kioskDD" runat="server" Width="8em" Height="2em">
                <asp:ListItem>Test</asp:ListItem>
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server"
                  AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                  BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Product_ID" 
                  DataSourceID="SqlDataSource1" GridLines="Vertical" AllowSorting="True" Width="650px">
                
                 <AlternatingRowStyle BackColor="#DCDCDC" />
                 <Columns>
                     <asp:CommandField ShowSelectButton="True" />
                     <asp:BoundField DataField="Product_ID"             HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Product_ID" />
                     <asp:BoundField DataField="Product_Description"    HeaderText="Description" SortExpression="Product_Description" />
                     <asp:BoundField DataField="Product_Name"           HeaderText="Name" SortExpression="Product_Name" />
                     <asp:BoundField DataField="Product_Price"          HeaderText="Price" SortExpression="Product_Price" />
                     <asp:BoundField DataField="Category_ID"            HeaderText="CAT" SortExpression="Category_ID" />
                     <asp:BoundField DataField="Product_QOH"            HeaderText="QTY" SortExpression="Product_QOH" />
                 </Columns>
                 <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                 <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                 <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                 <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                 <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                 <SortedAscendingCellStyle BackColor="#F1F1F1" />
                 <SortedAscendingHeaderStyle BackColor="#0000A9" />
                 <SortedDescendingCellStyle BackColor="#CAC9C9" />
                 <SortedDescendingHeaderStyle BackColor="#000065" />
             </asp:GridView>
             <br />
            </div>
             <div class="sectionContent" style="margin-top:25px;">
              <asp:DetailsView ID="qtyAdjustView" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                  DataKeyNames="Kiosk_ID,Product_ID" DataSourceID="SqlDataSource2" GridLines="Vertical" Height="50px" Width="125px">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="Product_QOH" HeaderText="QTY" SortExpression="Product_QOH" />
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            </asp:DetailsView>
            </div>
	</section>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT [Product_QOH], [Kiosk_ID], [Product_ID] FROM [Product_QOH]">
    </asp:SqlDataSource>
</asp:Content>

