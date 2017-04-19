Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class index
    Inherits System.Web.UI.Page

    Protected Sub login_submitButton_Click(sender As Object, e As ImageClickEventArgs) Handles login_submitButton.Click
        Try
            If Not IsNumeric(login_usernameTB.Text) Then
                InvalidCredLabel.Text = "Invalid Credentials"
            Else
                Dim loginID = Integer.Parse(login_usernameTB.Text)
                Dim conn As SqlConnection
                Dim cmd As SqlCommand
                Dim cmdString As String = "Select [Employee_Password], Employees.Role_ID From [Employee_Login],[Employees] Where Employee_Login.Employee_ID = @Username And [Employee_Password] = @Password And Employees.Employee_ID = Employee_Login.Employee_ID;"

                '"Select [Employee_Password] From [Employee_Login] Where (([Employee_ID] = @Username) And ([Employee_Password] = @Password))"

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
                        Response.Redirect("home.aspx")
                    End If
                    ' If query fails to return results then attempted user and attempted pass were NOT found in database.
                Else
                    InvalidCredLabel.Text = "Invalid Credentials."
                End If

                myReader.Close()
            End If
        Catch
            InvalidCredLabel.Text = "Connection Error."
        End Try

    End Sub

End Class