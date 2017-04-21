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
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Product_ID" DataSourceID="SqlDataSource1" CellPadding="4" GridLines="None" ForeColor="#333333" CssClass="detailedView">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" Width="125px" />
                <Fields>
                    <asp:BoundField DataField="Product_ID" HeaderText="Product ID" InsertVisible="False" ReadOnly="True" SortExpression="Product_ID" />
                    <asp:BoundField DataField="Product_Description" HeaderText="Product_Description" ReadOnly="True" SortExpression="Product_Description" />
                    <asp:BoundField DataField="Product_Name" HeaderText="Product Name" ReadOnly="True" SortExpression="Product_Name" />
                    <asp:BoundField DataField="Product_Price" HeaderText="Product Price" ReadOnly="True" SortExpression="Product_Price" />
                    <asp:BoundField DataField="Product_Discount" HeaderText="Product_Discount" ReadOnly="True" SortExpression="Product_Discount" />
                    <asp:BoundField DataField="Category_ID" HeaderText="Category_ID" ReadOnly="True" SortExpression="Category_ID" />
                </Fields>
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
            </asp:DetailsView><br />
             </div>

     </section>
</asp:Content>

