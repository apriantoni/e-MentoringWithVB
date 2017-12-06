Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader

Partial Class View_pementor_penilaian
    Inherits System.Web.UI.Page
    Protected Sub simpan_Click(sender As Object, e As EventArgs) Handles simpan.Click
            Dim count As Integer = KelompokSqlDataSource.Insert()
            If count > 0 Then
            'MsgBox("Data disimpan!")
                Response.Redirect("penilaian.aspx")
            Else
            'MsgBox("Data tidak disimpan!")
                Response.Redirect("penilaian.aspx")
            End If
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("penilaian.aspx")
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
        Dim b1 As HiddenField = PementorFormView.FindControl("b1")
        Dim b2 As HiddenField = PementorFormView.FindControl("b2")
        Dim b3 As HiddenField = PementorFormView.FindControl("b3")
        Dim b4 As HiddenField = PementorFormView.FindControl("b4")
        Dim b5 As HiddenField = PementorFormView.FindControl("b5")
        Dim nakhir As String = (Convert.ToDouble((n1.Text * b1.Value) / 100) + Convert.ToDouble((n2.Text * b2.Value) / 100) + Convert.ToDouble((n3.Text * b3.Value) / 100) + Convert.ToDouble((n4.Text * b4.Value) / 100) + Convert.ToDouble((n5.Text * b5.Value) / 100)).ToString

        If (Convert.ToInt32(n1.Text) > 100 Or Convert.ToInt32(n1.Text) < 0) Or (Convert.ToInt32(n2.Text) > 100 Or Convert.ToInt32(n2.Text) < 0) Or (Convert.ToInt32(n3.Text) > 100 Or Convert.ToInt32(n3.Text) < 0) Or (Convert.ToInt32(n4.Text) > 100 Or Convert.ToInt32(n4.Text) < 0) Or (Convert.ToInt32(n5.Text) > 100 Or Convert.ToInt32(n5.Text) < 0) Then
            'MsgBox("Nilai Inputan Tidak Valid!")
            Response.Redirect("penilaian.aspx")
        Else
            koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
            koneksi.Open()

            strSql = "UPDATE penilaian SET nilai1 = '" + n1.Text + "', nilai2 ='" + n2.Text + "', nilai3 ='" + n3.Text + "', nilai4 ='" + n4.Text + "', nilai5 ='" + n5.Text + "', nilaiakhir =" + nakhir.ToString + " WHERE id_penilaian = '" + idp.Value + "'"
            xCommand.Connection = koneksi
            xCommand.CommandText = strSql

            Dim count As Integer = xCommand.ExecuteNonQuery()

            If count > 0 Then
                'MsgBox("Data disimpan!")
                Response.Redirect("penilaian.aspx")
            Else
                'MsgBox("Data tidak disimpan!")
                Response.Redirect("penilaian.aspx")
            End If
            koneksi.Close()
        End If
    End Sub
End Class
