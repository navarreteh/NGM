Imports System.Data.SqlClient

Public Class reports
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


        If Not IsPostBack Then
            reportsMultiView.SetActiveView(summaryView)

            Dim dateString As String = DateTime.Now.ToLocalTime.ToString("MM/dd/yyy 00:00:00")
            Dim dateTimeString As String = DateTime.Now.ToLocalTime.ToString("MM/dd/yyyy HH:mm:ss")
            Dim dateHourString As String = DateTime.Now.ToLocalTime.AddHours(-1)

            dateDisplay.Text = DateTime.Now.ToLocalTime.ToString("MM/dd/yyy")
            timeDisplay.Text = DateTime.Now.ToLocalTime.ToString("hh:mm tt")

            Dim kioskCookie As HttpCookie = Request.Cookies.[Get]("Kiosk_ID")
            Dim kioskID As String = kioskCookie.Value.ToString



            Dim hr_Select As String = "SUM(distinct(Payment_Total)) AS SUMP, FORMAT(avg(distinct(Payment_Total)),'N','en-us') AS AVGP, SUM(Quantity)/COUNT(DISTINCT Transactions.Transaction_ID) AS UNITS, COUNT(DISTINCT Transactions.Transaction_ID) AS TRANS"
            Dim hr_From As String = "((Transactions inner join(SELECT DISTINCT Transaction_ID, Quantity From Transaction_Details) td On Transactions.Transaction_ID = td.Transaction_ID) inner Join Employee_Assignment on Transactions.Assignment_ID = Employee_Assignment.Assignment_ID)"
            Dim hr_Where As String = "Transaction_Date > '" & dateHourString & "' AND  Transaction_date < '" & dateTimeString & "' And Employee_Assignment.Kiosk_ID = " & kioskID & " Group BY Employee_Assignment.Kiosk_ID"

            Dim dr_Select As String = "SUM(distinct(Payment_Total)) AS SUMP, FORMAT(avg(distinct(Payment_Total)),'N','en-us') AS AVGP, SUM(Quantity)/COUNT(DISTINCT Transactions.Transaction_ID) AS UNITS, COUNT(DISTINCT Transactions.Transaction_ID) AS TRANS"
            Dim dr_From As String = "((Transactions inner join(SELECT DISTINCT Transaction_ID, Quantity From Transaction_Details) td On Transactions.Transaction_ID = td.Transaction_ID) inner Join Employee_Assignment on Transactions.Assignment_ID = Employee_Assignment.Assignment_ID)"
            Dim dr_Where As String = "Transaction_Date > '" & dateString & "' AND  Transaction_date < '" & dateTimeString & "' And Employee_Assignment.Kiosk_ID = " & kioskID & " Group BY Employee_Assignment.Kiosk_ID"

            Dim detail_Select As String = "SUM(payment_total) AS SUMP, FORMAT(avg(Payment_Total),'N','en-us') AS AVGP, SUM(quantity)/COUNT(t.transaction_id) AS UNITS, COUNT(DISTINCT t.transaction_id) AS TRANS"
            Dim detail_From As String = "Transactions AS t, Transaction_Details AS td"
            Dim detail_Where As String = "t.Transaction_Id = td.Transaction_Id and Transaction_Date >= '" & dateString & "' and transaction_date < dateadd(day,1,'" & dateString & "')"

            Dim hourlyReportCommand As String = "SELECT " & hr_Select & " FROM " & hr_From & " WHERE " & hr_Where
            Dim dailyReportCommand As String = "SELECT " & dr_Select & " FROM " & dr_From & " WHERE " & dr_Where
            Dim detailedReportCommand As String = "SELECT " & detail_Select & " FROM " & detail_From & " WHERE " & detail_Where


            'Hourly
            '**************************************************************************************************************************
            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlCommand
            Dim MyReader As SqlDataReader
            MyConnection = New SqlConnection()
            MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString
            MyCommand = New SqlCommand()
            Dim stringArrayHourly(3) As String
            MyCommand.CommandText = hourlyReportCommand
            MyCommand.CommandType = CommandType.Text
            MyCommand.Connection = MyConnection

            Try
                MyCommand.Connection.Open()
                MyReader = MyCommand.ExecuteReader()

                'My reader for daily report

                If MyReader.Read() Then
                    stringArrayHourly(0) = MyReader("SUMP").ToString
                    stringArrayHourly(1) = MyReader("AVGP").ToString
                    stringArrayHourly(2) = MyReader("UNITS").ToString
                    stringArrayHourly(3) = MyReader("TRANS").ToString
                End If

                For i = 0 To 3 Step 1
                    If stringArrayHourly(i) Is "" Or stringArrayHourly(i) Is Nothing Then
                        stringArrayHourly(i) = "0"

                    End If
                Next

                netSalesHourlyTB.Text = "$" & stringArrayHourly(0)
                avgHourlyTB.Text = "$" & stringArrayHourly(1)
                unitsPerHourlyTB.Text = stringArrayHourly(2)
                numTransHourlyTB.Text = stringArrayHourly(3)


                MyReader.Close()
                MyConnection.Close()

            Catch
                'Failed to connect for daily
            End Try


            'Daily
            '**************************************************************************************************************************

            Dim stringArrayDaily(3) As String
            MyCommand.CommandText = dailyReportCommand
            MyCommand.CommandType = CommandType.Text
            MyCommand.Connection = MyConnection

            Try
                MyCommand.Connection.Open()
                MyReader = MyCommand.ExecuteReader()

                'My reader for daily report

                If MyReader.Read() Then
                    stringArrayDaily(0) = MyReader("SUMP").ToString
                    stringArrayDaily(1) = MyReader("AVGP").ToString
                    stringArrayDaily(2) = MyReader("UNITS").ToString
                    stringArrayDaily(3) = MyReader("TRANS").ToString
                End If

                For i = 0 To 3 Step 1
                    If stringArrayDaily(i) Is "" Or stringArrayDaily(i) Is Nothing Then
                        stringArrayDaily(i) = "0"

                    End If
                Next

                netSalesDailyTB.Text = "$" & stringArrayDaily(0)
                avgDailyTB.Text = "$" & stringArrayDaily(1)
                unitsPerDailyTB.Text = stringArrayDaily(2)
                numTransDailyTB.Text = stringArrayDaily(3)

                MyReader.Close()
                MyConnection.Close()

            Catch
                'Failed to connect for daily
            End Try


            'Detailed
            '**************************************************************************************************************************
            Dim stringArrayDetailed(3) As String
            MyCommand.CommandText = detailedReportCommand
            MyCommand.CommandType = CommandType.Text
            MyCommand.Connection = MyConnection

            Try
                MyCommand.Connection.Open()
                MyReader = MyCommand.ExecuteReader()

                'My reader for daily report

                If MyReader.Read() Then
                    stringArrayDetailed(0) = MyReader("SUMP").ToString
                    stringArrayDetailed(1) = MyReader("AVGP").ToString
                    stringArrayDetailed(2) = MyReader("UNITS").ToString
                    stringArrayDetailed(3) = MyReader("TRANS").ToString
                End If

                For i = 0 To 3 Step 1
                    If stringArrayDaily(i) Is "" Or stringArrayDaily(i) Is Nothing Then
                        stringArrayDaily(i) = "0"

                    End If
                Next

                MyReader.Close()
                MyConnection.Close()

            Catch
                'Failed to connect for daily
            End Try


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