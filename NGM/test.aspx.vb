Public Class test
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim value = "Item 1fsdklhfksdajfklsadjflksadjfalsdfsad"
            Dim value2 = "Item 2"
            Dim value3 = "Item 3"
            Dim value4 = "Item 4"
            Dim value5 = "Item 5"


            ListBox1.Items.Add(value)
            ListBox1.Items.Add(value2)
            ListBox1.Items.Add(value3)
            ListBox1.Items.Add(value4)
            ListBox1.Items.Add(value5)

            'Button1.Visible = False
            ListBox1.Items(0).Value = "id value 1"
            ListBox1.Items(1).Value = "id value 2"
        End If



    End Sub


    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click

        Label1.Text = ListBox1.SelectedValue
        ListBox1.Items.Add("new item")
        ListBox1.Items.Remove(ListBox1.SelectedItem)


    End Sub
End Class