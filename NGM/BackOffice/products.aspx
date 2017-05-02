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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="SELECT Products.Product_ID, [Product_Description], [Product_Name], [Product_Price], Products.Category_ID
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
                        <asp:TemplateField HeaderText="Product ID">
                            <ItemTemplate>
                                <asp:Label ID="lblProductID"  runat="server" Text='<%# Eval("Product_ID") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Textbox ID="lblProductID"  runat="server" ReadOnly="true" Text='<%# Eval("Product_ID") %>'></asp:Textbox>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:Label ID="lblProductID" style="color:white;" runat="server" ReadOnly="true" Text='-------------------------------'></asp:Label>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Description">
                            <ItemTemplate>
                                <asp:Label ID="lblProductDescription"  runat="server" Text='<%# Eval("Product_Description") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Textbox ID="txtProductDescription" runat="server" Text='<%# Bind("Product_Description") %>'></asp:Textbox>
                                <asp:CustomValidator ID="valProdDescrLength" runat="server" onservervalidate="checkProdDescrLength" ErrorMessage="50 character max." ControlToValidate="txtProductDescription"></asp:CustomValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:Label ID="txtProductDescription" runat="server" Text='<%# Bind("Product_Description") %>'></asp:Label>
                                <asp:CustomValidator ID="valProdDescrLength" runat="server" onservervalidate="checkProdDescrLength" ErrorMessage="50 character max." ControlToValidate="txtProductDescription"></asp:CustomValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Name">
                            <ItemTemplate>
                                <asp:Label ID="lblProductName"  runat="server" Text='<%# Eval("Product_Name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:Textbox ID="txtProductName" runat="server" Text='<%# Bind("Product_Name") %>'></asp:Textbox>
                                <asp:CustomValidator ID="valProdNameLength" runat="server" onservervalidate="checkProdNameLength" ErrorMessage="20 character max." ControlToValidate="txtProductName"></asp:CustomValidator>
                                <asp:RequiredFieldValidator ID="valProdName" style="color:lightcoral;" runat="server" ErrorMessage="* Required" ControlToValidate="txtProductName"></asp:RequiredFieldValidator>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                <asp:Label ID="txtProductName" runat="server" Text='<%# Bind("Product_Name") %>'></asp:Label>
                                <asp:CustomValidator ID="valProdNameLength" runat="server" onservervalidate="checkProdNameLength" ErrorMessage="20 character max." ControlToValidate="txtProductName"></asp:CustomValidator>
                                <asp:RequiredFieldValidator ID="valProdName" style="color:lightcoral;" runat="server" ErrorMessage="* Required" ControlToValidate="txtProductName"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
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

