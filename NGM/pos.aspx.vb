Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class pos
    Inherits System.Web.UI.Page

    Const taxVar As Double = 0.095

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            posMultiView.SetActiveView(purchaseView)
            purchaseList.Visible = False
            purchasePriceLB.Visible = False

            returnList.Visible = False
            returnPriceLB.Visible = False


            addBar.Focus()
            DeleteButton.Visible = False
            DeleteRButton.Visible = False
            Dim c As New HttpCookie("Counter", "0")
            c.Expires = DateTime.Now.ToLocalTime.AddHours(1)
            Response.Cookies.Add(c)

            Dim c2 As New HttpCookie("CounterReturn", "0")
            c2.Expires = DateTime.Now.ToLocalTime.AddHours(1)
            Response.Cookies.Add(c2)

            Dim empCookie As HttpCookie = Request.Cookies.[Get]("Emp_ID")

            employeeDisplay.Text = "Employee ID: " + empCookie.Value.ToString

            paymentInputContainer.Visible = False


            Dim cP As New HttpCookie("Payment", "null")
            cP.Expires = DateTime.Now.ToLocalTime.AddHours(1)

        End If
        dateDisplay.Text = DateTime.Now.ToLocalTime.ToString("MM/dd/yyy")
        timeDisplay.Text = DateTime.Now.ToLocalTime.ToString("hh:mm tt")
    End Sub



    Protected Sub checkoutButton_Click(sender As Object, e As ImageClickEventArgs) Handles checkoutButton.Click
        posMultiView.SetActiveView(paymentView)
    End Sub


    '--------------------------------------------------------------------------------------------------------------------------
    'PurchaseView
    '--------------------------------------------------------------------------------------------------------------------------
    Protected Sub purchaseBannerPurchase_Click(sender As Object, e As ImageClickEventArgs) Handles purchaseBannerPurchase.Click
        posMultiView.SetActiveView(purchaseView)
    End Sub
    Protected Sub returnBannerPurchase_Click(sender As Object, e As ImageClickEventArgs) Handles returnBannerPurchase.Click
        posMultiView.SetActiveView(returnView)
    End Sub
    Protected Sub paymentBannerPurchase_Click(sender As Object, e As ImageClickEventArgs) Handles paymentBannerPurchase.Click
        posMultiView.SetActiveView(paymentView)
    End Sub

    '--------------------------------------------------------------------------------------------------------------------------
    'ReturnView
    '--------------------------------------------------------------------------------------------------------------------------

    Protected Sub purchaseBannerReturn_Click(sender As Object, e As ImageClickEventArgs) Handles purchaseBannerReturn.Click
        posMultiView.SetActiveView(purchaseView)
    End Sub
    Protected Sub returnBannerReturn_Click(sender As Object, e As ImageClickEventArgs) Handles returnBannerReturn.Click
        posMultiView.SetActiveView(returnView)
    End Sub
    Protected Sub paymentBannerReturn_Click(sender As Object, e As ImageClickEventArgs) Handles paymentBannerReturn.Click
        posMultiView.SetActiveView(paymentView)
    End Sub


    '--------------------------------------------------------------------------------------------------------------------------
    'PaymentView
    '--------------------------------------------------------------------------------------------------------------------------
    Protected Sub purchaseBannerPayment_Click(sender As Object, e As ImageClickEventArgs) Handles purchaseBannerPayment.Click
        posMultiView.SetActiveView(purchaseView)
    End Sub
    Protected Sub retunrBannerPayment_Click(sender As Object, e As ImageClickEventArgs) Handles returnBannerPayment.Click
        posMultiView.SetActiveView(returnView)
    End Sub
    Protected Sub paymentBannerPayment_Click(sender As Object, e As ImageClickEventArgs) Handles paymentBannerPayment.Click
        posMultiView.SetActiveView(paymentView)
    End Sub


    Protected Sub pos_voidIcon_Click(sender As Object, e As ImageClickEventArgs) Handles pos_voidIcon.Click
        Response.Redirect("home.aspx")
    End Sub

    Protected Sub poshelpIcon_Click(sender As Object, e As ImageClickEventArgs) Handles poshelpIcon.Click
        Response.Redirect("help.aspx")
    End Sub

    Protected Sub addIcon_Click(sender As Object, e As ImageClickEventArgs) Handles addIcon.Click
        Dim productID = addBar.Text
        SqlDataSource1.FilterParameters.Clear()

        If IsNumeric(productID) Then
            Dim idControl As ControlParameter = New ControlParameter("ProductID", "addBar", "Text")
            SqlDataSource1.FilterExpression = "Product_ID = '{0}'"
            SqlDataSource1.FilterParameters.Add(idControl)

            Dim dv As DataView = SqlDataSource1.Select(DataSourceSelectArguments.Empty)
            If dv.Count > 0 Then

                Dim id As String = dv.Item(0).Row(0).ToString
                Dim name As String = dv.Item(0).Row(2).ToString
                Dim desc As String = dv.Item(0).Row(1).ToString
                Dim price As String = dv.Item(0).Row(3).ToString

                Dim cookie As HttpCookie = Request.Cookies.[Get]("Counter")
                Dim counter As Integer = Integer.Parse(cookie.Value)
                Dim newCounter As Integer = counter

                Dim cookieR As HttpCookie = Request.Cookies.[Get]("CounterReturn")
                Dim counterReturn As Integer = Integer.Parse(cookieR.Value)
                Dim newCounterReturns As Integer = counterReturn

                Dim control As New LiteralControl
                control.Equals("<b>")

                Dim record As String = "ID:" + id + " - NAME: " + name + " - DESCRIPTION: " + desc + " - PRICE: " + price

                Dim Item As ListItem = New ListItem(record, id)
                Dim ItemP As ListItem = New ListItem(price, id)

                If posMultiView.GetActiveView().ID = "purchaseView" Or posMultiView.GetActiveView().ID = "paymentView" Then
                    DeleteButton.Visible = True
                    purchaseList.Items.Add(Item)
                    purchasePriceLB.Items.Add(ItemP)
                    purchaseList.Visible = True

                    newCounter += 1
                    Response.Cookies("Counter").Value = newCounter.ToString


                ElseIf posMultiView.GetActiveView().ID = "returnView" Then
                    DeleteRButton.Visible = True
                    returnList.Items.Add(Item)
                    returnPriceLB.Items.Add(ItemP)
                    returnList.Visible = True

                    newCounterReturns += 1
                    Response.Cookies("CounterReturn").Value = newCounterReturns.ToString


                End If
                updateTotal(newCounter, newCounterReturns)
                addBar.Text = ""
            Else
                addBar.Text = "No Item Found"
            End If
            addBar.Focus()
        Else
            addBar.Text = "Invalid Input"
        End If



    End Sub

    Protected Sub DeleteButton_Click(sender As Object, e As EventArgs) Handles DeleteButton.Click

        If purchaseList.SelectedIndex > -1 Then

            Dim cookie As HttpCookie = Request.Cookies.[Get]("Counter")
            Dim counter As Integer = Integer.Parse(cookie.Value)
            Dim newCounter As Integer = (counter - 1)
            Response.Cookies("Counter").Value = newCounter.ToString

            Dim cookieR As HttpCookie = Request.Cookies.[Get]("CounterReturn")
            Dim counterReturn As Integer = Integer.Parse(cookieR.Value)

            Dim index As Integer = purchaseList.SelectedIndex
            purchaseList.Items.Remove(purchaseList.SelectedItem)
            purchasePriceLB.Items.Remove(purchasePriceLB.Items(index))

            updateTotal(newCounter, counterReturn)

            If newCounter = 0 Then
                DeleteButton.Visible = False
            End If
        End If

    End Sub

    Protected Sub DeleteRButton_Click(sender As Object, e As EventArgs) Handles DeleteRButton.Click

        If returnList.SelectedIndex > -1 Then

            Dim cookie As HttpCookie = Request.Cookies.[Get]("Counter")
            Dim counter As Integer = Integer.Parse(cookie.Value)

            Dim cookieR As HttpCookie = Request.Cookies.[Get]("CounterReturn")
            Dim counterReturn As Integer = Integer.Parse(cookieR.Value)
            Dim newCounterReturn As Integer = (counterReturn - 1)
            Response.Cookies("CounterReturn").Value = newCounterReturn.ToString

            Dim index As Integer = returnList.SelectedIndex
            returnList.Items.Remove(returnList.SelectedItem)
            returnPriceLB.Items.Remove(returnPriceLB.Items(index))

            updateTotal(counter, newCounterReturn)

            If newCounterReturn = 0 Then
                DeleteRButton.Visible = False
            End If
        End If

    End Sub


    Protected Sub updateTotal(counter As Integer, counterReturns As Integer)
        Dim purchaseTotalVar As Decimal = 0
        Dim subTotalVar As Decimal = 0
        Dim taxTotalVar As Decimal = 0
        Dim totalVar As Decimal = 0

        Dim returnTotalVar As Decimal = 0
        Dim subTotalRVar As Decimal = 0
        Dim taxTotalRVar As Decimal = 0
        Dim totalRVar As Decimal = 0


        If counter > 0 Then
            For c As Integer = 1 To (counter)
                Dim index As Integer = c - 1
                Dim id As String = purchaseList.Items(index).Value
                Dim price As Double = purchasePriceLB.Items(index).Text
                Dim purchasePrice As Double = Double.Parse(purchasePriceLB.Items(index).Text.ToString())
                purchaseTotalVar += purchasePrice
                subTotalVar += purchasePrice
                taxTotalVar += (purchasePrice * taxVar)

            Next
            totalVar += (subTotalVar + taxTotalVar)
        End If

        If counterReturns > 0 Then
            For c As Integer = 1 To (counterReturns)
                Dim index As Integer = c - 1
                Dim id As String = returnList.Items(index).Value
                Dim price As Double = returnPriceLB.Items(index).Text
                Dim returnPrice As Double = Double.Parse(returnPriceLB.Items(index).Text.ToString())
                returnTotalVar += returnPrice
                subTotalRVar += returnPrice
                taxTotalRVar += (returnPrice * taxVar)

            Next
            totalRVar += (subTotalRVar + taxTotalRVar)
        End If





        purchaseTotalVar = Math.Round(purchaseTotalVar, 2, MidpointRounding.AwayFromZero)
        returnTotalVar = Math.Round(-(returnTotalVar), 2, MidpointRounding.AwayFromZero)
        subTotalVar = Math.Round((subTotalVar - subTotalRVar), 2, MidpointRounding.AwayFromZero)
        taxTotalVar = Math.Round((taxTotalVar - taxTotalRVar), 2, MidpointRounding.AwayFromZero)
        totalVar = Math.Round((totalVar - totalRVar), 2, MidpointRounding.AwayFromZero)


        purchaseTotal.Text = "$" + purchaseTotalVar.ToString

        If returnTotalVar < 0 Then
            returnTotal.Text = "-$" + (-returnTotalVar).ToString
            returnTB.Attributes.Add("style", "color:red")
        Else
            returnTotal.Text = "$" + returnTotalVar.ToString
            returnTB.Attributes.Add("style", "color:#29456D")
        End If

        If subTotalVar < 0 Then
            subTotal.Text = "-$" + (-subTotalVar).ToString
            subTotalTB.Attributes.Add("style", "color:red")
        Else
            subTotal.Text = "$" + subTotalVar.ToString
            subTotalTB.Attributes.Add("style", "color:#29456D")
        End If

        If taxTotalVar < 0 Then
            tax.Text = "-$" + (-taxTotalVar).ToString
            taxTB.Attributes.Add("style", "color:red")
        Else
            tax.Text = "$" + taxTotalVar.ToString
            taxTB.Attributes.Add("style", "color:#29456D")
        End If

        If totalVar < 0 Then
            total.Text = "-$" + (-totalVar).ToString
            totalTB.Attributes.Add("style", "color:red")
        Else
            total.Text = "$" + totalVar.ToString
            totalTB.Attributes.Add("style", "color:#29456D")
        End If




    End Sub




    Protected Sub searchIcon_Click(sender As Object, e As ImageClickEventArgs) Handles searchIcon.Click


        Dim searchText As String = (searchBar.Text).Trim
        If searchText IsNot "" Then

            Dim MyConnection As SqlConnection
            Dim MyCommand As SqlCommand
            Dim MyReader As SqlDataReader
            MyConnection = New SqlConnection()
            MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString
            MyCommand = New SqlCommand()
            MyCommand.CommandText = "SELECT Products.Product_ID AS Product_ID, Product_Name AS Product_Name, Products.Category_ID AS Category_ID, Product_QOH AS Product_QOH, Kiosk_ID FROM (Products INNER JOIN Product_QOH ON Products.Product_ID = Product_QOH.Product_ID) WHERE Products.Product_ID LIKE '" & searchText & "%' OR Product_Name LIKE '" & searchText & "%' OR Product_Description LIKE '" & searchText & "%'"
            MyCommand.CommandType = CommandType.Text
            MyCommand.Connection = MyConnection

            Try
                MyCommand.Connection.Open()
                MyReader = MyCommand.ExecuteReader()

                If Not MyReader.HasRows Then
                    searchBar.Text = "No matching results found"
                End If

                While MyReader.Read()
                    Dim record As New Label

                    Dim productID As String = MyReader("Product_ID").ToString
                    Dim productName As String = MyReader("Product_Name").ToString
                    Dim productCat As String = MyReader("Category_ID").ToString
                    Dim productQty As String = MyReader("Product_QOH").ToString
                    Dim productLoc As String = MyReader("Kiosk_ID").ToString

                    Dim recordString As String = "Product ID: " + productID + " | Name: " + productName + " | Cat: " + productCat + " | QTY: " + productQty + " | Kiosk ID: " + productLoc
                    record.Text = recordString
                    searchResults.Controls.Add(record)
                    searchResults.Controls.Add(New LiteralControl("<br />"))

                End While

                MyReader.Close()
                MyConnection.Close()

            Catch
                'Failed to connect for daily
                searchBar.Text = "Connection Error - Try Again"

            End Try

            'searchResults.Controls.Clear()

        Else searchBar.Text = ""

        End If

    End Sub


    Protected Sub cashButton_Click(sender As Object, e As ImageClickEventArgs) Handles cashButton.Click
        paymentInputContainer.Visible = True
        Response.Cookies("Payment").Value = "cash"
        paymentTB.Text = ""

    End Sub

    Protected Sub cardButton_Click(sender As Object, e As ImageClickEventArgs) Handles cardButton.Click
        paymentInputContainer.Visible = True
        Response.Cookies("Payment").Value = "card"
        paymentTB.Text = ""
    End Sub

    Protected Sub submit_Click(sender As Object, e As ImageClickEventArgs) Handles submit.Click

    End Sub
End Class