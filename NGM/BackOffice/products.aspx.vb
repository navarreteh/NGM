
Partial Class products
    Inherits System.Web.UI.Page

    Protected WithEvents valProdDescrLength As Global.System.Web.UI.WebControls.CustomValidator
    Protected WithEvents valProdNameLength As Global.System.Web.UI.WebControls.CustomValidator

    Protected Sub checkProdDescrLength(ByVal source As System.Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) _
    Handles valProdDescrLength.ServerValidate
        args.IsValid = (args.Value.Length <= 50)
    End Sub

    Protected Sub checkProdNameLength(ByVal source As System.Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) _
    Handles valProdNameLength.ServerValidate
        args.IsValid = (args.Value.Length <= 20)
    End Sub

    Protected Sub btnsubmit_Click(sender As Object, e As EventArgs) Handles btnsubmit.Click

    End Sub
End Class
