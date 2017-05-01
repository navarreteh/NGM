Imports System.Data
Imports System.Data.SqlClient
Imports System.Web

Partial Class bank
    Inherits System.Web.UI.Page

    Protected Sub DetailsView2_ItemInserting(sender As Object, e As DetailsViewInsertEventArgs) Handles DetailsView2.ItemInserting
        ' This code allows the page to pull the most recent Bank ID number plus 1 to get the new Bank's ID generated and visible.
        Dim selectCommand As String =
            "SELECT TOP 1 Bank.Bank_ID+1
            From Bank
            ORDER BY Bank.Bank_ID DESC; "
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
                lblInsertBankID.Text = MyReader.GetValue(0).ToString
            Else
                lblInsertBankID.Text = "Error"
            End If
        Catch ex As Exception
            'EmployeeAddForm.Visible = False
            'errorLabel.Text = "Error configuration Employee ID information. Please try again."
        End Try
    End Sub

    Protected Sub DetailsView2_ItemCreated(sender As Object, e As EventArgs) Handles DetailsView2.ItemCreated

    End Sub
End Class