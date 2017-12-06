Imports System.Data
Imports System.Data.SqlClient
Imports System.Data.SqlClient.SqlDataReader

Partial Class View_pementor_listAnggota
    Inherits System.Web.UI.Page

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Response.Redirect("listAnggota.aspx")
    End Sub
End Class
