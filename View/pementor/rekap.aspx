<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rekap.aspx.vb" Inherits="View_pementor_rekap" MasterPageFile="~/Konten1.master" %>

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
        
        
       <br />
         <h4>Presentase Kehadiran Mente</h4>
         <br />
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
                    <asp:BoundField DataField="nama"   HeaderText="Nama Siswa"/>
                    <asp:BoundField DataField="presensi"   HeaderText="Presentasi Kehadiran (%)"/>
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
          selectCommand="SELECT round((( select count(status) from absensi where status  = 'Hadir' and validasi = 'Disetujui' group by nim) / count(a.id_absen)) * 100, 2) as presensi, m.nama
                         FROM [mente] m, absensi a, jadwal j
                         where m.nim = a.nim and a.id_jadwal = j.id_jadwal and j.id_kelompok = @id_kelompok 
                         GROUP BY m.nama"  >
             <SelectParameters>
                 <asp:SessionParameter Name="id_kelompok" SessionField="id" />
             </SelectParameters>
        </asp:sqlDataSource>
    </form>
</asp:Content>
