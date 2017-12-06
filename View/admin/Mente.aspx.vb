Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader

Partial Class View_admin_Mente
    Inherits System.Web.UI.Page

    Protected Sub simpan_Click(sender As Object, e As EventArgs) Handles simpan.Click
        Dim count As Integer = KelompokSqlDataSource.Insert()
        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("Mente.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Mente.aspx")
        End If

        id.Text = ""
        nama.Text = ""
        alamat.Text = ""
        nohape.Text = ""
        password.Text = ""
        email.Text = ""
        kelas.Text = ""
        prodi.Text = ""
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("Mente.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String

        Dim idp As HiddenField = PementorFormView.FindControl("idp")
        Dim namap As TextBox = PementorFormView.FindControl("namap")
        Dim alamatp As TextBox = PementorFormView.FindControl("alamatp")
        Dim nohapep As TextBox = PementorFormView.FindControl("nohapep")
        Dim passwordp As TextBox = PementorFormView.FindControl("passwordp")
        Dim emailp As TextBox = PementorFormView.FindControl("emailp")
        Dim prodip As DropDownList = PementorFormView.FindControl("prodip")
        Dim kelasp As TextBox = PementorFormView.FindControl("kelasp")
        Dim jkl As DropDownList = PementorFormView.FindControl("DL1")


        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()
        strSql = "UPDATE mente SET nama = '" + namap.Text + "', alamat = '" + alamatp.Text + "', nohape = '" + nohapep.Text + "', password='" + passwordp.Text + "', email = '" + emailp.Text + "', kelas = '" + kelasp.Text + "' , prodi = '" + prodip.Text + "', jk = '" + jkl.Text + "' WHERE nim = '" + idp.Value + "'"
        xCommand.Connection = koneksi
        xCommand.CommandText = strSql

        Dim count As Integer = xCommand.ExecuteNonQuery()

        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("Mente.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Mente.aspx")
        End If
        koneksi.Close()
    End Sub
    
    Protected Sub PementorFormView_PageIndexChanging(sender As Object, e As FormViewPageEventArgs) Handles PementorFormView.PageIndexChanging

    End Sub
End Class
