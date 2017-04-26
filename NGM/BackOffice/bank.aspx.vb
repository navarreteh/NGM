Imports System.Data
Imports System.Data.SqlClient

Partial Class bank
    Inherits System.Web.UI.Page

    Dim Kiosk_ID As String

    Protected Sub calendarDD_SelectedIndexChanged(sender As Object, e As EventArgs) Handles calendarDD.SelectedIndexChanged
        Bank_Datasource.SelectCommand = "SELECT [Deposit_ID], [Employee_ID], [Deposit_Amount], [Kiosk_ID] FROM [Deposit] WHERE Deposit_Date = '" + calendarDD.SelectedValue.ToString + "'"
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim cookie As HttpCookie = Request.Cookies.[Get]("Kiosk_ID")
        Kiosk_ID = cookie.Value.ToString
    End Sub
End Class