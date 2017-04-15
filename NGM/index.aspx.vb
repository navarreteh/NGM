Imports System.Data.SqlClient

Partial Class index
    Inherits System.Web.UI.Page

    Protected Sub login_submitButton_Click(sender As Object, e As ImageClickEventArgs) Handles login_submitButton.Click
        If Not IsNumeric(login_usernameTB.Text) Then
            InvalidCredLabel.Text = "Invalid Credentials"
        Else
            Dim loginID = Integer.Parse(login_usernameTB.Text)
            Dim conn As SqlConnection
            Dim cmd As SqlCommand
            Dim cmdString As String = "SELECT [Employee_Password] FROM Employee_Login WHERE (([Employee_ID] = @Username) AND ([Employee_Password] = @Password))"

            conn = New SqlConnection(ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString)
            cmd = New SqlCommand(cmdString, conn)
            cmd.Parameters.Add("@Username", SqlDbType.Int)
            cmd.Parameters("@Username").Value = loginID
            cmd.Parameters.Add("@Password", SqlDbType.VarChar, 30)
            cmd.Parameters("@Password").Value = login_passwordTB.Text
            conn.Open()

            Dim myReader As SqlDataReader = cmd.ExecuteReader()

            If myReader.Read() Then
                'Update Login Attempts
                'IF POS is close - popup/dialog to open kiosk
                'we need a field for kiosk status
                'check role


                Response.Redirect("home.aspx")
            Else
                InvalidCredLabel.Text = "Invalid Credentials"

            End If
            myReader.Close()



        End If


    End Sub

End Class