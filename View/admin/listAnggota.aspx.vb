Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader

Partial Class View_admin_listAnggota
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("listAnggota.aspx")
    End Sub

    Protected Sub update_Click(sender As Object, e As EventArgs)
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String

        Dim idp As HiddenField = KelompokFormView.FindControl("idp")
        Dim nimp As HiddenField = KelompokFormView.FindControl("nimp")
        Dim statusp As DropDownList = KelompokFormView.FindControl("statusp")
        Dim kelompokp As DropDownList = KelompokFormView.FindControl("kelompokp")

        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()
        strSql = "UPDATE angkel SET nim = '" + nimp.Value + "',status='" + statusp.Text + "', id_kelompok='" + kelompokp.Text + "' WHERE id = '" + idp.Value + "'"
        xCommand.Connection = koneksi
        xCommand.CommandText = strSql

        Dim count As Integer = xCommand.ExecuteNonQuery()

        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("listAnggota.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("listAnggota.aspx")
        End If
        koneksi.Close()
    End Sub

    Protected Sub simpan_Click(sender As Object, e As EventArgs) Handles simpan.Click
        Dim count As Integer = KelompokSqlDataSource.Insert()
        If count > 0 Then
            MsgBox("Data disimpan!")
            Response.Redirect("listAnggota.aspx")
        Else
            MsgBox("Data tidak disimpan!")
            Response.Redirect("listAnggota.aspx")
        End If

        nim.Text = ""
        kelompok.Text = ""
        status.Text = ""
    End Sub
End Class
