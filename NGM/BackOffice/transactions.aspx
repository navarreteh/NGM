<%@ Page Title="" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" Inherits="NGM.transactions" Codebehind="transactions.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <style>
        .sectionContent{
            width:650px;
            height:200px;
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
        #calendar{
            padding-left:200px;
            padding-right:200px;
            padding-top:20px;
        }
        #selectDate{
            padding-left:200px;
            padding-right:200px;
            padding-top:10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0"> 
         <asp:View ID="View1" runat="server">
    <section>
		<div id="sectionHeader">Transactions</div>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
            SelectCommand="">
         </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server"></asp:SqlDataSource>
	    
         <div id="selectDate"><asp:Label ID="Label3" runat="server" Text="Select a date:"></asp:Label></div>
	    
         <div id="calendar">
             <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px">
                 <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                 <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                 <OtherMonthDayStyle ForeColor="#999999" />
                 <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                 <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                 <TodayDayStyle BackColor="#CCCCCC" />
             </asp:Calendar>
         </div>
	    
        
         <asp:Label ID ="Label2" runat="server" visible="false"  style="padding-left:50px;"><h3>Date: </h3></asp:Label>
         <div id="transaction" class="sectionContent" style="overflow:auto; height:200px; width:625px;">
            
             <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
          <div id="content"> 
         <asp:GridView ID="GridView1" runat="server" 
             AutoGenerateColumns="False" DataKeyNames="Transaction_ID" DataSourceID="SqlDataSource1" AllowSorting="True" BackColor="White" 
             BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" Width="650px" Visible="False">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Transaction_ID"  HeaderText="Transaction_ID" InsertVisible="False" ReadOnly="True" SortExpression="Transaction_ID" />
                    <asp:BoundField DataField="Transaction_Date" HeaderText="Transaction_Date" ReadOnly="True" SortExpression="Transaction_Date" />
                    <asp:BoundField DataField="Employee_ID"     HeaderText="Employee_ID" SortExpression="Employee_ID" />
                    <asp:BoundField DataField="Quantity"        HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Payment_Total"   HeaderText="Payment_Total" SortExpression="Payment_Total" />
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
        </div>
         
     </section>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource2">


            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        </asp:View>
        </asp:MultiView>
</asp:Content>

