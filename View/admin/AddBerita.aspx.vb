Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader

Partial Class View_admin_Berita
    Inherits System.Web.UI.Page

    Protected Sub btnSimpan_Click(sender As Object, e As EventArgs) Handles btnSimpan.Click
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String

        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()
        strSql = "Insert into berita(judul, tanggal, isi, status) values('" + judul.Text + "','" + DateTime.Now.ToString() + "','" + isi.Text + "', '" + status.Text + "')"
        xCommand.Connection = koneksi
        xCommand.CommandText = strSql

        Dim count As Integer = xCommand.ExecuteNonQuery()

        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("Berita.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("AddBerita.aspx")
        End If
        koneksi.Close()
    End Sub

End Class
