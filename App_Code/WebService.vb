Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient

' To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line.
 <System.Web.Script.Services.ScriptService()> _
<WebService(Namespace:="http://mentoringukmi.azurewebsites.net/")> _
'<WebServiceBinding(ConformsTo:=WsiProfiles.BasicProfile1_1)> _
'<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Public Class WebService
    'Inherits System.Web.Services.WebService
    <WebMethod()> _
    Public Function tampilBerita() As DataTable
        Dim constr As String = ConfigurationManager.ConnectionStrings("MentoringString").ConnectionString
        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand("SELECT * FROM [berita] FOR JSON PATH, ROOT ('berita')")
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using dt As New DataTable()
                        dt.TableName = "berita"
                        sda.Fill(dt)

                    End Using
                End Using
            End Using
        End Using
    End Function

    Private Sub XmlDataDocument(p1 As Object)
        Throw New System.NotImplementedException
    End Sub

End Class