Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Public Class pos
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        posMultiView.SetActiveView(purchaseView)
        If Not IsPostBack Then
            Dim constr As String = ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString
            Using con As New SqlConnection(constr)
                Using cmd As New SqlCommand("SELECT * from Category")
                    cmd.CommandType = CommandType.Text
                    cmd.Connection = con
                    con.Open()
                    CategoriesDD.DataSource = cmd.ExecuteReader()
                    CategoriesDD.DataTextField = "Category_Name"
                    CategoriesDD.DataValueField = "Category_ID"
                    CategoriesDD.DataBind()
                    con.Close()
                End Using
            End Using
            CategoriesDD.Items.Insert(0, New ListItem("--Select Category--", "0"))
        End If
    End Sub

    Protected Sub CategoriesDD_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        Dim CategoryID As Integer = Convert.ToInt32(CategoriesDD.SelectedValue.ToString())
        FillProducts(CategoryID)
    End Sub


    Private Sub FillProducts(ByVal categoryID As Integer)
        Dim strConn As String = ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString
        Dim con As New SqlConnection(strConn)
        Dim cmd As New SqlCommand()
        cmd.Connection = con
        cmd.CommandType = CommandType.Text
        cmd.CommandText = "Select * from Products where Category_ID =@categoryID"
        cmd.Parameters.AddWithValue("@categoryID", categoryID)
        Dim objDs As New DataSet()
        Dim dAdapter As New SqlDataAdapter()
        dAdapter.SelectCommand = cmd
        con.Open()
        dAdapter.Fill(objDs)
        con.Close()
        If objDs.Tables(0).Rows.Count > 0 Then
            ProductsDD.DataSource = objDs.Tables(0)
            ProductsDD.DataTextField = "Product_Description"
            ProductsDD.DataValueField = "Product_ID"
            ProductsDD.DataBind()
            ProductsDD.Items.Insert(0, "--Select--")
        Else
        End If
    End Sub


    Protected Sub ProductsDD_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
        SqlDataSource1.SelectCommand = "SELECT * FROM Products where Category_ID = '" & CategoriesDD.SelectedValue.ToString() & "'"
        ProductDetails.PageIndex = ProductsDD.SelectedIndex
    End Sub
    Protected Sub checkoutButton_Click(sender As Object, e As ImageClickEventArgs) Handles checkoutButton.Click
        posMultiView.SetActiveView(paymentView)
    End Sub


    '--------------------------------------------------------------------------------------------------------------------------
    'PurchaseView
    '--------------------------------------------------------------------------------------------------------------------------
    Protected Sub purchaseBannerPurchase_Click(sender As Object, e As ImageClickEventArgs) Handles purchaseBannerPurchase.Click
        posMultiView.SetActiveView(purchaseView)
    End Sub
    Protected Sub returnBannerPurchase_Click(sender As Object, e As ImageClickEventArgs) Handles returnBannerPurchase.Click
        posMultiView.SetActiveView(returnView)
    End Sub
    Protected Sub paymentBannerPurchase_Click(sender As Object, e As ImageClickEventArgs) Handles paymentBannerPurchase.Click
        posMultiView.SetActiveView(paymentView)
    End Sub

    '--------------------------------------------------------------------------------------------------------------------------
    'ReturnView
    '--------------------------------------------------------------------------------------------------------------------------

    Protected Sub purchaseBannerReturn_Click(sender As Object, e As ImageClickEventArgs) Handles purchaseBannerReturn.Click
        posMultiView.SetActiveView(purchaseView)
    End Sub
    Protected Sub returnBannerReturn_Click(sender As Object, e As ImageClickEventArgs) Handles returnBannerReturn.Click
        posMultiView.SetActiveView(returnView)
    End Sub
    Protected Sub paymentBannerReturn_Click(sender As Object, e As ImageClickEventArgs) Handles paymentBannerReturn.Click
        posMultiView.SetActiveView(paymentView)
    End Sub


    '--------------------------------------------------------------------------------------------------------------------------
    'PaymentView
    '--------------------------------------------------------------------------------------------------------------------------
    Protected Sub purchaseBannerPayment_Click(sender As Object, e As ImageClickEventArgs) Handles purchaseBannerPayment.Click
        posMultiView.SetActiveView(purchaseView)
    End Sub
    Protected Sub retunrBannerPayment_Click(sender As Object, e As ImageClickEventArgs) Handles returnBannerPayment.Click
        posMultiView.SetActiveView(returnView)
    End Sub
    Protected Sub paymentBannerPayment_Click(sender As Object, e As ImageClickEventArgs) Handles paymentBannerPayment.Click
        posMultiView.SetActiveView(paymentView)
    End Sub


    Protected Sub pos_voidIcon_Click(sender As Object, e As ImageClickEventArgs) Handles pos_voidIcon.Click
        Response.Redirect("home.aspx")
    End Sub

    Protected Sub poshelpIcon_Click(sender As Object, e As ImageClickEventArgs) Handles poshelpIcon.Click
        Response.Redirect("help.aspx")
    End Sub

End Class