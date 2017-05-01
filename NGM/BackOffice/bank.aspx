<%@ Page Title="Bank" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" Inherits="NGM.bank" Codebehind="bank.aspx.vb"  %>
<%@ MasterType VirtualPath="~/BackOffice/backoffice.master" %>

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

    <asp:SqlDataSource ID="DD_Datasource" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT [Deposit_Date], [BANK_ID] FROM [Deposit] WHERE ([Kiosk_ID] = @Kiosk_ID) ORDER BY [Deposit_Date] DESC" >
        <SelectParameters>
            <asp:CookieParameter CookieName="Kiosk_ID" Name="Kiosk_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="Deposit_Datasource" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT [Deposit_Date], [Deposit_Amount], [Employee_ID], [Deposit_ID], [Kiosk_ID], [Bank_ID] FROM [Deposit] WHERE (([Deposit_Date] = @Deposit_Date) AND ([Kiosk_ID] = @Kiosk_ID))">
        <SelectParameters>
            <asp:ControlParameter ControlID="calendarDD" DbType="Date" Name="Deposit_Date" PropertyName="SelectedValue" />
            <asp:CookieParameter CookieName="Kiosk_ID" Name="Kiosk_ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="Bank_Datasource" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT * FROM [Bank] WHERE ([Bank_ID] = @Bank_ID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="calendarDD" Name="Bank_ID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
   
      <section>
		<div id="sectionHeader">Bank</div>
          <div id="bank" class="sectionContent">
            <h3>Deposit Date: </h3>

		    <asp:DropDownList ID="calendarDD" runat="server" Width="200px" Height="2em" AutoPostBack="True"  
                DataSourceID="DD_Datasource" DataTextField="Deposit_Date" DataValueField="Deposit_Date">
            </asp:DropDownList>
            <img class="roundIcons" id="calendarIcon" src="../images/roundIcons/calendarIcon.png" width="50" height="50" alt="calendarIcon"/>

            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Deposit_ID" 
                DataSourceID="Deposit_Datasource" CellPadding="4" GridLines="None" ForeColor="#333333" CssClass="detailedView">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" Width="125px" />
                <Fields>
                    <asp:BoundField DataField="Bank_ID"         HeaderText="Bank ID"        SortExpression="Bank_ID"         />
                    <asp:BoundField DataField="Kiosk_ID"        HeaderText="Kiosk ID"       SortExpression="Kiosk_ID"       />
                    <asp:BoundField DataField="Employee_ID"     HeaderText="Employee ID"    SortExpression="Employee_ID"    />
                    <asp:BoundField DataField="Deposit_ID"      HeaderText="Deposit ID"     SortExpression="Deposit_ID" ReadOnly="True"  InsertVisible="False" />
                    <asp:BoundField DataField="Deposit_Amount"  HeaderText="Deposit Amount" SortExpression="Deposit_Amount" />

                </Fields>
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
            </asp:DetailsView><br />
            <h3>Bank Info </h3>
            <asp:DetailsView ID="DetailsView2" runat="server" AutoGenerateRows="False" DataKeyNames="Bank_ID" 
                DataSourceID="Bank_Datasource" CellPadding="4" GridLines="None" ForeColor="#333333" CssClass="detailedView">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" Width="125px" />
                <Fields>
                    <asp:BoundField DataField="Bank_ID"             HeaderText="Bank_ID"             SortExpression="Bank_ID"  InsertVisible="False" ReadOnly="True" />
                    <asp:BoundField DataField="Bank_Name" HeaderText="Bank_Name" SortExpression="Bank_Name" />
                    <asp:BoundField DataField="Bank_Street_Line1" HeaderText="Bank_Street_Line1" SortExpression="Bank_Street_Line1" />
                    <asp:BoundField DataField="Bank_Street_Line2" HeaderText="Bank_Street_Line2" SortExpression="Bank_Street_Line2" />
                    <asp:BoundField DataField="Bank_City" HeaderText="Bank_City" SortExpression="Bank_City" />
                    <asp:BoundField DataField="Bank_State" HeaderText="Bank_State" SortExpression="Bank_State" />
                    <asp:BoundField DataField="Bank_Zip_Code" HeaderText="Bank_Zip_Code" SortExpression="Bank_Zip_Code" />
                </Fields>
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
            </asp:DetailsView><br />
              
        </div>
	</section>
</asp:Content>