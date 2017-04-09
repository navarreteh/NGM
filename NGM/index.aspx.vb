

Partial Class index
    Inherits System.Web.UI.Page

    Protected Sub login_submitButton_Click(sender As Object, e As ImageClickEventArgs) Handles login_submitButton.Click
        Response.Redirect("home.aspx")
    End Sub

End Class