<%@ Page Title="" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" Inherits="NGM.shipments" Codebehind="shipments.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>

        .sectionContent{
            width:625px;
            height:200px;
            padding-left:50px;
            padding-right:50px;
        }
        .sectionLower{
            width:625px;
            height:150px;
            padding-left:50px;
            padding-right:50px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="SELECT DISTINCT Shipment_Details.Shipment_ID, Supplier.Supplier_ID, Supplier_Name, Shipment_Date, Shipment_Type_Description
    FROM (((Shipment 
    INNER JOIN Shipment_Details ON Shipment.Shipment_ID = Shipment_Details.Shipment_ID) 
    INNER JOIN Supplier ON Shipment.Supplier_ID = Supplier.Supplier_ID)
    INNER JOIN Shipment_Type ON Shipment_Details.Shipment_Type_ID = Shipment_Type.Shipment_Type_ID)
    WHERE Kiosk_ID = 1;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="SELECT Shipment_Details.Product_ID, Products.Product_Name, Shipment_Details.Quantity
    FROM (Shipment_Details 
    INNER JOIN Products ON Shipment_Details.Product_ID = Products.Product_ID)
    WHERE Shipment_Details.Shipment_ID = @Shipment_ID;">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Shipment_ID" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
      <section>
		<div id="sectionHeader">Shipments</div>

          <h3 style="padding-left:50px;">Shipments: </h3>
         <div id="shipment" class="sectionContent" style="overflow:auto;">
              <asp:GridView ID="GridView1" runat="server" AllowPaging="False" PageSize="18"
                  AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                  BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Shipment_ID" 
                  DataSourceID="SqlDataSource1" GridLines="Vertical" AllowSorting="True" Width="650px">
                
                 <AlternatingRowStyle BackColor="#DCDCDC" />
                 <Columns>
                     <asp:CommandField ShowSelectButton="True" />
                     <asp:BoundField DataField="Shipment_ID"            HeaderText="Shipment ID" ReadOnly="true" SortExpression="Shipment_ID" />
                     <asp:BoundField DataField="Supplier_ID"            HeaderText="Supplier ID" SortExpression="Supplier_ID" />
                     <asp:BoundField DataField="Supplier_Name"          HeaderText="Supplier Name" SortExpression="Supplier_Name" />
                     <asp:BoundField DataField="Shipment_Date"          HeaderText="Shipment Date" SortExpression="Shipment_Date" />
                     <asp:BoundField DataField="Shipment_Type_Description" HeaderText="Inbound/Outbound" SortExpression="Shipment_Type_Description" />

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

         <br />
          <h3 style="padding-left:50px;"><asp:Label ID="lblShipmentDetails" runat="server" Text=""></asp:Label><asp:Button ID="btnProcessShipment" style="float:right; margin-right:25px;" runat="server" Text="Process Shipment" visible="false"/></h3>
          <asp:Label ID="lbloutput" runat="server" Text=""></asp:Label>
         <div id="shipment_details" class="sectionLower" style="overflow:auto;">
          <asp:GridView ID="GridView2" runat="server" PageSize="5"
                  AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                  BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                  DataSourceID="SqlDataSource2" GridLines="Vertical" AllowSorting="True" Width="650px" Visible="False">
                
                 <AlternatingRowStyle BackColor="#DCDCDC" />
                 <Columns>   
                     <asp:CommandField ShowSelectButton="True" />                 
                     <asp:BoundField DataField="Product_ID"             HeaderText="Product_ID" SortExpression="Product_ID" />
                     <asp:BoundField DataField="Product_Name"           HeaderText="Product_Name" SortExpression="Product_Name" />
                     <asp:BoundField DataField="Quantity"               HeaderText="Quantity" SortExpression="Quantity" />

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

	</section>
</asp:Content>

