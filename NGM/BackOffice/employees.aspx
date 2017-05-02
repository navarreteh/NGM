<%@ Page Title="" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" Inherits="NGM.employees" Codebehind="employees.aspx.vb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .sectionContent{
            width:700px;
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
             width:300px;
         }
         .validator{
             color:white;
             font-weight:bold;
         }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT * FROM [Employees]" FilterExpression="Employee_ID='{0}'"
        UpdateCommand="UPDATE [Employees] SET [Employee_First_Name] = @Employee_First_Name, [Employee_Last_Name] = @Employee_Last_Name, [Employee_Street_Line1] = @Employee_Street_Line1, [Employee_Street_Line2] = @Employee_Street_Line2, [Employee_City] = @Employee_City, [Employee_State] = @Employee_State, [Employee_Zip_Code] = @Employee_Zip_Code, [Employee_SSN] = @Employee_SSN, [Employee_DOB] = @Employee_DOB, [Employee_Phone] = @Employee_Phone, [Role_ID] = @Role_ID, [Employee_Hire_Date] = @Employee_Hire_Date, [Employee_Release_Date] = @Employee_Release_Date WHERE [Employee_ID] = @Employee_ID">
     
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
              <asp:Parameter Name="Employee_Release_Date" DbType="Date" />
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
                        <asp:TemplateField HeaderText="Employee ID">
                        <ItemTemplate>
                            <asp:Label ID="lblEmpID"  runat="server" Text='<%# Eval("Employee_ID") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Label ID="lblEmpID"  runat="server" ReadOnly="true" Text='<%# Eval("Employee_ID") %>'></asp:Label>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee First Name">
                        <ItemTemplate>
                            <asp:Label ID="lblEmployeeFirstName"  runat="server" Text='<%# Eval("Employee_First_Name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtEmployeeFirstName"  runat="server" Text='<%# Bind("Employee_First_Name") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valEmpFName" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtEmployeeFirstName"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee Last Name">
                        <ItemTemplate>
                            <asp:Label ID="lblEmployeeLastName"  runat="server" Text='<%# Eval("Employee_Last_Name") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtEmployeeLastName"  runat="server" Text='<%# Bind("Employee_Last_Name") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valEmpLName" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtEmployeeLastName"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Street Line 1">
                        <ItemTemplate>
                            <asp:Label ID="lblStreet1"  runat="server" Text='<%# Eval("Employee_Street_Line1") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtStreet1"  runat="server" Text='<%# Bind("Employee_Street_Line1") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valStreet1" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtStreet1"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Street Line 2">
                        <ItemTemplate>
                            <asp:Label ID="lblStreet2"  runat="server" Text='<%# Eval("Employee_Street_Line2") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtStreet2"  runat="server" Text='<%# Bind("Employee_Street_Line2") %>'></asp:Textbox>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="City">
                        <ItemTemplate>
                            <asp:Label ID="lblCity"  runat="server" Text='<%# Eval("Employee_City") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtCity"  runat="server" Text='<%# Bind("Employee_City") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valCity" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="State">
                        <ItemTemplate>
                            <asp:Label ID="lblState"  runat="server" Text='<%# Eval("Employee_State") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtState"  runat="server" Text='<%# Bind("Employee_State") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valState" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtState"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Zip Code">
                        <ItemTemplate>
                            <asp:Label ID="lblZip"  runat="server" Text='<%# Eval("Employee_Zip_Code") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtZip"  runat="server" Text='<%# Bind("Employee_Zip_Code") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valEmpZip" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtZip"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="SSN">
                        <ItemTemplate>
                            <asp:Label ID="lblSSN"  runat="server" Text='<%# Eval("Employee_SSN") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtSSN"  runat="server" Text='<%# Bind("Employee_SSN") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valSSN" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtSSN"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regexssn" class="validator" runat="server" ErrorMessage="SSN Format: xxx-xx-xxxx" ValidationExpression="^\d{3}-\d{2}-\d{4}$" ControlToValidate="txtSSN"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="DOB">
                        <ItemTemplate>
                            <asp:Label ID="lblDOB" runat="server" Text='<%# Eval("Employee_DOB", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="textDOB"  runat="server" Text='<%# Bind("Employee_DOB", "{0:d}") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valDOB" class="validator" runat="server" ErrorMessage="*" ControlToValidate="textDOB"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regexdob" class="validator" runat="server" ErrorMessage="DOB Format: (x)x/(x)x/(xx)xx" ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" ControlToValidate="textDOB"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate>
                            <asp:Label ID="lblPhone"  runat="server" Text='<%# Eval("Employee_Phone") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtPhone"  runat="server" Text='<%# Bind("Employee_Phone") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valPhone" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtPhone"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Role">
                        <ItemTemplate>
                            <asp:Label ID="lblRole"  runat="server" Text='<%# Eval("Role_ID") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtRole"  runat="server" Text='<%# Bind("Role_ID") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valRole" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtRole"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regexrole" class="validator" runat="server" ErrorMessage="Role Number Invalid" ValidationExpression="1|2|4|5|7|8|9|12" ControlToValidate="txtRole"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Hire Date">
                        <ItemTemplate>
                            <asp:Label ID="lblHireDate"  runat="server" Text='<%# Eval("Employee_Hire_Date", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Textbox ID="txtHireDate"  runat="server" Text='<%# Bind("Employee_Hire_Date", "{0:d}") %>'></asp:Textbox>
                            <asp:RequiredFieldValidator ID="valHireDate" class="validator" runat="server" ErrorMessage="*" ControlToValidate="txtHireDate"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regexhire" class="validator" runat="server" ErrorMessage="Hire Date Format: (x)x/(x)x/(xx)xx" ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" ControlToValidate="txtHireDate"></asp:RegularExpressionValidator>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Release Date">
                    <ItemTemplate>
                        <asp:Label ID="lblReleaseDate"  runat="server" Text='<%# Eval("Employee_Release_Date", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Textbox ID="txtReleaseDate"  runat="server" Text='<%# Bind("Employee_Release_Date", "{0:d}") %>'></asp:Textbox>
                        
                        <asp:RegularExpressionValidator ID="regexrelease" class="validator" runat="server" ErrorMessage="Release Date Format: (x)x/(x)x/(xx)xx" ValidationExpression="^((0?[13578]|10|12)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[01]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1}))|(0?[2469]|11)(-|\/)(([1-9])|(0[1-9])|([12])([0-9]?)|(3[0]?))(-|\/)((19)([2-9])(\d{1})|(20)([01])(\d{1})|([8901])(\d{1})))$" ControlToValidate="txtHireDate"></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                </asp:TemplateField>                         
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
                  <td><asp:TextBox ID="fNameTB"     CssClass="tableCells" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="valfName" class="validator" runat="server" controltovalidate="fNameTB" text="" ErrorMessage="*" Visible="true" Display="static"></asp:RequiredFieldValidator>
                  </td>
                </tr>
                <tr>
                  <th>Last Name</th>
                  <td><asp:TextBox ID="lNameTB"     CssClass="tableCells" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="vallNameTB" class="validator" runat="server" ErrorMessage="*" visible="true" ControlToValidate="lNameTB"></asp:RequiredFieldValidator>
                  </td>
                </tr>
                <tr>
                  <th>Street Line 1</th>
                  <td><asp:TextBox ID="stOneTB"     CssClass="tableCells" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator runat="server" class="validator" ErrorMessage="*" ControlToValidate="stOneTB" Visible="true" ID="valstOne"></asp:RequiredFieldValidator>
                  </td>
                </tr>
                <tr>
                  <th>Street Line 2</th>
                  <td><asp:TextBox ID="stTwoTB"     CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>City</th>
                  <td><asp:TextBox ID="cityTB"      CssClass="tableCells" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="valcity" class="validator" runat="server" ErrorMessage="*" Visible="true" ControlToValidate="cityTB"></asp:RequiredFieldValidator>
                  </td>
                </tr>
                <tr>
                  <th>State</th>
                  <td><asp:TextBox ID="stateTB"     CssClass="tableCells" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="valstate" class="validator" runat="server" ErrorMessage="*" visible="true" ControlToValidate="stateTB"></asp:RequiredFieldValidator>
                  </td>
                </tr>
                <tr>
                  <th>Zipcode</th>
                  <td><asp:TextBox ID="zipTB"       CssClass="tableCells" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="valzip" class="validator" runat="server" ErrorMessage="*" Visible="true" ControlToValidate="zipTB"></asp:RequiredFieldValidator>
                  </td>
                </tr>
                <tr>
                  <th>SSN</th>
                  <td><asp:TextBox ID="ssnTB"       CssClass="tableCells" runat="server">xxx-xx-xxxx</asp:TextBox>
                      <asp:RequiredFieldValidator ID="valssn" class="validator" runat="server" ErrorMessage="*" Visible="True" ControlToValidate="ssnTB"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="regexssn" class="validator" runat="server" ErrorMessage="SSN Format: xxx-xx-xxxx" ValidationExpression="^\d{3}-\d{2}-\d{4}$" ControlToValidate="ssnTB"></asp:RegularExpressionValidator>
                  </td>
                </tr>
                <tr>
                  <th>DOB</th>
                  <td><asp:TextBox ID="dobTB"       CssClass="tableCells" runat="server">xx/xx/xxxx</asp:TextBox>
                      <asp:RequiredFieldValidator ID="valdob" class="validator" runat="server" ErrorMessage="*" Visible="true" ControlToValidate="dobTB"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="regexdob" class="validator" runat="server" ErrorMessage="DOB Format: xx/xx/xxxx" ValidationExpression="\d{1,2}/(\d{1,2}/\d{4}|\d{2})" ControlToValidate="dobTB"></asp:RegularExpressionValidator>

                  </td>
                </tr>
                <tr>
                  <th>Phone</th>
                  <td><asp:TextBox ID="phoneTB"     CssClass="tableCells" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="valphone" class="validator" runat="server" ErrorMessage="*" Visible="true" ControlToValidate="phoneTB"></asp:RequiredFieldValidator>
                  </td>
                </tr>
                <tr>
                  <th>Role ID</th>
                  <td><asp:TextBox ID="roleTB"      CssClass="tableCells" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="valrole" class="validator" runat="server" ErrorMessage="*" Visible="true" ControlToValidate="roleTB"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="regexrole" class="validator" runat="server" ErrorMessage="Role Number Invalid" ValidationExpression="1|2|4|5|7|8|9|12" ControlToValidate="roleTB"></asp:RegularExpressionValidator>
                  </td>
                </tr>
                <tr>
                  <th>Hire Date</th>
                  <td><asp:TextBox ID="hireDateTB"  CssClass="tableCells" runat="server">xx/xx/xxxx</asp:TextBox>
                      <asp:RequiredFieldValidator ID="valhireDate" class="validator" runat="server" ErrorMessage="*" Visible="true" ControlToValidate="hireDateTB"></asp:RequiredFieldValidator>
                      <asp:RegularExpressionValidator ID="regexhireDate" class="validator" runat="server" ErrorMessage="Date Format: xx/xx/xxxx" ValidationExpression="\d{1,2}/(\d{1,2}/\d{4}|\d{2})" ControlToValidate="hiredateTB"></asp:RegularExpressionValidator>
                  </td>
                </tr>
                <tr>
                  <th>Login Password</th>
                  <td><asp:TextBox ID="loginPasswordTB"  CssClass="tableCells" runat="server"></asp:TextBox>
                      <asp:RequiredFieldValidator ID="valloginPassword" class="validator" runat="server" ErrorMessage="*" Visible="true" ControlToValidate="loginPasswordTB"></asp:RequiredFieldValidator>
                  </td>
                </tr>
            </table>
                <asp:ImageButton ID="cancelButton"  CssClass="formButtons" causesvalidation="false" runat="server" src="../images/smallButtons/cancelIcon.png"/>
                <asp:ImageButton ID="submitButton"  CssClass="formButtons"  runat="server" src="../images/smallButtons/submitIcon.png"/>
        </div>
        </asp:View>
    </asp:MultiView>
	</section>
</asp:Content>