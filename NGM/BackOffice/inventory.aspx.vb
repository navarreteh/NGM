Imports System.Data.SqlClient

Partial Class inventory
    Inherits System.Web.UI.Page
    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        qtyAdjustView.Visible = True
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            qtyAdjustView.Visible = False
            GridView1.AutoGenerateSelectButton = True
        End If
        lblout.Text = ""
    End Sub

    Protected Sub Edit_Click(sender As Object, e As EventArgs) Handles qtyAdjustView.ItemUpdated
        ' "Refreshes" GridView1's data, so new Product_QOH will be reflected.
        GridView1.DataBind()



        Dim productID As Integer = GridView1.SelectedValue
        Dim cookie As HttpCookie = Request.Cookies.Get("Kiosk_ID")
        Dim kioskID As Integer = cookie.Value.ToString
        Dim selectCommand As String = "SELECT [Product_QOH], [Kiosk_ID], [Product_ID], [Restock_Alert] FROM [Product_QOH] WHERE [Kiosk_ID] = '" & kioskID & "' AND [Product_ID] = '" & productID & "'"
        Dim MyCommand As SqlCommand
        Dim MyReader As SqlDataReader
        Dim MyConnection As New SqlConnection()
        MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString

        MyCommand = New SqlCommand()
        MyCommand.CommandText = selectCommand
        MyCommand.CommandType = CommandType.Text
        MyCommand.Connection = MyConnection

        Try
            MyCommand.Connection.Open()
            MyReader = MyCommand.ExecuteReader()

            If MyReader.Read() Then
                If MyReader.GetValue(3).ToString = "True" Then
                    lblout.Text = "Alert! Low quantity on hand of Product ID: " & MyReader.GetValue(2).ToString
                End If
                'lblout.Text = MyReader.GetValue(3).ToString
            Else
                lblout.Text = "Value does not exist"
            End If
        Catch ex As Exception
            'EmployeeAddForm.Visible = False
            lblout.Text = "Error with connection"
        End Try
    End Sub


End Class
