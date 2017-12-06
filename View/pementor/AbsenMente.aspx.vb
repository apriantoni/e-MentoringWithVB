Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader

Partial Class View_pementor_AbsenMente
    Inherits System.Web.UI.Page

    Protected Sub simpan_Click(sender As Object, e As EventArgs) Handles simpan.Click
        Dim count As Integer = KelompokSqlDataSource.Insert()
        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("AbsenMente.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("AbsenMente.aspx")
        End If
        keterangan.Text = ""
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("AbsenMente.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String
        Dim pertemuanp As DropDownList = PementorFormView.FindControl("pertemuanp")
        Dim statusp As DropDownList = PementorFormView.FindControl("statusp")
        Dim kelompokp As DropDownList = PementorFormView.FindControl("kelompokp")
        Dim keteranganp As TextBox = PementorFormView.FindControl("keteranganp")
        Dim idp As HiddenField = PementorFormView.FindControl("idp")

        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()
        strSql = "UPDATE absensi SET id_jadwal = '" + pertemuanp.Text + "', status ='" + statusp.Text + "', keterangan ='" + keteranganp.Text + "' WHERE id_absen = '" + idp.Value + "'"
        xCommand.Connection = koneksi
        xCommand.CommandText = strSql

        Dim count As Integer = xCommand.ExecuteNonQuery()

        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("AbsenMente.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("AbsenMente.aspx")
        End If
        koneksi.Close()
    End Sub
End Class
