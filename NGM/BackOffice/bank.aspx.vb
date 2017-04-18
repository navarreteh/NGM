Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class bank
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim depositID = calendarDD.SelectedIndex
        Dim conn As SqlConnection
        Dim cmd As SqlCommand
        Dim cmdString As String = "SELECT [Deposit_ID] FROM [Deposit];"


        conn = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString)
        cmd = New SqlCommand(cmdString, conn)
        conn.Open()

        Dim myReader As SqlDataReader
        myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)

        calendarDD.DataTextField = "Text"
        calendarDD.DataValueField = "Value"
        calendarDD.DataSource = myReader
        calendarDD.DataBind()
        myReader.Close()
    End Sub

    'Protected Sub calendarDD_SelectedIndexChanged(sender As Object, e As EventArgs) Handles calendarDD.SelectedIndexChanged

    'End Sub

End Class