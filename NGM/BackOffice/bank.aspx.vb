Imports System.Data
Imports System.Data.SqlClient

Partial Class bank
    Inherits System.Web.UI.Page

    Dim Kiosk_ID As String

    Protected Sub calendarDD_SelectedIndexChanged(sender As Object, e As EventArgs) Handles calendarDD.SelectedIndexChanged
        Deposit_Datasource.SelectCommand = "SELECT [Deposit_ID], [Kiosk_ID], [Employee_ID], [Deposit_Date], [Deposit_Amount] FROM [Deposit] WHERE Deposit.Kiosk_ID = " + Kiosk_ID + "AND Deposit_Date = '" + calendarDD.SelectedValue.ToString + "'"
        Bank_Datasource.SelectCommand = "SELECT Bank.Bank_ID, [Bank_Name], [Bank_Street_Line1], [Bank_Street_Line2], [Bank_City], [Bank_State], [Bank_Zip_Code]
        FROM (Bank INNER JOIN Deposit ON Bank.Bank_ID = Deposit.Bank_ID) WHERE Deposit.Kiosk_ID = " + Kiosk_ID + "AND Deposit_Date = '" + calendarDD.SelectedValue.ToString + "'"
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim cookie As HttpCookie = Request.Cookies.[Get]("Kiosk_ID")
        Kiosk_ID = cookie.Value.ToString

        DD_Datasource.SelectCommand = "SELECT [Deposit_Date] FROM [Deposit] WHERE Kiosk_ID = " + Kiosk_ID
        Deposit_Datasource.SelectCommand = "SELECT [Deposit_ID], [Kiosk_ID], [Employee_ID], [Deposit_Date], [Deposit_Amount] FROM [Deposit] WHERE Deposit.Kiosk_ID = " + Kiosk_ID + " AND Deposit_Date = '" + calendarDD.SelectedValue.ToString + "'"



    End Sub
End Class