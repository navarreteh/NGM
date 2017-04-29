
Partial Class inventory
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        qtyAdjustView.Visible = True
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            qtyAdjustView.Visible = False
            GridView1.AutoGenerateSelectButton = True

        End If
    End Sub

End Class
