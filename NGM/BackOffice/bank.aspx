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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="SELECT [Deposit_ID], [Bank_ID], [Kiosk_ID], [Employee_ID], [Deposit_Date], [Deposit_Amount] FROM [Deposit]"></asp:SqlDataSource>
    
      <section>
		<div id="sectionHeader">Bank</div>
          <div id="bank" class="sectionContent">
            <h3>Deposit on: </h3>
		    <asp:DropDownList ID="calendarDD" runat="server" Width="8em" Height="2em">
                <asp:ListItem>Test</asp:ListItem>
           
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
              
        </div>
	</section>
</asp:Content>