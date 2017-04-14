<%@ Page Title="Bank" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" CodeFile="bank.aspx.vb" Inherits="bank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .sectionContent{
        width:700px;
        height:400px;
        padding-left:50px;
        padding-right:50px;
    }
    #calendarDD{
        width:8em;
        height:2em;
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [OrderID], [CustomerID], [EmployeeID], [OrderDate], [ShipPostalCode] FROM [Orders]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" SelectCommand="SELECT [SupplierID], [CompanyName], [Address], [City], [PostalCode], [Phone] FROM [Suppliers]"></asp:SqlDataSource>
      <section>
		<div id="sectionHeader">Bank</div>
          <div id="bank" class="sectionContent">
            <h3>Deposit on: </h3>
		    <asp:DropDownList id="calendarDD" runat="server" Width="8em" Height="2em">
                <asp:ListItem>TEST</asp:ListItem>
                <asp:ListItem>TEST2</asp:ListItem>
                <asp:ListItem>TEST2</asp:ListItem>
            </asp:DropDownList>
              <img class="roundIcons" id="calendarIcon" src="../images/roundIcons/calendarIcon.png" width="50" height="50" alt="calendarIcon"/>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="OrderID" DataSourceID="SqlDataSource1" CellPadding="4" GridLines="None" ForeColor="#333333" CssClass="detailedView">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" Width="125px" />
                <Fields>
                    <asp:BoundField DataField="OrderID" HeaderText="Deposit ID" InsertVisible="False" ReadOnly="True" SortExpression="OrderID" />
                    <asp:BoundField DataField="CustomerID" HeaderText="Bank ID" SortExpression="CustomerID" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="Kiosk ID" SortExpression="EmployeeID" />
                    <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" SortExpression="EmployeeID" />
                    <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                    <asp:BoundField DataField="ShipPostalCode" HeaderText="Amount" SortExpression="ShipPostalCode" />
                </Fields>
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
            </asp:DetailsView><br />
              <h3>Bank Info </h3>
              <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="SupplierID" DataSourceID="SqlDataSource2" CellPadding="4" GridLines="None" ForeColor="#333333" CssClass="detailedView">
                  <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" Width="125px" />
                  <Fields>
                      <asp:BoundField DataField="SupplierID" HeaderText="Bank ID" InsertVisible="False" ReadOnly="True" SortExpression="SupplierID" />
                      <asp:BoundField DataField="CompanyName" HeaderText="Name" SortExpression="CompanyName" />
                      <asp:BoundField DataField="Address" HeaderText="Street Line 1" SortExpression="Address" />
                      <asp:BoundField DataField="Address" HeaderText="Street Line 2" SortExpression="Address" />
                      <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                      <asp:BoundField DataField="Phone" HeaderText="State" SortExpression="Phone" />
                      <asp:BoundField DataField="PostalCode" HeaderText="Zipcode" SortExpression="PostalCode" />
                  </Fields>
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
              </asp:DetailsView>
        </div>
	</section>
</asp:Content>
