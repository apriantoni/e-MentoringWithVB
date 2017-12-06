Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader
Partial Class View_admin_kuisioner
    Inherits System.Web.UI.Page

    Protected Sub simpan_Click(sender As Object, e As EventArgs) Handles simpan.Click
        Dim count As Integer = KelompokSqlDataSource.Insert()
        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("Kuisioner.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Kuisioner.aspx")
        End If

        id.Text = ""
        keterangan.Text = ""
        bobot.Text = ""
        status.Text = ""
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("Kuisioner.aspx")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs)
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim strSql As String

        Dim idp As HiddenField = PementorFormView.FindControl("idp")
        Dim keteranganp As TextBox = PementorFormView.FindControl("ketp")
        Dim bobotp As TextBox = PementorFormView.FindControl("bobotp")
        Dim statusp As DropDownList = PementorFormView.FindControl("DL1")


        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()
        strSql = "UPDATE kuisioner SET keterangan = '" + keteranganp.Text + "',bobot ='" + bobotp.Text + "', status='" + statusp.Text + "' WHERE id_kuisioner = '" + idp.Value + "'"
        xCommand.Connection = koneksi
        xCommand.CommandText = strSql

        Dim count As Integer = xCommand.ExecuteNonQuery()

        If count > 0 Then
            'MsgBox("Data disimpan!")
            Response.Redirect("Kuisioner.aspx")
        Else
            'MsgBox("Data tidak disimpan!")
            Response.Redirect("Kuisioner.aspx")
        End If
        koneksi.Close()
    End Sub

End Class
