Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader

Partial Class View_admin_Materi
    Inherits System.Web.UI.Page

    Protected Sub simpan_Click(sender As Object, e As EventArgs) Handles simpan.Click
        Dim count As Integer = KelompokSqlDataSource.Insert()
        If count > 0 Then
            Response.Redirect("Materi.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Materi.aspx")
        End If

        id.Text = ""
        ket.Text = ""
        materi.Text = ""
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("Materi.aspx")
    End Sub

    Protected Sub update_Click(sender As Object, e As EventArgs)
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String

        Dim idp As HiddenField = PementorFormView.FindControl("idp")
        Dim ketp As TextBox = PementorFormView.FindControl("ketp")
        Dim materip As TextBox = PementorFormView.FindControl("materip")


        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()
        strSql = "UPDATE materi  SET keterangan = '" + ketp.Text + "', materi = '" + materip.Text + "' WHERE pertemuan = '" + idp.Value + "'"
        xCommand.Connection = koneksi
        xCommand.CommandText = strSql

        Dim count As Integer = xCommand.ExecuteNonQuery()

        If count > 0 Then
            'MesgBox("Data disimpan!")
            Response.Redirect("Materi.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Materi.aspx")
        End If
        koneksi.Close()

    End Sub

    'Private Sub MesgBox(ByVal sMessage As String)
    'Dim msg As String
    '   msg = "<script language='javascript'>"
    '  msg += "alert('" & sMessage & "');"
    ' msg += "<" & "/script>"
    'Response.Write(msg)
    'End Sub

End Class
