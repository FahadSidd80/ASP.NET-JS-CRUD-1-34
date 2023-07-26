Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration


Public Class RegistrationForm
    Inherits System.Web.UI.Page

    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("xyz").ConnectionString)
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        DisplayGrid()
    End Sub

    Public Sub ClearTextbox()
        txtname.Text = ""
        txtcity.Text = ""
        txtsalary.Text = ""
        btnsave.Text = "Submit"

    End Sub
    Public Sub DisplayGrid()
        con.Open()
        Dim cmd As New SqlCommand("sp_Display_registration", con)
        Dim da As New SqlDataAdapter(cmd)
        Dim dt As New DataTable()
        da.Fill(dt)
        con.Close()
        grd.DataSource = dt
        grd.DataBind()
    End Sub
    Protected Sub btnsave_Click(sender As Object, e As EventArgs) Handles btnsave.Click
        If btnsave.Text = "Submit" Then
            con.Open()
            Dim cmd As New SqlCommand("sp_Insert_registration", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@name", txtname.Text)
            cmd.Parameters.AddWithValue("@city", txtcity.Text)
            cmd.Parameters.AddWithValue("@salary", txtsalary.Text)
            cmd.ExecuteNonQuery()
            con.Close()
            DisplayGrid()
            ClearTextbox()
        ElseIf btnsave.Text = "Update" Then
            con.Open()
            Dim cmd As New SqlCommand("sp_Update_registration", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@uid", ViewState("upd"))
            cmd.Parameters.AddWithValue("@name", txtname.Text)
            cmd.Parameters.AddWithValue("@city", txtcity.Text)
            cmd.Parameters.AddWithValue("@salary", txtsalary.Text)
            cmd.ExecuteNonQuery()
            con.Close()
            DisplayGrid()
            ClearTextbox()
        End If

    End Sub

    Protected Sub grd_RowCommand(sender As Object, e As GridViewCommandEventArgs)
        If e.CommandName = "Del" Then
            con.Open()
            Dim cmd As New SqlCommand("sp_Delete_registration", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@did", e.CommandArgument)
            cmd.ExecuteNonQuery()
            con.Close()
            DisplayGrid()
        ElseIf e.CommandName = "Edt" Then
            con.Open()
            Dim cmd As New SqlCommand("sp_Edit_registration", con)
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.AddWithValue("@eid", e.CommandArgument)
            Dim da As New SqlDataAdapter(cmd)
            Dim dt As New DataTable()
            da.Fill(dt)
            con.Close()
            DisplayGrid()
            txtname.Text = dt.Rows(0)("name").ToString()
            txtcity.Text = dt.Rows(0)("city").ToString()
            txtsalary.Text = dt.Rows(0)("salary").ToString()
            btnsave.Text = "Update"
            ViewState("upd") = e.CommandArgument
        End If
    End Sub


End Class