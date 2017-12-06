<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Kehadiran.aspx.vb" Inherits="View_pementor_Kehadiran" MasterPageFile="~/Konten1.master" %>

<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient " %>

<script runat="server">
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim koneksi As New SqlConnection
        Dim xCommand As New SqlCommand
        Dim Sql As String
        Dim id_user As String = Session("user")

        koneksi.ConnectionString = "Data Source=mentoringukmi.database.windows.net;Initial Catalog=mentoringukmi;User ID=apriantoni;Password=Polemix15"
        koneksi.Open()

        Sql = "Select * from kelompok where id_user ='" + id_user + "'"
        xCommand.Connection = koneksi
        xCommand.CommandText = Sql
        Dim idus As String = xCommand.ExecuteScalar
        Session("id") = idus
    End Sub

</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
        <br /><br />
         <h4>Absensi Kehadiranmu</h4>
        <div class="modal-footer"></div>
       
             
&nbsp;<asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                RunAt="Server" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">

                  <EditRowStyle BackColor="#2461BF" />
                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                <HeaderStyle backcolor="#507CD1"
                  forecolor="White" Font-Bold="True" />

                  <AlternatingRowStyle BackColor="White" />

                <Columns >
                    <asp:BoundField DataField="nama"   HeaderText="Nama Pementor"/>
                    <asp:BoundField DataField="pertemuan"   HeaderText="Pertemuan"/> 
                    <asp:BoundField DataField="tanggal"   HeaderText="Tanggal"/> 
                    <asp:BoundField DataField="status"   HeaderText="Status"/> 
                    <asp:BoundField DataField="keterangan"   HeaderText="Keterangan"/>  
                </Columns>

                  <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                  <RowStyle BackColor="#EFF3FB" />
                  <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                  <SortedAscendingCellStyle BackColor="#F5F7FB" />
                  <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                  <SortedDescendingCellStyle BackColor="#E9EBEF" />
                  <SortedDescendingHeaderStyle BackColor="#4870BE" />

              </asp:GridView>

            
                <br />

           
        <asp:sqlDataSource ID="KelompokSqlDataSource" ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
          RunAt="server" 
          selectCommand="SELECT u.*, am.*, j.*
             FROM [user] u, absenmentor am, jadwal j
            where u.id_user = am.id_user and am.id_jadwal = j.id_jadwal and am.id_user = @id_user"  >
             <SelectParameters>
                 <asp:SessionParameter Name="id_user" SessionField="user" />
             </SelectParameters>
        </asp:sqlDataSource>
    </form>
</asp:Content>


