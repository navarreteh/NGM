Imports System.Data.SqlClient

Public Class reports
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            reportsMultiView.SetActiveView(summaryView)
            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlCommand
            Dim MyReader As SqlDataReader

            MyConnection = New SqlConnection()

            MyCommand.CommandText = "SELECT SUM(payment_total), FORMAT(avg(Payment_Total),'N','en-us'), sum(quantity)/Sum(t.transaction_id), COUNT(t.transaction_id) FROM Transactions AS t, Transaction_Details AS td WHERE t.Transaction_Id = td.Transaction_Id and Transaction_Date >= '2017-04-03' and transaction_date < dateadd(day,1,'2017-04-03')"








        End If


    End Sub

    Protected Sub detailedButton_Click(sender As Object, e As ImageClickEventArgs) Handles detailedButton.Click
        If reportsMultiView.GetActiveView().ID = "summaryView" Then
            reportsMultiView.SetActiveView(detailedView)
        Else
            reportsMultiView.SetActiveView(summaryView)
        End If
    End Sub

    Protected Sub homeIcon_Click(sender As Object, e As ImageClickEventArgs) Handles homeIcon.Click
        Response.Redirect("home.aspx")
    End Sub

    Protected Sub poshelpIcon_Click(sender As Object, e As ImageClickEventArgs) Handles poshelpIcon.Click
        Response.Redirect("help.aspx")
    End Sub
End Class