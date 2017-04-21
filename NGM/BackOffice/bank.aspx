<%@ Page Title="Bank" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" Inherits="NGM.bank" Codebehind="bank.aspx.vb" %>

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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT[Deposit_Date] FROM [Deposit]">
    </asp:SqlDataSource>
    
      <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
          SelectCommand="SELECT [Deposit_ID], [Employee_ID], [Deposit_Amount], [Kiosk_ID] FROM [Deposit]" >
      </asp:SqlDataSource>
    
    
      <section>
		<div id="sectionHeader">Bank</div>
          <div id="bank" class="sectionContent">
            <h3>Deposit Date: </h3>
		    <asp:DropDownList ID="calendarDD" runat="server" Width="200px" Height="2em" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Deposit_Date" DataValueField="Deposit_Date">
            </asp:DropDownList>
            

            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Deposit_ID" DataSourceID="SqlDataSource2" CellPadding="4" GridLines="None" ForeColor="#333333" CssClass="detailedView">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" Width="125px" />
                <Fields>
                    <asp:BoundField DataField="Deposit_ID" HeaderText="Deposit_ID" InsertVisible="False" ReadOnly="True" SortExpression="Deposit_ID" />
                    <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID" SortExpression="Employee_ID" />
                    <asp:BoundField DataField="Deposit_Amount" HeaderText="Deposit_Amount" SortExpression="Deposit_Amount" />
                    <asp:BoundField DataField="Kiosk_ID" HeaderText="Kiosk_ID" SortExpression="Kiosk_ID" />
                </Fields>
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
            </asp:DetailsView><br />
              <h3>Bank Info </h3>
            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="Bank_ID" DataSourceID="SqlDataSource2" CellPadding="4" GridLines="None" ForeColor="#333333" CssClass="detailedView">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" Width="125px" />
                <Fields>
                    <asp:BoundField DataField="Bank_ID" HeaderText="Bank ID" InsertVisible="False" ReadOnly="True" SortExpression="Bank_ID" />
                    <asp:BoundField DataField="Bank_Name" HeaderText="Bank Name" ReadOnly="True" SortExpression="Bank_Name" />
                    <asp:BoundField DataField="Bank_Street_Line1" HeaderText="Bank Street Line 1" ReadOnly="True" SortExpression="Bank_Street_Line1" />
                    <asp:BoundField DataField="Bank_Street_Line2" HeaderText="Bank Street Line 2" ReadOnly="True" SortExpression="Bank_Street_Line2" />
                    <asp:BoundField DataField="Bank_City" HeaderText="Bank City" ReadOnly="True" SortExpression="Bank_City" />
                    <asp:BoundField DataField="Bank_State" HeaderText="Bank State" ReadOnly="True" SortExpression="Bank_State" />
                    <asp:BoundField DataField="Bank_Zip_Code" HeaderText="Bank Zip Code" ReadOnly="True" SortExpression="Bank_Zip_Code" />
                </Fields>
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
            </asp:DetailsView><br />
              
        </div>
	</section>
</asp:Content>