<%@ Page Language="VB" AutoEventWireup="false" CodeFile="requestJadwal.aspx.vb" Inherits="View_pementor_requestJadwal" MasterPageFile="~/Konten1.master" %>

<script runat="server">
    Sub Kelompok_OnSelectedIndexChanged(sender As Object, e As EventArgs)
        SqlDataSource1.SelectParameters("id_jadwal").DefaultValue = _
          GridView1.SelectedValue.ToString()
    End Sub

</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
         <br />
        
         <a href="#dialog-mahasiswa" id="d" class="btn tambah" data-toggle="modal">
                                            <button id="editable-sample_new" class="btn btn-shadow btn-primary">
                                                Tambah Request Jadwal <i class="icon-plus"></i>
                                            </button>
                                        </a>
         <br />
         <br />
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [pementor]"></asp:SqlDataSource>
              
        <div class="modal-footer">
                    
         </div>
         <br />
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False" 
                OnSelectedIndexChanged="Kelompok_OnSelectedIndexChanged"
                RunAt="Server" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="id_jadwal">

                  <EditRowStyle BackColor="#2461BF" />
                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                <HeaderStyle backcolor="#507CD1"
                  forecolor="White" Font-Bold="True" />
                  <AlternatingRowStyle BackColor="White" />
                  <Columns >
                      <asp:CommandField ShowDeleteButton="True" DeleteText='<div class="btn btn-danger waves-effect waves-light btn-xs m-b-5"><i class="fa fa-trash "></i></div>' />
                    <asp:BoundField DataField="nama_kelompok" HeaderText="Nama Kelompok" SortExpression="nama_kelompok"/>
                    <asp:BoundField DataField="pertemuan"   HeaderText="Pertemuan" SortExpression="pertemuan"/>                        
                      <asp:BoundField DataField="tanggal" HeaderText="Tanggal" SortExpression="tanggal" />
                      <asp:BoundField DataField="waktu_awal" HeaderText="Waktu Mulai" SortExpression="waktu_awal" />
                      <asp:BoundField DataField="waktu_akhir" HeaderText="Waktu Berakhir" SortExpression="waktu_akhir" />
                      <asp:BoundField DataField="tempat" HeaderText="Tempat" SortExpression="tempat" />
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
          selectCommand="SELECT jadwal.id_jadwal, kelompok.nama_kelompok, jadwal.pertemuan, jadwal.tanggal, jadwal.waktu_awal, jadwal.waktu_akhir, jadwal.tempat, jadwal.status FROM kelompok INNER JOIN jadwal ON kelompok.id_kelompok = jadwal.id_kelompok WHERE (jadwal.kategori = 'mentor' and kelompok.id_user = @id_user) ORDER BY jadwal.tanggal DESC"
             DeleteCommand="DELETE FROM jadwal WHERE id_jadwal = @id_jadwal"
             InsertCommand="INSERT INTO [jadwal] ([id_kelompok], [pertemuan], [tanggal], [waktu_awal], [waktu_akhir], [tempat], [status], [kategori]) VALUES (@id_kelompok, @pertemuan, @tanggal, @waktu_awal, @waktu_akhir, @tempat, @status, @kategori)" UpdateCommand="UPDATE [jadwal] SET [id_kelompok] = @id_kelompok, [pertemuan] = @pertemuan, [tanggal] = @tanggal, [waktu_awal] = @waktu_awal, [waktu_akhir] = @waktu_akhir, [tempat] = @tempat, [status] = @status, [kategori] = @kategori WHERE [id_jadwal] = @id_jadwal" >
            <DeleteParameters>
                <asp:Parameter Name="id_jadwal" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_kelompok" Type="String" />
                <asp:Parameter Name="pertemuan" Type="String" />
                <asp:Parameter Name="tanggal" Type="String" />
                <asp:Parameter Name="waktu_awal" Type="String" />
                <asp:Parameter Name="waktu_akhir" Type="String" />
                <asp:Parameter Name="tempat" Type="String" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="kategori" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="id_user" SessionField="user" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_kelompok" Type="String" />
                <asp:Parameter Name="pertemuan" Type="String" />
                <asp:Parameter Name="tanggal" Type="String" />
                <asp:Parameter Name="waktu_awal" Type="String" />
                <asp:Parameter Name="waktu_akhir" Type="String" />
                <asp:Parameter Name="tempat" Type="String" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="kategori" Type="String" />
                <asp:Parameter Name="id_jadwal" Type="Int32" />
            </UpdateParameters>
            </asp:sqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
            SelectCommand="SELECT * from jadwal where id_jadwal = @id_jadwal" >
            <SelectParameters>
                <asp:Parameter Name="id_jadwal" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_jadwal" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
         
     <!-- Modal -->
                                    <div class="modal fade" id="dialog-mahasiswa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h3 id="myModalLabel">Tambah Request Jadwal</h3>
                                                </div>
                                                <div class="modal-body">
                                                    Pertemuan 
                                                    <asp:DropDownList ID="pertemuan" runat="server" class="form-control" >
                                                        <asp:ListItem>I</asp:ListItem>
                                                        <asp:ListItem>II</asp:ListItem>
                                                        <asp:ListItem>III</asp:ListItem>
                                                        <asp:ListItem>IV</asp:ListItem>
                                                        <asp:ListItem>V</asp:ListItem>
                                                        <asp:ListItem>VI</asp:ListItem>
                                                        <asp:ListItem>VII</asp:ListItem>
                                                        <asp:ListItem>VIII</asp:ListItem>
                                                        <asp:ListItem>IX</asp:ListItem>
                                                        <asp:ListItem>X</asp:ListItem>
                                                        <asp:ListItem>XI</asp:ListItem>
                                                        <asp:ListItem>XII</asp:ListItem>
                                                        <asp:ListItem>XIII</asp:ListItem>
                                                        <asp:ListItem Value="XIV"></asp:ListItem>
                                                        <asp:ListItem>XV</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br />Tanggal 
                                                    <asp:TextBox ID="tanggal" class="form-control" runat="server" TextMode="Date" ></asp:TextBox>
                                                    <br />Waktu Mulai<asp:TextBox ID="waktu1" TextMode="Time" class="form-control" runat="server" ></asp:TextBox>
                                                    <br />Waktu Berakhir<asp:TextBox ID="waktu2" TextMode="Time" class="form-control" runat="server" ></asp:TextBox>
                                                    <br />Tempat<asp:TextBox ID="tempat"  class="form-control" runat="server" ></asp:TextBox>
                                                    <br />
                                            
                                                </div>
                                                <div class="modal-footer">
                                                    <button data-dismiss="modal" class="btn btn-default" type="button">Batal   </button>     
                                                         <asp:Button ID="simpan" runat="server" Text="Simpan" class="btn btn-success" Width="77px" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- modal -->    
    </form>
</asp:Content>



