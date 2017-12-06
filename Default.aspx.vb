Imports System.Web.Configuration
Imports System.Data.SqlClient
Imports System.Data
Imports System.Data.SqlClient.SqlDataReader

Partial Class _Default
    Inherits Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim user As String = UserName.Text
        Dim pwd As String = Password.Text
        Dim kat As String = kategori.SelectedValue
        Dim cmd As SqlCommand
        Dim rdr As SqlDataReader
        Dim sqlUserName As String

        If UserName.Text <> "" And Password.Text <> "" Then

            Dim strConn As String
            strConn = WebConfigurationManager.ConnectionStrings("MentoringString").ConnectionString
            Dim Conn As New SqlConnection(strConn)
            Conn.Open()

            sqlUserName = "SELECT * FROM [user] WHERE [id_user] = '" + UserName.Text + "' AND [password] = '" + Password.Text + "' AND [kategori] ='" + kategori.Text + "'"
            cmd = New SqlCommand(sqlUserName, Conn)

            rdr = cmd.ExecuteReader()

            If rdr.HasRows = True Then

                If kat = "Admin" Then
                    Session("user") = user
                    Session("kategori") = kat
                    Response.Redirect("~/View/admin/Dashboard.aspx")
                ElseIf kat = "Pementor" Then
                    Session("user") = user
                    Session("kategori") = kat
                    Response.Redirect("~/View/pementor/Dashboard.aspx")
                End If
            Else
                alert.Text = "<i>Username atau Password Anda salah !</i>"
                Session("user") = ""
            End If
            rdr.Close()
            cmd.Dispose()
        Else
            alert.Text = "<i>Jangan Kosongkan Username atau Password Anda !</i>"
        End If

    End Sub
End Class