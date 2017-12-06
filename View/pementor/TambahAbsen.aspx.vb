Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader

Partial Class View_pementor_TambahAbsen
    Inherits System.Web.UI.Page
    Protected Sub simpan_Click(sender As Object, e As EventArgs) Handles simpan.Click
        Dim count As Integer = KelompokSqlDataSource.Insert()
        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("Jadwal.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Jadwal.aspx")
        End If
        keterangan.Text = ""
    End Sub

    
End Class
