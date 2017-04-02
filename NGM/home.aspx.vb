Public Class home
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            homeMultiView.SetActiveView(homeLogoView)
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If homeMultiView.GetActiveView().ID = "homeLogoView" Then
            homeMultiView.SetActiveView(homeLoginView)
        Else
            homeMultiView.SetActiveView(homeLogoView)
        End If
    End Sub
End Class