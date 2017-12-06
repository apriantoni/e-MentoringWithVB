Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader

Partial Class View_admin_amalan
    Inherits System.Web.UI.Page
    Protected Sub simpan_Click(sender As Object, e As EventArgs) Handles simpan.Click
        Dim count As Integer = KelompokSqlDataSource.Insert()
        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("amalan.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("amalan.aspx")
        End If
        id.Text = ""
        deskripsi.Text = ""
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("amalan.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String
        Dim desp As TextBox = PementorFormView.FindControl("desp")
        Dim idp As HiddenField = PementorFormView.FindControl("idp")

        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()
        strSql = "UPDATE amalan SET nama = '" + desp.Text + "' WHERE id_amalan = '" + idp.Value + "'"
        xCommand.Connection = koneksi
        xCommand.CommandText = strSql

        Dim count As Integer = xCommand.ExecuteNonQuery()

        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("amalan.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("amalan.aspx")
        End If
        koneksi.Close()
    End Sub
End Class
