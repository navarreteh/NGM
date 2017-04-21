Imports System.Data
Imports System.Data.SqlClient

Partial Class bank
    Inherits System.Web.UI.Page
    Protected Sub calendarDD_SelectedIndexChanged(sender As Object, e As EventArgs) Handles calendarDD.SelectedIndexChanged
        SqlDataSource2.SelectCommand = "SELECT [Deposit_ID], [Employee_ID], [Deposit_Amount], [Kiosk_ID] FROM [Deposit] WHERE Deposit_Date = '" + calendarDD.SelectedValue.ToString + "'"
    End Sub


End Class