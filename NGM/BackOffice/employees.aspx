<%@ Page Title="" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" CodeFile="employees.aspx.vb" Inherits="employees" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .sectionContent{
            width:600px;
            height:400px;
            padding-left:50px;
            padding-right:50px;
        }#calendarDD{
            width:8em;
            height:2em;
        }.detailedView{
            height:50px;
            width: 600px;
        }
         .buttonContainer{
             position:absolute;
             right:313px;
             bottom:95px;
             width:60px;
             height:425px;
             padding-top:30px;
         }
         h3{display:inline-block;}

         .roundIcons{
            margin-left:15px;
            top: 20px;
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT * FROM [Employees]" FilterExpression="Employee_ID='{0}'" 
        DeleteCommand="DELETE FROM [Employees] WHERE [Employee_ID] = @Employee_ID" 
        InsertCommand="INSERT INTO [Employees] ([Employee_ID], [Employee_First_Name], [Employee_Last_Name], [Employee_Street_Line1], [Employee_Street_Line2], [Employee_City], [Employee_State], [Employee_Zip_Code], [Employee_SSN], [Employee_DOB], [Employee_Phone], [Role_ID], [Employee_Hire_Date]) VALUES (@Employee_ID, @Employee_First_Name, @Employee_Last_Name, @Employee_Street_Line1, @Employee_Street_Line2, @Employee_City, @Employee_State, @Employee_Zip_Code, @Employee_SSN, @Employee_DOB, @Employee_Phone, @Role_ID, @Employee_Hire_Date)" 
        UpdateCommand="UPDATE [Employees] SET [Employee_First_Name] = @Employee_First_Name, [Employee_Last_Name] = @Employee_Last_Name, [Employee_Street_Line1] = @Employee_Street_Line1, [Employee_Street_Line2] = @Employee_Street_Line2, [Employee_City] = @Employee_City, [Employee_State] = @Employee_State, [Employee_Zip_Code] = @Employee_Zip_Code, [Employee_SSN] = @Employee_SSN, [Employee_DOB] = @Employee_DOB, [Employee_Phone] = @Employee_Phone, [Role_ID] = @Role_ID, [Employee_Hire_Date] = @Employee_Hire_Date WHERE [Employee_ID] = @Employee_ID">
          <DeleteParameters>
              <asp:Parameter Name="Employee_ID" Type="Int32" />
          </DeleteParameters>
          <FilterParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Employee_ID" PropertyName="SelectedValue" />
          </FilterParameters>
          <InsertParameters>
              <asp:Parameter Name="Employee_ID" Type="Int32" />
              <asp:Parameter Name="Employee_First_Name" Type="String" />
              <asp:Parameter Name="Employee_Last_Name" Type="String" />
              <asp:Parameter Name="Employee_Street_Line1" Type="String" />
              <asp:Parameter Name="Employee_Street_Line2" Type="String" />
              <asp:Parameter Name="Employee_City" Type="String" />
              <asp:Parameter Name="Employee_State" Type="String" />
              <asp:Parameter Name="Employee_Zip_Code" Type="String" />
              <asp:Parameter Name="Employee_SSN" Type="String" />
              <asp:Parameter DbType="Date" Name="Employee_DOB" />
              <asp:Parameter Name="Employee_Phone" Type="String" />
              <asp:Parameter Name="Role_ID" Type="Int32" />
              <asp:Parameter DbType="Date" Name="Employee_Hire_Date" />
          </InsertParameters>
          <UpdateParameters>
              <asp:Parameter Name="Employee_First_Name" Type="String" />
              <asp:Parameter Name="Employee_Last_Name" Type="String" />
              <asp:Parameter Name="Employee_Street_Line1" Type="String" />
              <asp:Parameter Name="Employee_Street_Line2" Type="String" />
              <asp:Parameter Name="Employee_City" Type="String" />
              <asp:Parameter Name="Employee_State" Type="String" />
              <asp:Parameter Name="Employee_Zip_Code" Type="String" />
              <asp:Parameter Name="Employee_SSN" Type="String" />
              <asp:Parameter DbType="Date" Name="Employee_DOB" />
              <asp:Parameter Name="Employee_Phone" Type="String" />
              <asp:Parameter Name="Role_ID" Type="Int32" />
              <asp:Parameter DbType="Date" Name="Employee_Hire_Date" />
              <asp:Parameter Name="Employee_ID" Type="Int32" />
          </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="SELECT [Employee_First_Name], [Employee_ID], [Employee_Last_Name], [Employee_Phone] FROM [Employees]" DeleteCommand="DELETE FROM [Employees] WHERE [Employee_ID] = @Employee_ID" InsertCommand="INSERT INTO [Employees] ([Employee_First_Name], [Employee_ID], [Employee_Last_Name], [Employee_Phone]) VALUES (@Employee_First_Name, @Employee_ID, @Employee_Last_Name, @Employee_Phone)" UpdateCommand="UPDATE [Employees] SET [Employee_First_Name] = @Employee_First_Name, [Employee_Last_Name] = @Employee_Last_Name, [Employee_Phone] = @Employee_Phone WHERE [Employee_ID] = @Employee_ID">
        <DeleteParameters>
            <asp:Parameter Name="Employee_ID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Employee_First_Name" Type="String" />
            <asp:Parameter Name="Employee_ID" Type="Int32" />
            <asp:Parameter Name="Employee_Last_Name" Type="String" />
            <asp:Parameter Name="Employee_Phone" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Employee_First_Name" Type="String" />
            <asp:Parameter Name="Employee_Last_Name" Type="String" />
            <asp:Parameter Name="Employee_Phone" Type="String" />
            <asp:Parameter Name="Employee_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
      <section>
		<div id="sectionHeader">Employees</div>
             <div id="bank" class="sectionContent">
                <h3>Employees </h3>
                <div style="height: 125px; width:625px; overflow-y: scroll; float:left;">

                    <asp:GridView ID="GridView1"    runat="server"          AutoGenerateColumns="False" 
                        DataKeyNames="Employee_ID"  DataSourceID="SqlDataSource2" 
                        BackColor="White"           BorderColor="#999999"   BorderStyle="None" 
                        BorderWidth="1px"           CellPadding="3"         GridLines="Vertical" Width="600px"
                        AutoPostBack ="True" AllowSorting="True" >
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="Employee_First_Name"         HeaderText="Employee_First_Name" SortExpression="Employee_First_Name" />
                            <asp:BoundField DataField="Employee_ID" HeaderText="Employee_ID"         SortExpression="Employee_ID" ReadOnly="True" />
                            <asp:BoundField DataField="Employee_Last_Name"  HeaderText="Employee_Last_Name"          SortExpression="Employee_Last_Name" />
                            <asp:BoundField DataField="Employee_Phone"      HeaderText="Employee_Phone"              SortExpression="Employee_Phone" />
                            <asp:CommandField  ShowSelectButton="True" ShowDeleteButton="True"/>
                        </Columns>
                        <FooterStyle    BackColor="#CCCCCC" ForeColor="Black" />
                        <HeaderStyle    BackColor="#666666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle     BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                        <RowStyle       BackColor="#EEEEEE" ForeColor="Black" />
                        <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle       BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle     BackColor="#0000A9" />
                        <SortedDescendingCellStyle      BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle    BackColor="#000065" />
                    </asp:GridView>
                </div><br/>
                <h3 id="employeeHeader" runat="server">Employee </h3>
                <div style="height: 250px; width:625px; overflow-y: scroll" runat="server" id="detailSection">

                <asp:DetailsView ID="DetailsView1" runat="server" 
                    AutoGenerateRows="False"        DataKeyNames="Employee_ID" 
                    DataSourceID="SqlDataSource1"   CellPadding="4" GridLines="None" 
                    ForeColor="#333333"             CssClass="detailedView">

                    <AlternatingRowStyle    BackColor="White" />
                    <CommandRowStyle        BackColor="#C5BBAF" Font-Bold="True" />
                    <EditRowStyle           BackColor="#7C6F57" />
                    <FieldHeaderStyle       BackColor="#D0D0D0" Font-Bold="True" Width="125px" />
                    <Fields>
                        <asp:BoundField DataField="Employee_ID"             HeaderText="Employee_ID" ReadOnly="True" SortExpression="Employee_ID" />
                        <asp:BoundField DataField="Employee_First_Name"     HeaderText="Employee_First_Name"         SortExpression="Employee_First_Name" />
                        <asp:BoundField DataField="Employee_Last_Name"      HeaderText="Employee_Last_Name"          SortExpression="Employee_Last_Name" />
                        <asp:BoundField DataField="Employee_Street_Line1"   HeaderText="Employee_Street_Line1"   SortExpression="Employee_Street_Line1" />
                        <asp:BoundField DataField="Employee_Street_Line2"   HeaderText="Employee_Street_Line2"   SortExpression="Employee_Street_Line2" />
                        <asp:BoundField DataField="Employee_City"           HeaderText="Employee_City"               SortExpression="Employee_City" />
                        <asp:BoundField DataField="Employee_State"          HeaderText="Employee_State"              SortExpression="Employee_State" />
                        <asp:BoundField DataField="Employee_Zip_Code"       HeaderText="Employee_Zip_Code"            SortExpression="Employee_Zip_Code" />
                        <asp:BoundField DataField="Employee_SSN"            HeaderText="Employee_SSN"                SortExpression="Employee_SSN" />
                        <asp:BoundField DataField="Employee_DOB"            HeaderText="Employee_DOB"                SortExpression="Employee_DOB" />
                        <asp:BoundField DataField="Employee_Phone"          HeaderText="Employee_Phone"              SortExpression="Employee_Phone" />
                        <asp:BoundField DataField="Role_ID"                 HeaderText="Role_ID"            SortExpression="Role_ID" />
                        <asp:BoundField DataField="Employee_Hire_Date"      HeaderText="Employee_Hire_Date"           SortExpression="Employee_Hire_Date" />
                        <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#E3EAEB" />
                </asp:DetailsView>
                </div>
            </div>
        <div class="buttonContainer">
            <a><asp:ImageButton runat="server" class="roundIcons" id="addEmp"       src="../images/roundIcons/addIcon.png"      alt="addIcon"/></a>
            <a><asp:ImageButton runat="server" class="roundIcons" id="subtractEmp"  src="../images/roundIcons/minusIcon.png"    alt="subtractIcon"/></a>
            <a><asp:ImageButton runat="server" class="roundIcons" id="editEmp"      src="../images/roundIcons/editIcon.png"     alt="editIcon" Style="margin-top:275px;"/></a>
        </div>
	</section>
</asp:Content>