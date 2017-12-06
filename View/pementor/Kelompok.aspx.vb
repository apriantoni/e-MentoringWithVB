Imports System.Data.SqlClient
Imports System.Data
Imports System.Data.SqlClient.SqlDataReader


Partial Class View_pementor_Kelompok
    Inherits System.Web.UI.Page


    Protected Sub update_Click(sender As Object, e As EventArgs)
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String
        Dim nim1 As TextBox = KelompokFormView.FindControl("nim1")
        Dim ids As HiddenField = KelompokFormView.FindControl("ids")

        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()
        strSql = "UPDATE kelompok SET nim = '" + nim1.Text + "' WHERE id_kelompok = '" + ids.Value + "'"
        xCommand.Connection = koneksi
        xCommand.CommandText = strSql

        Dim count As Integer = xCommand.ExecuteNonQuery()

        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("Kelompok.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Kelompok.aspx")
        End If
        koneksi.Close()
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("Kelompok.aspx")
    End Sub

End Class
