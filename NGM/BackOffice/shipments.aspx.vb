Imports System.Data.SqlClient

Partial Class shipments
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        ' Make second GridView visible when user selects a shipment.
        GridView2.Visible = True
        'btnProcessShipment.Visible = True

        lblShipmentDetails.Text = "Details for Shipment ID " & GridView1.SelectedValue & ":"
    End Sub

    Protected Sub GridView2_Selected(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged
        btnProcessShipment.Visible = True
    End Sub

    Protected Sub btnProcessShipment_Click(sender As Object, e As EventArgs) Handles btnProcessShipment.Click
        Dim selectCommand As String =
            "SELECT Shipment_Type.Shipment_Type_Description 
FROM ((Shipment_Type INNER JOIN Shipment_Details ON Shipment_Type.Shipment_Type_ID = Shipment_Details.Shipment_Type_ID) 
INNER JOIN Shipment ON Shipment.Shipment_ID = Shipment_Details.Shipment_ID)
WHERE Shipment.Shipment_ID = '" & GridView1.SelectedValue & "'"
        'Dim selectCommand2 As String = "SELECT Product_QOH.Product_QOH FROM Product_QOH WHERE Product_QOH.Product_ID = '" & GridView1.SelectedRow.Cells(0).Text & "'"
        Dim updateCommand As String =
            "Update Product_QOH
set Product_QOH.Product_QOH =(SELECT Product_QOH.Product_QOH FROM Product_QOH inner join (
	SELECT Shipment_Details.Product_ID, Products.Product_Name, Shipment_Details.Quantity
    FROM (Shipment_Details 
    INNER JOIN Products ON Shipment_Details.Product_ID = Products.Product_ID)
    WHERE Shipment_Details.Shipment_ID = 2)
    sd on Product_QOH.Product_ID = sd.Product_ID
    and Product_QOH.Product_ID = '" & GridView2.SelectedRow.Cells(1).Text & "')+'" & GridView2.SelectedRow.Cells(3).Text & "' WHERE Product_ID = '" & GridView2.SelectedRow.Cells(1).Text & "'"
        Dim MyCommand As SqlCommand
        Dim MyCommand2 As SqlCommand
        Dim MyReader As SqlDataReader
        Dim MyConnection As New SqlConnection()
        MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString

        'Dim i = GridView1.SelectedRow.Cells(0).Text

        MyCommand = New SqlCommand()
        MyCommand2 = New SqlCommand()
        MyCommand.CommandText = selectCommand
        MyCommand2.CommandText = updateCommand
        MyCommand.CommandType = CommandType.Text
        MyCommand2.CommandType = CommandType.Text
        MyCommand.Connection = MyConnection
        MyCommand2.Connection = MyConnection

        Try
            MyConnection.Open()
            MyReader = MyCommand.ExecuteReader()

            'lblShipmentDetails.Text = GridView2.SelectedRow.Cells(1).Text

            If MyReader.Read() Then
                Dim results As String = MyReader.GetValue(0).ToString
                If results.Equals("Inbound") Then
                    MyCommand2.ExecuteNonQuery()
                End If
            Else
                'lbloutput.Text = "Error"
            End If
            MyConnection.Close()
        Catch ex As Exception
            'EmployeeAddForm.Visible = False
            lbloutput.Text = "Error."
        End Try

    End Sub
End Class
