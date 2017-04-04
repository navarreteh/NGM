Public Class pos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            posMultiView.SetActiveView(purchaseView)
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


End Class