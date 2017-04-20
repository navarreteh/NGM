Imports System.Data
Imports System.Data.SqlClient

Partial Class bank
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Not IsPostBack Then

                'Dim depositID = calendarDD.SelectedIndex
                Dim conn As SqlConnection
                Dim cmd As SqlCommand
                Dim cmdString As String = "SELECT [Deposit_ID] FROM [Deposit];"


                conn = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString)
                cmd = New SqlCommand(cmdString, conn)
                conn.Open()

                Dim myReader As SqlDataReader
                myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)

                'calendarDD.DataValueField = "Deposit_ID"
                'calendarDD.DataSource = myReader
                'calendarDD.DataBind()
                myReader.Close()
                conn.Close()

            End If
        Catch

        End Try

    End Sub

    'Protected Sub calendarDD_SelectedIndexChanged(sender As Object, e As EventArgs) Handles calendarDD.SelectedIndexChanged

    'End Sub

End Class