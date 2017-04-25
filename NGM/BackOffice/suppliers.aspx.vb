
Partial Class suppliers
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            MultiViewSupplier.SetActiveView(SupplierView)
            employeeHeader.Visible = False
            detailSection.Visible = False
        End If
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        employeeHeader.Visible = True
        detailSection.Visible = True

    End Sub


    Protected Sub cancelButton_Click(sender As Object, e As ImageClickEventArgs) Handles cancelButton.Click
        MultiViewSupplier.SetActiveView(SupplierView)
    End Sub

    Protected Sub addSupplier_Click(sender As Object, e As ImageClickEventArgs) Handles addSupplier.Click
        MultiViewSupplier.SetActiveView(SupplierAddForm)
    End Sub
End Class
