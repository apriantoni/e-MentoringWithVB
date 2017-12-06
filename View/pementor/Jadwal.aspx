<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Jadwal.aspx.vb" Inherits="View_pementor_Jadwal" MasterPageFile="~/Konten1.master" %>
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

<script runat="server">
   
 </script>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server"> <br />
         <br />
        <h4>Daftar Jadwal Mentoring</h4><br />
         <div class="modal-footer">       
         </div>
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False" 
                RunAt="Server" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">

                  <EditRowStyle BackColor="#2461BF" />
                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                <HeaderStyle backcolor="#507CD1"
                  forecolor="White" Font-Bold="True" />
                  <AlternatingRowStyle BackColor="White" />
                  <Columns >
                    <asp:BoundField DataField="nama_kelompok" HeaderText="Nama Kelompok" SortExpression="nama_kelompok"/>
                    <asp:BoundField DataField="pertemuan"   HeaderText="Pertemuan" SortExpression="pertemuan"/>                        
                    <asp:BoundField DataField="tanggal"  HeaderText="Tanggal" SortExpression="tanggal"/>
                    <asp:BoundField DataField="waktu_awal"  HeaderText="Waktu Mulai" SortExpression="waktu_awal"/>
                    <asp:BoundField DataField="waktu_akhir"  HeaderText="Waktu Berakhir" SortExpression="waktu_akhir"/>
                    <asp:BoundField DataField="tempat"  HeaderText="Tempat" SortExpression="tempat"/>
                      <asp:BoundField DataField="status"  HeaderText="Status" SortExpression="status"/>
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
          selectCommand="SELECT kelompok.nama_kelompok, jadwal.pertemuan, jadwal.tanggal, jadwal.waktu_awal, jadwal.waktu_akhir, jadwal.tempat, jadwal.status FROM jadwal INNER JOIN kelompok ON jadwal.id_kelompok = kelompok.id_kelompok WHERE (jadwal.kategori = 'admin') AND (jadwal.id_kelompok = @id_kelompok)" 
            DeleteCommand="DELETE FROM jadwal WHERE id_jadwal = @id_jadwal" 
            InsertCommand="INSERT INTO jadwal(id_jadwal, id_kelompok, pertemuan, tanggal, waktu_awal, waktu_akhir, tempat, status, kategori) VALUES (@id_jadwal, @id_kelompok, @pertemuan, @tanggal, @waktu_awal, @waktu_akhir, @tempat, @status,'admin')" >
            <DeleteParameters>
                <asp:Parameter Name="id_jadwal" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="id" Name="id_jadwal" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="idk" Name="id_kelompok" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="pertemuan" Name="pertemuan" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="tanggal" Name="tanggal" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="waktu1" Name="waktu_awal" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="waktu2" Name="waktu_akhir" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="tempat" Name="tempat" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="status" Name="status" PropertyName="SelectedValue" Type="String" />
                </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="id_kelompok" SessionField="id" />
            </SelectParameters>
            </asp:sqlDataSource>

    </form>
</asp:Content>
