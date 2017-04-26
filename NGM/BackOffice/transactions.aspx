<%@ Page Title="" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" Inherits="NGM.transactions" Codebehind="transactions.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <style>
        .sectionContent{
            width:700px;
            height:400px;
            padding-left:50px;
            padding-right:50px;
        }
        #calendarDD{
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
     <section>
		<div id="sectionHeader">Transactions</div>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
            SelectCommand="select t.Transaction_id, FORMAT(transaction_Date,'hh:mm') , Employee_id, quantity, payment_total FROM Transactions as t, employee_assignment as a, transaction_details as td where t.assignment_id = a.assignment_id and t.transaction_id = td.transaction_id"></asp:SqlDataSource>
	    
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
            SelectCommand="select Transaction_Date FROM Transactions"></asp:SqlDataSource> 

         <div id="kiosk" class="sectionContent" style="overflow-y:scroll; height:450px; width:625px;">
            <h3>Date: </h3>
		    <asp:DropDownList ID="dateDD" runat="server" Width="8em" Height="2em" DataSourceID="SqlDataSource2" DataTextField="Transaction_Date" DataValueField="Transaction_Date" dataTextFormatString="{0:MM/dd/yyyy}">
            </asp:DropDownList>
         <asp:GridView ID="GridView1" runat="server" 
             AutoGenerateColumns="False" DataKeyNames="Transaction_id" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" 
             BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="650px">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Transaction_id"  HeaderText="Transaction_id" InsertVisible="False" ReadOnly="True" SortExpression="Transaction_id" />
                    <asp:BoundField DataField="Column1"         HeaderText="Time" ReadOnly="True" SortExpression="Column1" />
                    <asp:BoundField DataField="Employee_id"     HeaderText="Employee_id" SortExpression="Employee_id" />
                    <asp:BoundField DataField="quantity"        HeaderText="quantity" SortExpression="quantity" />
                    <asp:BoundField DataField="payment_total"   HeaderText="payment_total" SortExpression="payment_total" />
                    <asp:CommandField ShowSelectButton="True" />
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

