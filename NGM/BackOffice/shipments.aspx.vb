
Partial Class shipments
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        ' Make second GridView visible when user selects a shipment.
        GridView2.Visible = True

        lblShipmentDetails.Text = "Details for Shipment ID " & GridView1.SelectedValue & ":"
    End Sub

    Protected Sub btnProcessShipment_Click(sender As Object, e As EventArgs) Handles btnProcessShipment.Click

    End Sub
End Class
