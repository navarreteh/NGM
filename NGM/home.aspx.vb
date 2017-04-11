Public Class home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            homeMultiView.SetActiveView(homeLogoView)
        End If
    End Sub


    Protected Sub posButton_Click(sender As Object, e As ImageClickEventArgs) Handles posButton.Click
        Response.Redirect("pos.aspx")

    End Sub

    Protected Sub reportsButton_Click(sender As Object, e As ImageClickEventArgs) Handles reportsButton.Click
        Response.Redirect("reports.aspx")
    End Sub

    Protected Sub backOfficeButton_Click(sender As Object, e As ImageClickEventArgs) Handles backOfficeButton.Click
        Response.Redirect("BackOffice/bank.aspx")

    End Sub

    Protected Sub closeButton_Click(sender As Object, e As ImageClickEventArgs) Handles closeButton.Click
        Response.Redirect("index.aspx")
    End Sub

    Protected Sub shipmentButton_Click(sender As Object, e As ImageClickEventArgs) Handles shipmentButton.Click
        switchViews()
    End Sub

    Protected Sub messageButton_Click(sender As Object, e As ImageClickEventArgs) Handles messageButton.Click
        switchViews()
    End Sub

    Protected Sub clockButton_Click(sender As Object, e As ImageClickEventArgs) Handles clockButton.Click
        switchViews()
    End Sub

    Protected Sub helpButton_Click(sender As Object, e As ImageClickEventArgs) Handles helpButton.Click
        switchViews()
    End Sub

    Protected Sub searchIcon_Click(sender As Object, e As ImageClickEventArgs) Handles searchIcon.Click
        switchViews()
    End Sub



    Sub switchViews()
        If homeMultiView.GetActiveView().ID = "homeLogoView" Then
            homeMultiView.SetActiveView(homeLoginView)
        Else
            homeMultiView.SetActiveView(homeLogoView)
        End If
    End Sub
End Class