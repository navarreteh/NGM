Imports System.Data.SqlClient

Partial Class transactions
    Inherits System.Web.UI.Page

    Protected Sub Calendar1_SelectionChanged(sender As Object, e As EventArgs) Handles Calendar1.SelectionChanged
        Dim selectCommand As String =
            "SELECT Transactions.Transaction_ID, Transaction_Date, Employee_ID, Quantity, Payment_Total 
             FROM Transactions, 
             Employee_Assignment, Transaction_Details 
             WHERE Transactions.Assignment_ID = Employee_Assignment.Assignment_ID 
             AND Transactions.Transaction_ID = Transaction_Details.Transaction_ID
             AND Transaction_Date >= '" & Calendar1.SelectedDate & "' AND Transaction_Date < '" & Calendar1.SelectedDate.AddDays(1) & "'"
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

            If Not MyReader.Read() Then
                GridView1.Visible = False
                Label1.Text = "No transaction data found for " & Calendar1.SelectedDate & "."
                Label2.Visible = True
            Else
                GridView1.Visible = True
                SqlDataSource1.SelectCommand = selectCommand
                Label1.Text = ""
                Label2.Visible = True
            End If
        Catch ex As Exception
            Label1.Text = "Error."
        End Try

    End Sub
End Class
