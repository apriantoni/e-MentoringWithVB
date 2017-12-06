Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader

Partial Class View_pementor_requestJadwal
    Inherits System.Web.UI.Page
    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("requestJadwal.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
    End Sub

    Protected Sub simpan_Click(sender As System.Object, ByVal e As System.EventArgs) Handles simpan.Click
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String
        Dim Sql As String
        Dim id_user As String = Session("user")

        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()

        Sql = "Select * from kelompok where id_user ='" + id_user + "'"
        xCommand.Connection = koneksi
        xCommand.CommandText = Sql
        Dim idus As String = xCommand.ExecuteScalar
        
        strSql = "Insert into jadwal(id_kelompok, pertemuan, tanggal, waktu_awal, waktu_akhir, tempat, status, kategori ) values('" + idus + "','" + pertemuan.Text + "', '" + tanggal.Text + "',  '" + waktu1.Text + "',  '" + waktu2.Text + "',  '" + tempat.Text + "', 'Menunggu','mentor')"
        xCommand.Connection = koneksi
        xCommand.CommandText = strSql

        Dim count As Integer = xCommand.ExecuteNonQuery()

        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("requestJadwal.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("requestJadwal.aspx")
        End If
        koneksi.Close()
    End Sub

End Class
