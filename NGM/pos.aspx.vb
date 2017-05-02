Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class pos
    Inherits System.Web.UI.Page

    Const taxVar As Double = 0.095

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        posMultiView.SetActiveView(purchaseView)
        If Not IsPostBack Then
            purchaseList.Visible = False
            purchasePriceLB.Visible = False

            returnList.Visible = False
            returnPriceLB.Visible = False


            addBar.Focus()
            DeleteButton.Visible = False
            DeleteRButton.Visible = False
            Dim c As New HttpCookie("Counter", "0")
            c.Expires = DateTime.Now.AddHours(1)
            Response.Cookies.Add(c)

            Dim c2 As New HttpCookie("CounterReturn", "0")
            c2.Expires = DateTime.Now.AddHours(1)
            Response.Cookies.Add(c2)

        End If
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

                If posMultiView.ActiveViewIndex.Equals(0) Or posMultiView.ActiveViewIndex.Equals(2) Then
                    DeleteButton.Visible = True
                    purchaseList.Items.Add(Item)
                    purchasePriceLB.Items.Add(ItemP)
                    purchaseList.Visible = True

                    newCounter += 1
                    Response.Cookies("Counter").Value = newCounter.ToString



                ElseIf posMultiView.ActiveViewIndex.Equals(1) Then
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

    Protected Sub DeleteRButton_Click(sender As Object, e As EventArgs) Handles DeleteButton.Click

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


    Protected Sub updateTotal(counter As Integer, counterReturns As Integer)
        Dim purchaseTotalVar As Decimal = 0
        Dim returnTotalVar As Decimal = 0
        Dim subTotalVar As Decimal = 0
        Dim taxTotalVar As Decimal = 0
        Dim totalVar As Decimal = 0

        If counter > 0 Then
            For c As Integer = 1 To (counter)
                SqlDataSource1.FilterParameters.Clear()
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

        purchaseTotalVar = Math.Round(purchaseTotalVar, 2, MidpointRounding.AwayFromZero)
        subTotalVar = Math.Round(subTotalVar, 2, MidpointRounding.AwayFromZero)
        taxTotalVar = Math.Round(taxTotalVar, 2, MidpointRounding.AwayFromZero)
        totalVar = Math.Round(totalVar, 2, MidpointRounding.AwayFromZero)


        purchaseTotal.Text = "$" + purchaseTotalVar.ToString
        returnTotal.Text = "$" + returnTotalVar.ToString
        subTotal.Text = "$" + subTotalVar.ToString
        tax.Text = "$" + taxTotalVar.ToString
        total.Text = "$" + totalVar.ToString


    End Sub



End Class