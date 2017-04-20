Partial Class employees
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            MultiViewEmployees.SetActiveView(EmployeeView)
        End If

    End Sub

    Protected Sub addEmp_Click(sender As Object, e As ImageClickEventArgs) Handles addEmp.Click
        MultiViewEmployees.SetActiveView(EmployeeAddForm)
    End Sub

    Protected Sub cancelButton_Click(sender As Object, e As ImageClickEventArgs) Handles cancelButton.Click
        MultiViewEmployees.SetActiveView(EmployeeView)
    End Sub
End Class
