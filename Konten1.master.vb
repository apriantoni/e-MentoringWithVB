
Partial Class Konten1
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("user") = "" Then
            MsgBox("Anda Belum Login!")
            Response.Redirect("~/Default.aspx")
        Else
            Label1.Text = Session("user").ToString()
        End If
    End Sub
End Class

