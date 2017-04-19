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
             height:395px;
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="SELECT * FROM [Employees]" FilterExpression="Employee_ID='{0}'">
          <FilterParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Employee_ID" PropertyName="SelectedValue" />
          </FilterParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="SELECT [Employee_First_Name], [Employee_ID], [Employee_Last_Name], [Employee_Phone] FROM [Employees]"></asp:SqlDataSource>
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
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="Employee_ID"         HeaderText="ID" ReadOnly="True" SortExpression="Employee_ID" />
                            <asp:BoundField DataField="Employee_First_Name" HeaderText="First Name"         SortExpression="Employee_First_Name" />
                            <asp:BoundField DataField="Employee_Last_Name"  HeaderText="Last Name"          SortExpression="Employee_Last_Name" />
                            <asp:BoundField DataField="Employee_Phone"      HeaderText="Phone"              SortExpression="Employee_Phone" />
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
                <h3>Employee </h3>
                <div style="height: 250px; width:625px; overflow-y: scroll">

                <asp:DetailsView ID="DetailsView1" runat="server" 
                    AutoGenerateRows="False"        DataKeyNames="Employee_ID" 
                    DataSourceID="SqlDataSource1"   CellPadding="4" GridLines="None" 
                    ForeColor="#333333"             CssClass="detailedView">

                    <AlternatingRowStyle    BackColor="White" />
                    <CommandRowStyle        BackColor="#C5BBAF" Font-Bold="True" />
                    <EditRowStyle           BackColor="#7C6F57" />
                    <FieldHeaderStyle       BackColor="#D0D0D0" Font-Bold="True" Width="125px" />
                    <Fields>
                        <asp:BoundField DataField="Employee_ID"             HeaderText="ID" ReadOnly="True" SortExpression="Employee_ID" />
                        <asp:BoundField DataField="Employee_First_Name"     HeaderText="First Name"         SortExpression="Employee_First_Name" />
                        <asp:BoundField DataField="Employee_Last_Name"      HeaderText="Last Name"          SortExpression="Employee_Last_Name" />
                        <asp:BoundField DataField="Employee_Street_Line1"   HeaderText="Street Address 1"   SortExpression="Employee_Street_Line1" />
                        <asp:BoundField DataField="Employee_Street_Line2"   HeaderText="Street Address 2"   SortExpression="Employee_Street_Line2" />
                        <asp:BoundField DataField="Employee_City"           HeaderText="City"               SortExpression="Employee_City" />
                        <asp:BoundField DataField="Employee_State"          HeaderText="State"              SortExpression="Employee_State" />
                        <asp:BoundField DataField="Employee_Zip_Code"       HeaderText="ZipCode"            SortExpression="Employee_Zip_Code" />
                        <asp:BoundField DataField="Employee_SSN"            HeaderText="SSN"                SortExpression="Employee_SSN" />
                        <asp:BoundField DataField="Employee_DOB"            HeaderText="DOB"                SortExpression="Employee_DOB" />
                        <asp:BoundField DataField="Employee_Phone"          HeaderText="Phone"              SortExpression="Employee_Phone" />
                        <asp:BoundField DataField="Role_ID"                 HeaderText="Role ID"            SortExpression="Role_ID" />
                        <asp:BoundField DataField="Employee_Hire_Date"      HeaderText="HireDate"           SortExpression="Employee_Hire_Date" />
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