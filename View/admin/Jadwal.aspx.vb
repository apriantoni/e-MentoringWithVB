Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader

Partial Class View_admin_Jadwal
    Inherits System.Web.UI.Page

    Protected Sub SqlDataSource1_Selecting(sender As Object, e As SqlDataSourceSelectingEventArgs) Handles SqlDataSource1.Selecting

    End Sub

    Protected Sub simpan_Click(sender As Object, e As EventArgs) Handles simpan.Click
        Dim count As Integer = KelompokSqlDataSource.Insert()
        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("Jadwal.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Jadwal.aspx")
        End If
        tanggal.Text = ""
        waktu1.Text = ""
        waktu2.Text = ""
        tempat.Text = ""
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("Jadwal.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String
        Dim pertemuanp As DropDownList = PementorFormView.FindControl("pertemuanp")
        Dim statusp As DropDownList = PementorFormView.FindControl("statusp")
        Dim tanggalp As TextBox = PementorFormView.FindControl("tanggalp")
        Dim waktu1p As TextBox = PementorFormView.FindControl("waktu1p")
        Dim waktu2p As TextBox = PementorFormView.FindControl("waktu2p")
        Dim tempatp As TextBox = PementorFormView.FindControl("tempatp")
        Dim idk As DropDownList = PementorFormView.FindControl("idkp")
        Dim idp As HiddenField = PementorFormView.FindControl("idp")

        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()
        strSql = "UPDATE jadwal SET id_kelompok = '" + idk.Text + "', pertemuan ='" + pertemuanp.Text + "', status ='" + statusp.Text + "',tanggal ='" + tanggalp.Text + "', waktu_awal ='" + waktu1p.Text + "', waktu_akhir ='" + waktu2p.Text + "',tempat ='" + tempatp.Text + "' WHERE id_jadwal = '" + idp.Value + "'"
        xCommand.Connection = koneksi
        xCommand.CommandText = strSql

        Dim count As Integer = xCommand.ExecuteNonQuery()

        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("Jadwal.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Jadwal.aspx")
        End If
        koneksi.Close()
    End Sub
End Class
