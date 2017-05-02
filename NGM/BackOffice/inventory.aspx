<%@ Page Title="" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" Inherits="NGM.inventory" Codebehind="inventory.aspx.vb" %>
<%@ MasterType virtualpath="backoffice.Master" %>

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
        .output{
            color:white;
        }
    </style>
    <script>

         function CallPrint() {
            var printContent = document.getElementById('<%= printView.ClientID %>');

             var date= new Date;
             var monthS = date.getMonth;
             var dateS = date.getDate;
             var yearS = date.getFullYear;
             var kioskID = '1';
             var date = monthS + "/" + dateS + "/" + yearS;
             var printWindow = window.open("All Records", 
             "Print Panel", 'left=50000,top=50000,width=0,height=0');
             printWindow.document.write("<h3>Inventory Report</h3><p>Kiosk ID: " + kioskID + " </p><p>" + date + "</p>")
             printWindow.document.write(printContent.innerHTML);
             printWindow.document.close();
             printWindow.focus();
             printWindow.print();
        
     }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" >
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT Products.Product_ID, Product_Name, Product_Description, Product_Price, Products.Category_ID, Product_QOH FROM (Products INNER JOIN Product_QOH ON Products.Product_ID = Product_QOH.Product_ID)">
    </asp:SqlDataSource>
     <section>
		<div id="sectionHeader">Inventory</div>
         <div id="bank" class="sectionContent" style="overflow-y:scroll; height:400px; width:625px;">
        <asp:Panel runat="server" ID="printView">
            <br />
            <asp:GridView ID="GridView1" runat="server"
                  AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                  BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Product_ID" 
                  DataSourceID="SqlDataSource1" GridLines="Vertical" AllowSorting="True" Width="650px">
                
                 <AlternatingRowStyle BackColor="#DCDCDC" />
                 <Columns>
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
            </asp:Panel>
            </div>
            <div class="sectionContent" style="margin-top:25px;">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
                    SelectCommand="SELECT [Product_QOH], [Kiosk_ID], [Product_ID] FROM [Product_QOH] WHERE [Kiosk_ID] = @Kiosk_ID AND [Product_ID] = @Product_ID"
                    UpdateCommand="UPDATE [Product_QOH] SET [Product_QOH] = @Product_QOH WHERE [Kiosk_ID] = @Kiosk_ID AND [Product_ID] = @Product_ID">
                 
                    <SelectParameters>
                        <asp:CookieParameter CookieName="Kiosk_ID" Name="Kiosk_ID" Type="Int32" />
                        <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="Product_ID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Product_QOH" Type="Int32" />
                        <asp:Parameter Name="Kiosk_ID" Type="Int32" />
                        <asp:Parameter Name="Product_ID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>

                <asp:DetailsView ID="qtyAdjustView" runat="server" AutoGenerateRows="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Kiosk_ID,Product_ID" DataSourceID="SqlDataSource2" GridLines="Vertical" Height="50px" Width="200px">
                    <AlternatingRowStyle BackColor="Gainsboro" />
                    <EditRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <Fields>
                    <asp:TemplateField HeaderText="Product Quantity">
                        <ItemTemplate>
                            <asp:Label ID="lblProductQOH"  runat="server" Text='<%# Eval("Product_QOH") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtProductQOH"  runat="server" AutoComplete="off" Text='<%# Bind("Product_QOH") %>'></asp:Textbox>
                            <asp:RegularExpressionValidator ID="regexProductQOH" class="output" runat="server" ErrorMessage="Invalid Value." ControlToValidate="txtProductQOH" ValidationExpression="(0|-?[1-9][0-9]*)"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                </asp:DetailsView>
                <br />
                <asp:Label ID="lblout" class="output" runat="server" Text=""></asp:Label>
            </div>
	</section>
</asp:Content>

