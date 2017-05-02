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
        height:3em;
    }
    h3{
        display:inline-block;
    }
    .detailedView{
        height:50px;
        width: 650px;
    }
    .validator{
        color:white;
        font-weight:bold;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:SqlDataSource ID="DD_Datasource" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT [Deposit_Date] FROM [Deposit] WHERE ([Kiosk_ID] = @Kiosk_ID) ORDER BY [Deposit_Date]" >
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
        SelectCommand="SELECT * FROM [Bank] INNER JOIN (SELECT Deposit.Bank_ID FROM [Deposit] WHERE ([Deposit_Date] = @Deposit_Date) AND ([Kiosk_ID] = @Kiosk_ID))DB ON Bank.Bank_ID = DB.Bank_ID;"
        UpdateCommand="UPDATE Bank 
        SET [Bank_Name] = @Bank_Name, [Bank_Street_Line1] = @Bank_Street_Line1, [Bank_Street_Line2] = @Bank_Street_Line2, [Bank_City] = @Bank_City, [Bank_State] = @Bank_State, [Bank_Zip_Code] = @Bank_Zip_Code
        FROM Bank
        JOIN
        (
         SELECT Deposit.Bank_ID 
         FROM [Deposit] 
         WHERE ([Deposit_Date] = @Deposit_Date) 
         AND ([Kiosk_ID] = @Kiosk_ID)
         )DB 
        ON Bank.Bank_ID = DB.Bank_ID;"
        InsertCommand="Insert INTO Bank VALUES (@Bank_Name,@Bank_Street_Line1,@Bank_Street_Line2,@Bank_City,@Bank_State,@Bank_Zip_Code);">
        <SelectParameters>
            <asp:ControlParameter ControlID="calendarDD" Name="Deposit_Date" PropertyName="SelectedValue" DbType="Date" />
            <asp:CookieParameter CookieName="Kiosk_ID" Name="Kiosk_ID" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="calendarDD" Name="Deposit_Date" PropertyName="SelectedValue" DbType="Date" />
            <asp:CookieParameter CookieName="Kiosk_ID" Name="Kiosk_ID" Type="Int32" />
              <asp:Parameter Name="Bank_Name" Type="String" />
              <asp:Parameter Name="Bank_Street_Line1" Type="String" />
              <asp:Parameter Name="Bank_Street_Line2" Type="String" />
              <asp:Parameter Name="Bank_City" Type="String" />
              <asp:Parameter Name="Bank_State" Type="String" />
              <asp:Parameter Name="Bank_Zip_Code" Type="String" />
          </UpdateParameters>
        <InsertParameters>
              <asp:Parameter Name="Bank_Name" Type="String" />
              <asp:Parameter Name="Bank_Street_Line1" Type="String" />
              <asp:Parameter Name="Bank_Street_Line2" Type="String" />
              <asp:Parameter Name="Bank_City" Type="String" />
              <asp:Parameter Name="Bank_State" Type="String" />
              <asp:Parameter Name="Bank_Zip_Code" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
   
      <section>
		<div id="sectionHeader">Bank</div>
          <div id="bank" class="sectionContent">
            <h3>Deposit Date: </h3>

		    <asp:DropDownList ID="calendarDD" runat="server" Width="200px" Height="2em" AutoPostBack="True" 
                DataSourceID="DD_Datasource" DataTextField="Deposit_Date" DataValueField="Deposit_Date" AppendDataBoundItems="false">
                
            </asp:DropDownList>
            <img class="roundIcons" id="calendarIcon" src="../images/roundIcons/calendarIcon.png" width="50" height="50" alt="calendarIcon"/>

            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="Deposit_ID" 
                DataSourceID="Deposit_Datasource" CellPadding="4" GridLines="None" ForeColor="#333333" CssClass="detailedView">
                <AlternatingRowStyle BackColor="White" />
                <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
                <EditRowStyle BackColor="#7C6F57" />
                <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" Width="125px" />
                <Fields>
                    <asp:BoundField DataField="Deposit_ID"      HeaderText="Deposit ID"     SortExpression="Deposit_ID" ReadOnly="True"  InsertVisible="False" />
                    <asp:BoundField DataField="Bank_ID"         HeaderText="Bank ID"        SortExpression="Bank_ID"        />
                    <asp:BoundField DataField="Kiosk_ID"        HeaderText="Kiosk ID"       SortExpression="Kiosk_ID"       />
                    <asp:BoundField DataField="Employee_ID"     HeaderText="Employee ID"    SortExpression="Employee_ID"    />   
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
                    <asp:TemplateField HeaderText="Bank ID">
                        <ItemTemplate>
                            <asp:Label ID="idLB"  runat="server" Text='<%# Eval("Bank_ID") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtBankID"  runat="server" ReadOnly="true" Text='<%# Eval("Bank_ID") %>'></asp:Textbox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Label ID="idLB" style="color:white;" runat="server" ReadOnly="true" Text='-------------------------------'></asp:Label>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Bank Name">
                        <ItemTemplate>
                            <asp:Label ID="lblBankName"  runat="server" Text='<%# Eval("Bank_Name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtBankName"  runat="server" Text='<%# Bind("Bank_Name") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valBankName" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtBankName"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Textbox ID="txtBankName"  runat="server" Text='<%# Bind("Bank_Name") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valBankName" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtBankName"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Street Line 1">
                        <ItemTemplate>
                            <asp:Label ID="lblBankStreet1"  runat="server" Text='<%# Eval("Bank_Street_Line1") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtBankStreet1"  runat="server" Text='<%# Bind("Bank_Street_Line1") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valBankStreet1" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtBankStreet1"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Textbox ID="txtBankStreet1"  runat="server" Text='<%# Bind("Bank_Street_Line1") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valBankStreet1" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtBankStreet1"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Street Line 2">
                        <ItemTemplate>
                            <asp:Label ID="lblBankStreet2"  runat="server" Text='<%# Eval("Bank_Street_Line2") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtBankStreet2"  runat="server" Text='<%# Bind("Bank_Street_Line2") %>'></asp:Textbox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Textbox ID="txtBankStreet2"  runat="server" Text='<%# Bind("Bank_Street_Line2") %>'></asp:Textbox>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="lblBankCity"  runat="server" Text='<%# Eval("Bank_City") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtBankCity"  runat="server" Text='<%# Bind("Bank_City") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valBankCity" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtBankCity"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Textbox ID="txtBankCity"  runat="server" Text='<%# Bind("Bank_City") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valBankCity" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtBankCity"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State">
                        <ItemTemplate>
                            <asp:Label ID="lblBankState"  runat="server" Text='<%# Eval("Bank_State") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtBankState"  runat="server" Text='<%# Bind("Bank_State") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valBankState" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtBankState"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                             <asp:Textbox ID="txtBankState"  runat="server" Text='<%# Bind("Bank_State") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valBankState" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtBankState"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Zip Code">
                        <ItemTemplate>
                            <asp:Label ID="lblBankZip"  runat="server" Text='<%# Eval("Bank_Zip_Code") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtBankZip"  runat="server" Text='<%# Bind("Bank_Zip_Code") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valBankZip" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtBankZip"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:Textbox ID="txtBankZip"  runat="server" Text='<%# Bind("Bank_Zip_Code") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valBankZip" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtBankZip"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowInsertButton="True" ShowEditButton="True"/>
                </Fields>
                <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
            </asp:DetailsView><br />
              
        </div>
	</section>
</asp:Content>