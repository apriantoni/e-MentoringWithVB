Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Partial Class View_admin_Pementor
    Inherits System.Web.UI.Page

    Protected Sub simpan_Click(sender As Object, e As EventArgs) Handles simpan.Click

        Dim count As Integer = KelompokSqlDataSource.Insert()
        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("Pementor.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Pementor.aspx")
        End If

        id.Text = ""
        nama.Text = ""
        alamat.Text = ""
        hape.Text = ""
        password.Text = ""
        emailTextBox1.Text = ""
    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("Pementor.aspx")
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
        Dim jkl As DropDownList = PementorFormView.FindControl("DL1")

        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()
        strSql = "UPDATE [user] SET nama = '" + namap.Text + "', alamat = '" + alamatp.Text + "', nohape = '" + nohapep.Text + "', password='" + passwordp.Text + "', email = '" + emailp.Text + "', jk = '" + jkl.Text + "' WHERE id_user = '" + idp.Value + "'"
        xCommand.Connection = koneksi
        xCommand.CommandText = strSql

        Dim count As Integer = xCommand.ExecuteNonQuery()

        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("Pementor.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Pementor.aspx")
        End If
        koneksi.Close()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
