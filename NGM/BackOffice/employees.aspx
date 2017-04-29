<%@ Page Title="" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" Inherits="NGM.employees" Codebehind="employees.aspx.vb" %>

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
             height:400px;
             padding-top:30px;
         }
         h3{display:inline-block;}

         .roundIcons{
            margin-left:15px;
            top: 20px;
            left: 0px;
         }
         th{
             border:1px solid black;
             width:150px;
             text-align:left;
         }
         .tableCells{
             width:400px;
         }
         .validator{
             color:#ad0c0c;
         }
    </style>
    <script type="text/javascript">
        function displayValidatorErrors() {
            window.confirm(document.getElementById('valEmployee_First_Name').innerHTML);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT * FROM [Employees]" FilterExpression="Employee_ID='{0}'"
        UpdateCommand="UPDATE [Employees] SET [Employee_First_Name] = @Employee_First_Name, [Employee_Last_Name] = @Employee_Last_Name, [Employee_Street_Line1] = @Employee_Street_Line1, [Employee_Street_Line2] = @Employee_Street_Line2, [Employee_City] = @Employee_City, [Employee_State] = @Employee_State, [Employee_Zip_Code] = @Employee_Zip_Code, [Employee_SSN] = @Employee_SSN, [Employee_DOB] = @Employee_DOB, [Employee_Phone] = @Employee_Phone, [Role_ID] = @Role_ID, [Employee_Hire_Date] = @Employee_Hire_Date, [Employee_Release_Date] = @Employee_Release_Date, WHERE [Employee_ID] = @Employee_ID">
     
          <FilterParameters>
                <asp:ControlParameter ControlID="GridView1" Name="Employee_ID" PropertyName="SelectedValue" />
          </FilterParameters>
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
              <asp:Parameter DbType="Date" Name="Employee_Release_Date" />
              <asp:Parameter Name="Employee_ID" Type="Int32" />
          </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT [Employee_First_Name], [Employee_ID], [Employee_Last_Name], [Employee_Phone] FROM [Employees]" >
        <InsertParameters>
            <asp:Parameter Name="Employee_First_Name" Type="String" />
            <asp:Parameter Name="Employee_ID" Type="Int32" />
            <asp:Parameter Name="Employee_Last_Name" Type="String" />
            <asp:Parameter Name="Employee_Phone" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <section>
    <div id="sectionHeader">Employees</div>
        <asp:MultiView ID="MultiViewEmployees" runat="server">
        <asp:View ID="EmployeeView" runat="server">
		
            <div class="sectionContent">
                <h3>Employees </h3>
                <div style="height: 125px; width:625px; overflow-y: scroll; float:left;">

                    <asp:GridView ID="GridView1"    runat="server"          AutoGenerateColumns="False" 
                        DataKeyNames="Employee_ID"  DataSourceID="SqlDataSource2" 
                        BackColor="White"           BorderColor="#999999"   BorderStyle="None" 
                        BorderWidth="1px"           CellPadding="3"         GridLines="Vertical" Width="600px"
                        AutoPostBack ="True" AllowSorting="True" >
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="Employee_First_Name" HeaderText="Employee_First_Name"         SortExpression="Employee_First_Name" />
                            <asp:BoundField DataField="Employee_ID"         HeaderText="Employee_ID"                 SortExpression="Employee_ID" ReadOnly="True" />
                            <asp:BoundField DataField="Employee_Last_Name"  HeaderText="Employee_Last_Name"          SortExpression="Employee_Last_Name" />
                            <asp:BoundField DataField="Employee_Phone"      HeaderText="Employee_Phone"              SortExpression="Employee_Phone" />
                            <asp:CommandField   ShowSelectButton="True"/>
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
                </div>
                
                <br/>

                <h3 id="employeeHeader" runat="server">Employee </h3>
                
                <div style="height: 250px; width:625px; overflow-y: scroll" runat="server" id="detailSection">

                <asp:DetailsView ID="DetailsView1" runat="server"
                    AutoGenerateRows="False"        DataKeyNames="Employee_ID" 
                    DataSourceID="SqlDataSource1"   CellPadding="4" GridLines="None" 
                    ForeColor="#333333"             CssClass="detailedView">

                    <AlternatingRowStyle    BackColor="White" />
                    <CommandRowStyle        BackColor="#C5BBAF" Font-Bold="True" />
                    <EditRowStyle           BackColor="#7C6F57" />
                    <FieldHeaderStyle        BackColor="#D0D0D0" Font-Bold="True" Width="125px" />
                    <Fields>
                        <asp:BoundField DataField="Employee_ID"             HeaderText="ID" ReadOnly="True"    SortExpression="Employee_ID" />
                        <asp:BoundField DataField="Employee_First_Name"     HeaderText="First Name"            SortExpression="Employee_First_Name" />
                        <asp:BoundField DataField="Employee_Last_Name"      HeaderText="Last Name"             SortExpression="Employee_Last_Name" />
                        <asp:BoundField DataField="Employee_Street_Line1"   HeaderText="Street Line 1"          SortExpression="Employee_Street_Line1" />
                        <asp:BoundField DataField="Employee_Street_Line2"   HeaderText="Street Line 2"          SortExpression="Employee_Street_Line2" />
                        <asp:BoundField DataField="Employee_City"           HeaderText="City"                  SortExpression="Employee_City" />
                        <asp:BoundField DataField="Employee_State"          HeaderText="State"                 SortExpression="Employee_State" />
                        <asp:BoundField DataField="Employee_Zip_Code"       HeaderText="ZipCode"              SortExpression="Employee_Zip_Code" />
                        <asp:BoundField DataField="Employee_SSN"            HeaderText="SSN"                   SortExpression="Employee_SSN" />
                        <asp:BoundField DataField="Employee_DOB"            HeaderText="DOB"                   SortExpression="Employee_DOB" />
                        <asp:BoundField DataField="Employee_Phone"          HeaderText="Phone"                 SortExpression="Employee_Phone" />
                        <asp:BoundField DataField="Role_ID"                 HeaderText="Role"                        SortExpression="Role_ID" />
                        <asp:BoundField DataField="Employee_Hire_Date"      HeaderText="Hire Date"             SortExpression="Employee_Hire_Date" />
                        <asp:BoundField DataField="Employee_Release_Date"      HeaderText="Release Date"             SortExpression="Employee_Release_Date" />
                        <asp:CommandField ShowEditButton="True" />
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
                <a><asp:ImageButton runat="server" class="roundIcons" id="subtractEmp"  src="../images/roundIcons/minusIcon.png"    alt="subtractIcon" OnClientClick="return confirm('Are you sure you want to remove this employee?');"/></a>
            </div>
        </asp:View>

        <asp:View ID="EmployeeAddForm" runat="server">
            <div class="sectionContent">
            <h3>Add New Employee </h3>
            <asp:Label ID="errorLabel" runat="server" Text=""></asp:Label>
            <table>
                <tr>
                  <th>ID</th>
                  <td><asp:Label ID="idLB"        CssClass="tableCells" runat="server"></asp:Label></td>
                </tr>
                <tr>
                  <th>First Name</th>
                  <td><asp:TextBox ID="fNameTB"     CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>Last Name</th>
                  <td><asp:TextBox ID="lNameTB"     CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>Street Line 1</th>
                  <td><asp:TextBox ID="stOneTB"     CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>Street Line 2</th>
                  <td><asp:TextBox ID="stTwoTB"     CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>City</th>
                  <td><asp:TextBox ID="cityTB"      CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>State</th>
                  <td><asp:TextBox ID="stateTB"     CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>Zipcode</th>
                  <td><asp:TextBox ID="zipTB"       CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>SSN</th>
                  <td><asp:TextBox ID="ssnTB"       CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>DOB</th>
                  <td><asp:TextBox ID="dobTB"       CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>Phone</th>
                  <td><asp:TextBox ID="phoneTB"     CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>Role ID</th>
                  <td><asp:TextBox ID="roleTB"      CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>Hire Date</th>
                  <td><asp:TextBox ID="hireDateTB"  CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>Login Password</th>
                  <td><asp:TextBox ID="loginPasswordTB"  CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
            </table>
                <asp:ImageButton ID="cancelButton"  CssClass="formButtons" runat="server" src="../images/smallButtons/cancelIcon.png"/>
                <asp:ImageButton ID="submitButton"  CssClass="formButtons"  runat="server" src="../images/smallButtons/submitIcon.png"/>
        </div>
        </asp:View>
    </asp:MultiView>
	</section>
</asp:Content>