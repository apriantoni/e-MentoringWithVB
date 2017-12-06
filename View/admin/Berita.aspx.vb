Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Imports FreeTextBoxControls
Imports FreeTextBoxControls.AssemblyResourceHandler

Partial Class View_admin_Berita
    Inherits System.Web.UI.Page
    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("Berita.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String
        Dim statusp As DropDownList = KelompokFormView.FindControl("statusp")
        Dim judulp As TextBox = KelompokFormView.FindControl("judulp")
        Dim isip As FreeTextBox = KelompokFormView.FindControl("isip")
        Dim id As HiddenField = KelompokFormView.FindControl("idsp")

        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()
        strSql = "UPDATE berita SET judul = '" + judulp.Text + "', isi ='" + isip.Text + "', status ='" + statusp.Text + "' WHERE id_berita = '" + id.Value + "'"
        xCommand.Connection = koneksi
        xCommand.CommandText = strSql

        Dim count As Integer = xCommand.ExecuteNonQuery()

        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("Berita.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Berita.aspx")
        End If
        koneksi.Close()
    End Sub
End Class
