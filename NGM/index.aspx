<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="index.aspx.vb" Inherits="NGM.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>NGM - Login </title>
    <meta charset="utf-8"/>
    <link href="styleSheet/styleSheetIndex.css" rel="stylesheet" type="text/css"/>
</head>
<body>
 <form runat="server">
 <header>
     <div id="headerContainer">
 	    <asp:ImageButton runat="server" type="image" class="headerButtons" id="header_helpIcon" src="images/headerIcons/helpIcon.png"/>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    </div>
 </header>
<div id="loginOverlay">
	<img id="loginLogo" src="images/logos/logo_Small.png" width="287" height="292" alt="Logo"/><br/>
	
    <div id="index_loginForm"> 
        <img src="images/banners/kioskLoginBanner.png" alt="" width="310" height="50" class="loginBanner"/>  
        <img class="roundIcons" id="userIcon" src="images/roundIcons/userIcon.png" alt="userIcon"/>
	    <asp:TextBox class="textBoxes" autofocus="true" type="text" name="textfield" id="login_usernameTB" runat="server" required="true"/><br/>
	    <img class="roundIcons"  id="passwordIcon" src ="images/roundIcons/passwordIcon.png" alt=""/>
	    <asp:TextBox class="textBoxes" type="text" name="textfield2" id="login_passwordTB" runat="server" required="true"/><br/>
	    <asp:ImageButton class="formButtons" type="image" name="sumbitIcon" id="login_submitButton" src="images/smallButtons/submitIcon.png" runat="server"/>
    </div>
<footer id="login_footer">
	<p id="companyName">&copy; New Generation Merchandising</p>
</footer>
</div>
</form>

</body>
</html>
<asp:sqldatasource runat="server" ConnectionString="<%$ ConnectionStrings:DB_112307_ngmConnectionString %>" SelectCommand="Select Employee_Login.Employee_ID, Employee_Password, Employee_First_Name, Employees.Role_ID
From Employee_Login, Employees
Where Employee_Login.Employee_ID = Employees.Employee_ID
And Employee_Login.Employee_ID = @empID
And Employee_Password = @empPass;">
    <SelectParameters>
        <asp:ControlParameter ControlID="login_usernameTB" Name="empID" PropertyName="Text" />
        <asp:ControlParameter ControlID="login_passwordTB" Name="empPass" PropertyName="Text" />
    </SelectParameters>
</asp:sqldatasource>
