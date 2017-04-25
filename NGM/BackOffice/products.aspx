<%@ Page Title="" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" Inherits="NGM.products" Codebehind="products.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .sectionContent{
        width:700px;
        height:400px;
        padding-left:50px;
        padding-right:50px;
    }
    h3{
        display:inline-block;
    }
    .detailedView{
        height:50px;
        width: 650px;
    }
     </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="SELECT Products.Product_ID, [Product_Description], [Product_Name], [Product_Price], [Product_Discount], Products.Category_ID
    FROM Products;"></asp:SqlDataSource>
     <section>
		<div id="sectionHeader">Products</div>
         <div id="products" class="sectionContent">
            <h3>Products: </h3>
             <div style="height:425px; width:675px; overflow-y: scroll" runat="server" id="productDetails">
                 <asp:GridView ID="GridView1" runat="server" AllowPaging="False" PageSize="9"
                      AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" 
                      BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Product_ID" 
                      DataSourceID="SqlDataSource1" GridLines="Vertical" AllowSorting="True" Width="650px">
                
                     <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="Product_ID"          HeaderText="Product ID"     InsertVisible="False" ReadOnly="True" SortExpression="Product_ID" />
                        <asp:BoundField DataField="Product_Description" HeaderText="Product_Description"                  ReadOnly="True" SortExpression="Product_Description" />
                        <asp:BoundField DataField="Product_Name"        HeaderText="Product Name"                         ReadOnly="True" SortExpression="Product_Name" />
                        <asp:BoundField DataField="Product_Price"       HeaderText="Product Price"                        ReadOnly="True" SortExpression="Product_Price" />
                        <asp:BoundField DataField="Product_Discount"    HeaderText="Product_Discount"                     ReadOnly="True" SortExpression="Product_Discount" />
                        <asp:BoundField DataField="Category_ID"         HeaderText="Category_ID"                          ReadOnly="True" SortExpression="Category_ID" />
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
                  </asp:GridView><br />
                 </div>
             </div>

     </section>
</asp:Content>

