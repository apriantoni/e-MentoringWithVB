<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TambahAbsen.aspx.vb" Inherits="View_pementor_TambahAbsen" MasterPageFile="~/Konten1.master" %>

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
         <br />
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
                    <asp:BoundField DataField="nama"   HeaderText="nama" SortExpression="nama"/>                        
                    <asp:BoundField DataField="pertemuan"  HeaderText="pertemuan" SortExpression="pertemuan"/>
                      <asp:BoundField DataField="tanggal" HeaderText="tanggal" SortExpression="tanggal" />
                    <asp:BoundField DataField="status"  HeaderText="status" SortExpression="status"/>
                    <asp:BoundField DataField="keterangan"  HeaderText="keterangan" SortExpression="keterangan"/>
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
                <br />
         
        <asp:sqlDataSource ID="KelompokSqlDataSource" ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
          RunAt="server" 
          selectCommand="SELECT [user].nama, jadwal.pertemuan, jadwal.tanggal, absenmentor.status, absenmentor.keterangan FROM absenmentor INNER JOIN [user] ON absenmentor.id_user = [user].id_user INNER JOIN jadwal ON absenmentor.id_jadwal = jadwal.id_jadwal" 
            DeleteCommand="DELETE FROM [absenmentor] WHERE [id_absen] = @id_absen" 
            InsertCommand="INSERT INTO [absenmentor] ([id_user], [id_jadwal], [status], [keterangan]) VALUES (@id_user, @id_jadwal, @status, @keterangan)" UpdateCommand="UPDATE [absenmentor] SET [id_user] = @id_user, [id_jadwal] = @id_jadwal, [status] = @status, [keterangan] = @keterangan WHERE [id_absen] = @id_absen" >
            <DeleteParameters>
                <asp:Parameter Name="id_absen" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="id_user" Type="String" />
                <asp:Parameter Name="id_jadwal" Type="Int32" />
                <asp:Parameter Name="status" Type="String" />
                <asp:Parameter Name="keterangan" Type="String" />
                </InsertParameters>
            </asp:sqlDataSource>

         <asp:DataList ID="DataList1" runat="server" DataSourceID="KelompokSqlDataSource">
             <ItemTemplate>
                 nama:
                 <asp:Label ID="namaLabel" runat="server" Text='<%# Eval("nama") %>' />
                 <br />
                 pertemuan:
                 <asp:Label ID="pertemuanLabel" runat="server" Text='<%# Eval("pertemuan") %>' />
                 <br />
                 tanggal:
                 <asp:Label ID="tanggalLabel" runat="server" Text='<%# Eval("tanggal") %>' />
                 <br />
                 status:
                 <asp:Label ID="statusLabel" runat="server" Text='<%# Eval("status") %>' />
                 <br />
                 keterangan:
                 <asp:Label ID="keteranganLabel" runat="server" Text='<%# Eval("keterangan") %>' />
                 <br />
<br />
             </ItemTemplate>
         </asp:DataList>

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
                                                    <h3 id="myModalLabel">Tambah Absensi Pementor</h3>
                                                </div>
                                                <div class="modal-body">
                                                    Pementor&nbsp; <asp:DropDownList ID="pementor" Class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="nama" DataValueField="id_user">
                                                      <asp:ListItem>Ikhwan</asp:ListItem>
                                                      <asp:ListItem>Akhwat</asp:ListItem>
                                                    </asp:DropDownList><br />
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [user] WHERE ([kategori] = @kategori)">
                                                        <SelectParameters>
                                                            <asp:Parameter DefaultValue="Pementor" Name="kategori" Type="String" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                    </asp:ScriptManager>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                    Kelompok&nbsp; <asp:DropDownList ID="kelompok" runat="server" class="form-control" DataSourceID="SqlDataSource5" DataTextField="nama_kelompok" DataValueField="id_kelompok" AutoPostBack="True" >
                                                        
                                                    </asp:DropDownList><br />
                                                    
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [kelompok]"></asp:SqlDataSource>
                                                    Pertemuan <asp:DropDownList ID="pertemuan" runat="server" class="form-control" DataSourceID="SqlDataSource6" DataTextField="pertemuan" DataValueField="id_jadwal" >
                                                        
                                                    </asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [jadwal] WHERE ([id_kelompok] = @id_kelompok)">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="kelompok" Name="id_kelompok" PropertyName="SelectedValue" Type="String" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        <br />
                                                    
                                                    </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                    </asp:UpdateProgress>
                                                    <br />
                                                    Status <asp:DropDownList ID="status" runat="server" class="form-control" DataTextField="nama_kelompok" DataValueField="id_kelompok" >
                                                        <asp:ListItem>Hadir</asp:ListItem>
                                                        <asp:ListItem>Izin</asp:ListItem>
                                                        <asp:ListItem>Sakit</asp:ListItem>
                                                    </asp:DropDownList>
                                                    
                                                    <br />
                                                    Keterangan <asp:TextBox ID="keterangan" TextMode="MultiLine" class="form-control" runat="server" ></asp:TextBox>
                                                    <br />
                                                </div>
                                                <div class="modal-footer">
                                                    <button data-dismiss="modal" class="btn btn-default" type="button">Batal</button>
                                                     <asp:Button ID="simpan" runat="server" Text="Simpan" class="btn btn-success" Width="77px" />

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- modal -->    
    </form>
</asp:Content>
