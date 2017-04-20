Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class bank
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ' HANDLES POPULATION OF DROP DOWN LIST
            Dim depositID = calendarDD.SelectedIndex
            Dim conn As SqlConnection
            Dim cmd As SqlCommand
            Dim cmdString As String = "SELECT [Deposit_ID] FROM [Deposit];"


            conn = New SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString)
            cmd = New SqlCommand(cmdString, conn)
            conn.Open()

            Dim myReader As SqlDataReader
            myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection)

            calendarDD.DataSource = myReader
            calendarDD.DataValueField = "Deposit_ID"
            calendarDD.DataBind()
            myReader.Close()

            calendarDD.Items.Insert(0, New ListItem("Select"))

        End If
        ' END OF POPULATION OF DROP DOWN LIST
    End Sub

    Protected Sub calendarDD_SelectedIndexChanged(sender As Object, e As EventArgs) Handles calendarDD.SelectedIndexChanged
        If calendarDD.SelectedIndex > 0 Then
            Dim sConstr As String = ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString
            Dim Conn As New SqlConnection(sConstr)
            Dim dt As New DataTable("tbl")

            Using Conn
                Conn.Open()
                Dim comm As New SqlCommand("SELECT Deposit_ID FROM Deposit WHERE Deposit_ID=" + calendarDD.SelectedValue, Conn)
                Dim da As New SqlDataAdapter(comm)
                da.Fill(dt)
            End Using

            calendarDD.DataSource = dt
            'calendarDD.DataTextField = "Name"
            'calendarDD.DataValueField = "ID"
            ' Bind sql server data into the Dropdown List
            calendarDD.DataBind()
        Else
            calendarDD.Items.Clear()
        End If
    End Sub

End Class