<%@ Page Title="" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" Inherits="NGM.shipments" Codebehind="shipments.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
         .sectionContent{
            width:620px;
            height:500px;
            padding-left:50px;
            padding-right:50px;

        }.detailedView{
            height:50px;
            width: 600px;
        }
         .roundIcons{
            margin-left:15px;
            top: 20px;
            left: 0px;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <section>
		<div id="sectionHeader">Shipments</div>
         <div class="sectionContent">
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
                 SelectCommand="SELECT S.Shipment_ID,  SU.Supplier_Name, SD.Product_ID, SD.Quantity, S.Shipment_Date, ST.Shipment_Type_Description 
FROM SHIPMENT AS S, SHIPMENT_DETAILS AS SD, SHIPMENT_TYPE AS ST, SUPPLIER AS SU
WHERE S.Shipment_ID = SD.Shipment_ID AND SD.Shipment_Type_ID = ST.Shipment_Type_ID 
AND ST.Shipment_Type_ID = 1 AND S.Supplier_ID = SU.Supplier_ID AND S.Kiosk_ID = 1
ORDER BY S.Shipment_Date ASC"></asp:SqlDataSource>

             <div style="overflow:auto; height:auto; max-height:225px; width:650px; float:left;">
             <h3>InBound</h3>
             <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource1" GridLines="Vertical" Width="650px">
                 <AlternatingRowStyle BackColor="Gainsboro" />
                 <Columns>
                     <asp:CommandField ShowSelectButton="True" />
                     <asp:BoundField DataField="Shipment_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Shipment_ID" />
                     <asp:BoundField DataField="Supplier_Name" HeaderText="Supplier" SortExpression="Supplier_Name" />
                     <asp:BoundField DataField="Product_ID" HeaderText="Product ID" SortExpression="Product_ID" />
                     <asp:BoundField DataField="Quantity" HeaderText="QTY" SortExpression="Quantity" />
                     <asp:BoundField DataField="Shipment_Date" HeaderText="Ship Date" SortExpression="Shipment_Date" />
                     <asp:BoundField DataField="Shipment_Type_Description" HeaderText="TYPE" SortExpression="Shipment_Type_Description" />
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
             <div style="float:left;">
                 Buttons
             </div>
            </div>
             <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
                 SelectCommand="SELECT S.Shipment_ID,  SU.Supplier_Name, SD.Product_ID, SD.Quantity, S.Shipment_Date, ST.Shipment_Type_Description 
FROM SHIPMENT AS S, SHIPMENT_DETAILS AS SD, SHIPMENT_TYPE AS ST, SUPPLIER AS SU
WHERE S.Shipment_ID = SD.Shipment_ID AND SD.Shipment_Type_ID = ST.Shipment_Type_ID 
AND SD.Shipment_Type_ID = 2 AND SD.Shipment_Type_ID = 3 AND S.Supplier_ID = SU.Supplier_ID 
AND S.Kiosk_ID = 1 
ORDER BY S.Shipment_Date ASC"></asp:SqlDataSource>
             <br />
           
             <div style="overflow:auto; height:auto; max-height:225px; width:650px; ">
             <h3>OutBound</h3>
             <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource2" GridLines="Vertical" Width="650px">
                 <AlternatingRowStyle BackColor="#DCDCDC" />
                 <Columns>
                     <asp:CommandField ShowSelectButton="True" />
                     <asp:BoundField DataField="Shipment_ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="Shipment_ID" />
                     <asp:BoundField DataField="Supplier_Name" HeaderText="Supplier" SortExpression="Supplier_Name" />
                     <asp:BoundField DataField="Product_ID" HeaderText="Product ID" SortExpression="Product_ID" />
                     <asp:BoundField DataField="Quantity" HeaderText="QTY" SortExpression="Quantity" />
                     <asp:BoundField DataField="Shipment_Date" HeaderText="Ship Date" SortExpression="Shipment_Date" />
                     <asp:BoundField DataField="Shipment_Type_Description" HeaderText="Type" SortExpression="Shipment_Type_Description" />
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
            </div>
             <div style="float:left;">
                 Buttons
             </div>
         </div>
	</section>
</asp:Content>

