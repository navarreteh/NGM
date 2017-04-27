Imports System.Data.SqlClient

Public Class home
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            homeMultiView.SetActiveView(homeLogoView)
            'Dim myOpenScript As String = "function alertOpenKiosk() {alert('Hello World')};"
            ' Page.ClientScript.RegisterClientScriptBlock(Me.GetType(), "myOpenScript", myOpenScript, True)

        End If

        'We need to check the database to see the kiosk is opened or not. 
        'By prompting an alert for them to enter kiosk number and login again for security. 
        'This will have to run everytime they are coming from the index. 


    End Sub


    Protected Sub posButton_Click(sender As Object, e As ImageClickEventArgs) Handles posButton.Click
        Dim c As New HttpCookie("DIRECT", "POS")
        c.Expires = DateTime.Now.AddSeconds(60)
        Response.SetCookie(c)
        switchViews()


    End Sub

    Protected Sub reportsButton_Click(sender As Object, e As ImageClickEventArgs) Handles reportsButton.Click
        Dim c As New HttpCookie("DIRECT", "REPORTS")
        c.Expires = DateTime.Now.AddSeconds(60)
        Response.SetCookie(c)
        switchViews()
    End Sub

    Protected Sub backOfficeButton_Click(sender As Object, e As ImageClickEventArgs) Handles backOfficeButton.Click
        Dim c As New HttpCookie("DIRECT", "BACKOFFICE")
        c.Expires = DateTime.Now.AddSeconds(60)
        Response.SetCookie(c)
        switchViews()

    End Sub

    Protected Sub closeButton_Click(sender As Object, e As ImageClickEventArgs) Handles closeButton.Click
        Dim cookie As HttpCookie = Request.Cookies.[Get]("Kiosk_ID")
        cookie.Expires = DateTime.Now.AddDays(-1)

        Dim c As New HttpCookie("DIRECT", "CLOSE")
        c.Expires = DateTime.Now.AddSeconds(60)
        Response.SetCookie(c)
        switchViews()
    End Sub

    Protected Sub onlineButton_Click(sender As Object, e As ImageClickEventArgs) Handles onlineButton.Click
        Response.Redirect("onlineorders.aspx")
    End Sub

    Protected Sub messageButton_Click(sender As Object, e As ImageClickEventArgs) Handles messageButton.Click
        switchViews()
    End Sub

    Protected Sub clockButton_Click(sender As Object, e As ImageClickEventArgs) Handles clockButton.Click
        switchViews()
    End Sub

    Protected Sub helpButton_Click(sender As Object, e As ImageClickEventArgs) Handles helpButton.Click
        Response.Redirect("help.aspx")
    End Sub

    Protected Sub searchIcon_Click(sender As Object, e As ImageClickEventArgs) Handles searchIcon.Click
        switchViews()
    End Sub



    Sub switchViews()
        If homeMultiView.GetActiveView().ID = "homeLogoView" Then
            homeMultiView.SetActiveView(homeLoginView)
        Else
            homeMultiView.SetActiveView(homeLogoView)

            login_usernameTB.Text = ""
            login_passwordTB.Text = ""
        End If
    End Sub

    Sub directToPage()

        Dim directTo As HttpCookie = Request.Cookies.[Get]("DIRECT")
        Dim directToString = directTo.Value.ToString
        InvalidCredLabel.Text = directToString


        If directToString.Equals("POS") Then
            directTo.Expires = DateTime.Now.AddDays(-1)
            Response.Redirect("pos.aspx")
        ElseIf directToString.Equals("REPORTS") Then
            directTo.Expires = DateTime.Now.AddDays(-1)
            Response.Redirect("reports.aspx")
        ElseIf directToString.Equals("BACKOFFICE") Then
            directTo.Expires = DateTime.Now.AddDays(-1)
            Response.Redirect("BackOffice/bank.aspx")
        ElseIf directToString.Equals("CLOSE") Then
            directTo.Expires = DateTime.Now.AddDays(-1)
            Response.Redirect("index.aspx")
        End If


    End Sub

    Protected Sub login_submitButton_Click(sender As Object, e As ImageClickEventArgs) Handles login_submitButton.Click

        Try
            If Not IsNumeric(login_usernameTB.Text) Then
                InvalidCredLabel.Text = "Invalid Credentials"
            Else
                Dim loginID = Integer.Parse(login_usernameTB.Text)
                Dim conn As SqlConnection
                Dim cmd As SqlCommand
                Dim cmdString As String = "Select [Employee_Password], Employees.Role_ID From [Employee_Login],[Employees] Where Employee_Login.Employee_ID = @Username And [Employee_Password] = @Password And Employees.Employee_ID = Employee_Login.Employee_ID;"

                conn = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString)
                cmd = New SqlCommand(cmdString, conn)
                cmd.Parameters.Add("@Username", SqlDbType.Int)
                cmd.Parameters("@Username").Value = loginID
                cmd.Parameters.Add("@Password", SqlDbType.VarChar, 30)
                cmd.Parameters("@Password").Value = login_passwordTB.Text
                conn.Open()

                Dim myReader As SqlDataReader
                myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)

                ' If query returns results then attempted user and attempted pass WERE found in database.
                If myReader.Read() Then
                    ' Update Employee_Login_Attempt Table
                    ' create table to hold open,close POS
                    ' add field to Kiosk Table for Kiosk Status ('active','inactive')

                    ' If resulting statement's "Role" value = 1 (lower-level op employee), deny access.
                    If myReader.Item(1) = 1 Then
                        InvalidCredLabel.Text = "Unauthorized Action"
                        ' Else, ("Role" value > 1), allow entry into system.
                    Else
                        InvalidCredLabel.Text = "Correct"
                        directToPage()
                    End If
                    ' If query fails to return results then attempted user and attempted pass were NOT found in database.
                Else
                    InvalidCredLabel.Text = "Invalid Credentials."
                End If
            End If
        Catch
            'InvalidCredLabel.Text = "Connection Error."
        End Try

    End Sub
End Class