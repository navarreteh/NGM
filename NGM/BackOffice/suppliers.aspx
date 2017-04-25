<%@ Page Title="" Language="VB" MasterPageFile="backoffice.Master" AutoEventWireup="false" Inherits="NGM.suppliers" Codebehind="suppliers.aspx.vb" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT [Supplier_ID], [Supplier_Name] , [Supplier_City], [Supplier_State] FROM [Supplier]">
  
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" 
        SelectCommand="SELECT [Supplier].*, [Contact_First_Name], [Contact_Last_Name], [Contact_Phone], [Contact_Email] FROM [Supplier],[Contact] WHERE ([Supplier_ID] = @Supplier_ID) AND [Contact].[Contact_ID] = [Supplier].[Contact_ID]" 
        UpdateCommand="UPDATE [Supplier] SET [Supplier_Type] = @Supplier_Type, [Supplier_Name] = @Supplier_Name, [Supplier_Street_Line1] = @Supplier_Street_Line1, [Supplier_Street_Line2] = @Supplier_Street_Line2, [Supplier_City] = @Supplier_City, [Supplier_State] = @Supplier_State, [Supplier_Zip_Code] = @Supplier_Zip_Code, [Contact_ID] = @Contact_ID WHERE [Supplier_ID] = @Supplier_ID" >
  
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="Supplier_ID" PropertyName="SelectedValue" Type="Int32"/>
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Supplier_Type" Type="String" />
            <asp:Parameter Name="Supplier_Name" Type="String" />
            <asp:Parameter Name="Supplier_Street_Line1" Type="String" />
            <asp:Parameter Name="Supplier_Street_Line2" Type="String" />
            <asp:Parameter Name="Supplier_City" Type="String" />
            <asp:Parameter Name="Supplier_State" Type="String" />
            <asp:Parameter Name="Supplier_Zip_Code" Type="String" />
            <asp:Parameter Name="Contact_ID" Type="Int32" />
            <asp:Parameter Name="Supplier_ID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <section>
    <div id="sectionHeader">Suppliers</div>
        <asp:MultiView ID="MultiViewSupplier" runat="server">
        <asp:View ID="SupplierView" runat="server">
		
            <div class="sectionContent">
                <h3>Suppliers </h3>
                <div style="height: 125px; width:625px; overflow-y: scroll; float:left;">

                    <asp:GridView ID="GridView1"    runat="server"          AutoGenerateColumns="False" 
                        DataKeyNames="Supplier_ID"  DataSourceID="SqlDataSource1" 
                        BackColor="White"           BorderColor="#999999"   BorderStyle="None" 
                        BorderWidth="1px"           CellPadding="3"         GridLines="Vertical" Width="600px"
                        AutoPostBack ="True" AllowSorting="True" >
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:BoundField DataField="Supplier_ID"     HeaderText="Supplier_ID"         SortExpression="Supplier_ID" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="Supplier_Name"   HeaderText="Supplier_Name"       SortExpression="Supplier_Name" />
                            <asp:BoundField DataField="Supplier_City"   HeaderText="Supplier_City"       SortExpression="Supplier_City" />
                            <asp:BoundField DataField="Supplier_State"  HeaderText="Supplier_State"      SortExpression="Supplier_State" />
                            <asp:CommandField ShowSelectButton="True" />
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
                <h3 id="employeeHeader" runat="server">Supplier</h3>
                <div style="height: 250px; width:625px; overflow-x:scroll" runat="server" id="detailSection">

                <asp:DetailsView ID="DetailsView1" runat="server" 
                    AutoGenerateRows="False"        DataKeyNames="Supplier_ID" 
                    DataSourceID="SqlDataSource2"   CellPadding="4" GridLines="None" 
                    ForeColor="#333333"             CssClass="detailedView">

                    <AlternatingRowStyle    BackColor="White" />
                    <CommandRowStyle        BackColor="#C5BBAF" Font-Bold="True" />
                    <EditRowStyle           BackColor="#7C6F57" />
                    <FieldHeaderStyle        BackColor="#D0D0D0" Font-Bold="True" Width="125px" />
                    <Fields>
                        <asp:BoundField DataField="Supplier_ID"             HeaderText="Supplier_ID"            InsertVisible="False" ReadOnly="True" SortExpression="Supplier_ID" />
                        <asp:BoundField DataField="Supplier_Type"           HeaderText="Supplier_Type"          SortExpression="Supplier_Type" />
                        <asp:BoundField DataField="Supplier_Name"           HeaderText="Supplier_Name"          SortExpression="Supplier_Name" />
                        <asp:BoundField DataField="Supplier_Street_Line1"   HeaderText="Supplier_Street_Line1"  SortExpression="Supplier_Street_Line1" />
                        <asp:BoundField DataField="Supplier_Street_Line2"   HeaderText="Supplier_Street_Line2"  SortExpression="Supplier_Street_Line2" />
                        <asp:BoundField DataField="Supplier_City"           HeaderText="Supplier_City"          SortExpression="Supplier_City" />
                        <asp:BoundField DataField="Supplier_State"          HeaderText="Supplier_State"         SortExpression="Supplier_State" />
                        <asp:BoundField DataField="Supplier_Zip_Code"       HeaderText="Supplier_Zip_Code"      SortExpression="Supplier_Zip_Code" />
                        <asp:BoundField DataField="Contact_First_Name"      HeaderText="Contact_First_Name"     SortExpression="Contact_First_Name" />
                        <asp:BoundField DataField="Contact_Last_Name"       HeaderText="Contact_Last_Name"      SortExpression="Contact_Last_Name" />
                        <asp:BoundField DataField="Contact_Phone"           HeaderText="Contact_Phone"          SortExpression="Contact_Phone" />
                        <asp:BoundField DataField="Contact_Email"           HeaderText="Contact_Email"          SortExpression="Contact_Email" />
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
                <a><asp:ImageButton runat="server" class="roundIcons" id="addSupplier"      src="../images/roundIcons/addIcon.png"      alt="addIcon"/></a>
                <a><asp:ImageButton runat="server" class="roundIcons" id="removeSupplier"   src="../images/roundIcons/minusIcon.png"    alt="subtractIcon" OnClientClick="return confirm('Are you sure you want to remove this supplier?');"/></a>
            </div>
        </asp:View>

        <asp:View ID="SupplierAddForm" runat="server">
            <div class="sectionContent">
            <h3>Add New Supplier </h3>
            <table>
                <tr>
                  <th>ID</th>
                  <td><asp:TextBox ID="idTB"        CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>Type</th>
                  <td><asp:TextBox ID="fNameTB"     CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>Supplier Name</th>
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
                  <th>Contact First Name</th>
                  <td><asp:TextBox ID="ssnTB"       CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>Contact Last Name</th>
                  <td><asp:TextBox ID="dobTB"       CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>Contact Phone</th>
                  <td><asp:TextBox ID="phoneTB"     CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                  <th>Contact Email</th>
                  <td><asp:TextBox ID="roleTB"      CssClass="tableCells" runat="server"></asp:TextBox></td>
                </tr>
            </table>
                <asp:ImageButton ID="cancelButton"  CssClass="formButtons" runat="server" src="../images/smallButtons/cancelIcon.png"/>
                <asp:ImageButton ID="submitButton"  CssClass="formButtons"  runat="server" src="../images/smallButtons/submitIcon.png"/>
        </div>
        </asp:View>
    </asp:MultiView>
	</section>
</asp:Content>

