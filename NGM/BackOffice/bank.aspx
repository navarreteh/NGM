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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="SELECT [Deposit_ID], [Bank_ID], [Kiosk_ID], [Employee_ID], [Deposit_Date], [Deposit_Amount] FROM [Deposit]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="SELECT Bank.Bank_ID, [Bank_Name], [Bank_Street_Line1], [Bank_Street_Line2], [Bank_City], [Bank_State], [Bank_Zip_Code]
        FROM (Bank INNER JOIN Deposit ON Bank.Bank_ID = Deposit.Bank_ID)
        WHERE Deposit.Bank_ID = 3"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT[Deposit_Date] FROM [Deposit]">
    </asp:SqlDataSource>
      <section>
		<div id="sectionHeader">Bank</div>
          <div id="bank" class="sectionContent">
             <h3>Deposit Date: </h3>
		    <asp:DropDownList ID="calendarDD" runat="server" Width="200px" Height="2em" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="Deposit_Date" DataValueField="Deposit_Date">
            </asp:DropDownList>
              <img class="roundIcons" id="calendarIcon" src="../images/roundIcons/calendarIcon.png" width="50" height="50" alt="calendarIcon"/>
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Deposit_ID" DataSourceID="SqlDataSource1" CellPadding="4" GridLines="None" ForeColor="#333333" CssClass="detailedView">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" Width="125px" />
                <Fields>
                    <asp:BoundField DataField="Deposit_ID" HeaderText="Deposit ID" InsertVisible="False" ReadOnly="True" SortExpression="Deposit_ID" />
                    <asp:BoundField DataField="Bank_ID" HeaderText="Bank ID" ReadOnly="True" SortExpression="Bank_ID" />
                    <asp:BoundField DataField="Kiosk_ID" HeaderText="Kiosk ID" ReadOnly="True" SortExpression="Kiosk_ID" />
                    <asp:BoundField DataField="Employee_ID" HeaderText="Employee ID" ReadOnly="True" SortExpression="Employee_ID" />
                    <asp:BoundField DataField="Deposit_Date" HeaderText="Deposit Date" ReadOnly="True" SortExpression="Deposit_Date" />
                    <asp:BoundField DataField="Deposit_Amount" HeaderText="Deposit Amount" ReadOnly="True" SortExpression="Deposit_Amount" />
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