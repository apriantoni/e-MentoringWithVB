Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader

Partial Class View_admin_requestJadwal
    Inherits System.Web.UI.Page

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("requestJadwal.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String
        Dim statusp As DropDownList = PementorFormView.FindControl("statusp")
        Dim idp As HiddenField = PementorFormView.FindControl("idp")

        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()
        strSql = "UPDATE jadwal SET status = '" + statusp.Text + "' WHERE id_jadwal = '" + idp.Value + "'"
        xCommand.Connection = koneksi
        xCommand.CommandText = strSql

        Dim count As Integer = xCommand.ExecuteNonQuery()

        If count > 0 Then
            ' MsgBox("Data disimpan!")
            Response.Redirect("requestJadwal.aspx")
        Else
            ' MsgBox("Data tidak disimpan!")
            Response.Redirect("requestJadwal.aspx")
        End If
        koneksi.Close()
    End Sub
End Class
