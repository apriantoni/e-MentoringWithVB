Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader


Partial Class View_admin_Kelompok
    Inherits System.Web.UI.Page
    
    Protected Sub simpan_Click(sender As Object, e As EventArgs) Handles simpan.Click
        Dim count As Integer = KelompokSqlDataSource.Insert()
        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("Kelompok.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Kelompok.aspx")
        End If
        nama.Text = ""
        id.Text = ""
    End Sub

    Protected Sub update_Click(sender As Object, e As EventArgs)
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String
        Dim nama2 As TextBox = KelompokFormView.FindControl("nama2")
        Dim mentor2 As DropDownList = KelompokFormView.FindControl("mentor2")
        Dim ids As HiddenField = KelompokFormView.FindControl("ids")

        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()
        strSql = "UPDATE kelompok SET nama_kelompok = '" + nama2.Text + "', id_user ='" + mentor2.Text + "' WHERE id_kelompok = '" + ids.Value + "'"
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
