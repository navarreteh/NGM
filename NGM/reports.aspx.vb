Public Class reports
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            reportsMultiView.SetActiveView(summaryView)
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
End Class