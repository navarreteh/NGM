
Partial Class inventory
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        qtyAdjustView.Visible = True
        SqlDataSource2.SelectCommand = "SELECT [Product_QOH], [Kiosk_ID], [Product_ID] FROM [Product_QOH] WHERE Product_ID = '" + GridView1.SelectedValue.ToString + "'"
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            qtyAdjustView.Visible = False
        End If
    End Sub
End Class
