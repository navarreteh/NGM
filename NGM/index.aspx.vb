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
                Dim cmdString As String = "Select * From [Kiosk_Login] Where Kiosk_Login_ID = @Username And [Kiosk_Login_Password] = @Password"


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

                    'InvalidCredLabel.Text = "Correct"
                    Dim c As New HttpCookie("Kiosk_ID", loginID)
                    c.Expires = DateTime.Now.AddHours(8)
                    Response.SetCookie(c)


                    Server.Transfer("home.aspx")
                    FormsAuthentication.RedirectFromLoginPage(loginID, True)

                    ' If query fails to return results then attempted user and attempted pass were NOT found in database.
                Else
                    InvalidCredLabel.Text = "Invalid Credentials"
                End If

                myReader.Close()
                conn.Close()

            End If
        Catch
            InvalidCredLabel.Text = "Connection Error."
        End Try
    End Sub

    Protected Sub header_helpIcon_Click(sender As Object, e As ImageClickEventArgs) Handles header_helpIcon.Click
        Response.Redirect("helpfromIndex.aspx")
    End Sub
End Class