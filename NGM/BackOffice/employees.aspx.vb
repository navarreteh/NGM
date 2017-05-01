Imports System.Data.SqlClient

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
        ' Clear textboxes.
        idLB.Text = ""
        fNameTB.Text = ""
        lNameTB.Text = ""
        stOneTB.Text = ""
        stTwoTB.Text = ""
        cityTB.Text = ""
        stateTB.Text = ""
        zipTB.Text = ""
        ssnTB.Text = ""
        dobTB.Text = ""
        phoneTB.Text = ""
        roleTB.Text = ""
        hireDateTB.Text = ""
        loginPasswordTB.Text = ""

        ' Set EmployeeView as Active View.
        MultiViewEmployees.SetActiveView(EmployeeView)
    End Sub

    Protected Sub EmployeeAddForm_Activate(sender As Object, e As EventArgs) Handles EmployeeAddForm.Activate
        ' This code allows the page to pull the most recent Employee ID number plus 1 to get the new Employee's ID generated and visible.
        Dim selectCommand As String =
            "SELECT TOP 1 Employees.Employee_ID+1
            From Employees
            ORDER BY Employees.Employee_ID DESC; "
        Dim MyCommand As SqlCommand
        Dim MyReader As SqlDataReader
        Dim MyConnection As New SqlConnection()
        MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString

        MyCommand = New SqlCommand()
        MyCommand.CommandText = selectCommand
        MyCommand.CommandType = CommandType.Text
        MyCommand.Connection = MyConnection

        Try
            MyCommand.Connection.Open()
            MyReader = MyCommand.ExecuteReader()

            If MyReader.Read() Then
                idLB.Text = MyReader.GetValue(0).ToString
            Else
                idLB.Text = "Error"
            End If
        Catch ex As Exception
            EmployeeAddForm.Visible = False
            errorLabel.Text = "Error configuration Employee ID information. Please try again."
        End Try
    End Sub

    Protected Sub submitButton_Click(sender As Object, e As ImageClickEventArgs) Handles submitButton.Click
        ' To enter a new Employee.
        If Page.IsValid Then
            Try
                Dim MyConnection As New SqlConnection()
                MyConnection.ConnectionString = ConfigurationManager.ConnectionStrings("DB_112307_ngmConnectionString").ConnectionString
                Dim passCommand As String = "INSERT INTO Employee_Login Values ('" & idLB.Text & "','" & loginPasswordTB.Text & "','0','0','0')"
                Dim selectCommand As String =
       "INSERT INTO Employees (Employee_ID,Employee_First_Name,Employee_Last_Name,Employee_Street_Line1,Employee_Street_Line2,Employee_City,Employee_State,Employee_Zip_Code,Employee_SSN,Employee_DOB,Employee_Phone,Role_ID,Employee_Hire_Date) VALUES ('" &
            idLB.Text & "','" &
       fNameTB.Text & "','" &
       lNameTB.Text & "','" &
       stOneTB.Text & "','" &
       stTwoTB.Text & "','" &
       cityTB.Text & "','" &
       stateTB.Text & "','" &
       zipTB.Text & "','" &
       ssnTB.Text & "','" &
       dobTB.Text & "','" &
       phoneTB.Text & "','" &
       roleTB.Text & "','" &
       hireDateTB.Text & "')"
                Dim MyCommand As New SqlCommand()
                Dim MyCommand2 As New SqlCommand()
                MyCommand.Connection = MyConnection
                MyCommand2.Connection = MyConnection
                MyCommand.CommandText = selectCommand
                MyCommand2.CommandText = passCommand
                MyConnection.Open()
                MyCommand.ExecuteNonQuery()
                MyCommand2.ExecuteNonQuery()
                MyConnection.Close()
                'errorLabel.Text = "Success"

                'If errorLabel.Text = "Success" Then
                ' clear all text if success
                idLB.Text = ""
                fNameTB.Text = ""
                lNameTB.Text = ""
                stOneTB.Text = ""
                stTwoTB.Text = ""
                cityTB.Text = ""
                stateTB.Text = ""
                zipTB.Text = ""
                ssnTB.Text = ""
                dobTB.Text = ""
                phoneTB.Text = ""
                roleTB.Text = ""
                hireDateTB.Text = ""
                loginPasswordTB.Text = ""
                ' toggle views

                Response.Redirect("employees.aspx")
                MultiViewEmployees.SetActiveView(EmployeeView)
                'End If

            Catch
                errorLabel.Text = "error"
            End Try

        End If
    End Sub

End Class
