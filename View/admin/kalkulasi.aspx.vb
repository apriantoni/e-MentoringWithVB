Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Partial Class View_admin_kalkulasi
    Inherits System.Web.UI.Page
    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("kalkulasi.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String
        Dim n1 As TextBox = PementorFormView.FindControl("n1")
        Dim n2 As TextBox = PementorFormView.FindControl("n2")
        Dim n3 As TextBox = PementorFormView.FindControl("n3")
        Dim n4 As TextBox = PementorFormView.FindControl("n4")
        Dim n5 As TextBox = PementorFormView.FindControl("n5")
        Dim idp As HiddenField = PementorFormView.FindControl("idp")

        If (Convert.ToInt32(n1.Text) + Convert.ToInt32(n2.Text) + Convert.ToInt32(n3.Text) + Convert.ToInt32(n4.Text) + Convert.ToInt32(n5.Text)) <> 100 Then
            'MsgBox("Total Nilai Inputan Harus 100 !")
            Response.Redirect("kalkulasi.aspx")
        Else
            koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
            koneksi.Open()
            strSql = "UPDATE bobot SET bobot1 = '" + n1.Text + "', bobot2 = '" + n2.Text + "', bobot3 = '" + n3.Text + "', bobot4 = '" + n4.Text + "', bobot5 = '" + n5.Text + "' WHERE id_bobot = '" + idp.Value + "'"
            xCommand.Connection = koneksi
            xCommand.CommandText = strSql

            Dim count As Integer = xCommand.ExecuteNonQuery()

            If count > 0 Then
                'MsgBox("Data disimpan!")
                Response.Redirect("kalkulasi.aspx")
            Else
                'MsgBox("Data tidak disimpan!")
                Response.Redirect("kalkulasi.aspx")
            End If
            koneksi.Close()
        End If
    End Sub
End Class
