
Partial Class backoffice

    Inherits System.Web.UI.MasterPage

    Protected Sub bankButton_Click(sender As Object, e As ImageClickEventArgs) Handles bankButton.Click
        Response.Redirect("bank.aspx")
    End Sub
    Protected Sub employeeButton_Click(sender As Object, e As ImageClickEventArgs) Handles employeeButton.Click
        Response.Redirect("employees.aspx")
    End Sub
    Protected Sub inventoryButton_Click(sender As Object, e As ImageClickEventArgs) Handles inventoryButton.Click
        Response.Redirect("inventory.aspx")
    End Sub
    Protected Sub ordersButton_Click(sender As Object, e As ImageClickEventArgs) Handles ordersButton.Click
        Response.Redirect("orders.aspx")
    End Sub
    Protected Sub productsButton_Click(sender As Object, e As ImageClickEventArgs) Handles productsButton.Click
        Response.Redirect("products.aspx")
    End Sub
    Protected Sub suppliersButton_Click(sender As Object, e As ImageClickEventArgs) Handles suppliersButton.Click
        Response.Redirect("suppliers.aspx")
    End Sub
    Protected Sub transactionsButton_Click(sender As Object, e As ImageClickEventArgs) Handles transactionsButton.Click
        Response.Redirect("transactions.aspx")
    End Sub
    Protected Sub homeIcon_Click(sender As Object, e As ImageClickEventArgs) Handles homeIcon.Click
        Response.Redirect("../home.aspx")
    End Sub
    Protected Sub printIcon_Click(sender As Object, e As ImageClickEventArgs) Handles printIcon.Click

    End Sub
    Protected Sub poshelpIcon_Click(sender As Object, e As ImageClickEventArgs) Handles poshelpIcon.Click

    End Sub


End Class

