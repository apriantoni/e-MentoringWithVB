<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AbsenMente.aspx.vb" Inherits="View_pementor_AbsenMente" MasterPageFile="~/Konten1.master" %>
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
    
    Sub Kelompok_OnSelectedIndexChanged(sender As Object, e As EventArgs)
        SqlDataSource1.SelectParameters("id_absen").DefaultValue = _
          GridView1.SelectedValue.ToString()
        PementorFormView.DataBind()
    End Sub
</script>


<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
         <br />
        
         <a href="#dialog-mahasiswa" id="d" class="btn tambah" data-toggle="modal">
                                            <button id="editable-sample_new" class="btn btn-shadow btn-primary">
                                                Tambah Data Absensi <i class="icon-plus"></i>
                                            </button>
                                        </a>
         <br />
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
         
       
         <div class="modal-footer">
             
         </div>
              <asp:FormView ID="PementorFormView"
                DataSourceID="SqlDataSource1"
                DataKeyNames="id_absen"     
                Gridlines="Both" 
                BorderColor="White"
                  RunAt="server" Width="100%">

                <HeaderStyle backcolor="Navy"
                  forecolor="White"/>

                <RowStyle backcolor="White"/>         

                  <EditRowStyle backcolor="LightCyan"/>
<ItemTemplate>
                  <table style="width: 100%"; position: center">
                    <tr style="width: 50%">
                        <td align="right"><b>NIM :</b><br /></td><td><asp:TextBox ID="idp1" Width="70%" runat="server" Text='<%# Eval("nim")%>' class="form-control" disabled="disabled" /><br /></td>
                        <asp:HiddenField ID="idp" runat="server" value='<%# Eval("id_absen")%>' />
                    </tr>
                                                    
                      <tr style="width: 50%">
                        <td align="right"><b>Nama Kelompok :</b><br /></td> <td>
                            <asp:DropDownList ID="kelompokp" runat="server" Width="70%" class="form-control" DataSourceID="SqlDataSource5" DataTextField="nama_kelompok" DataValueField="id_kelompok" AutoPostBack="True" >
                                                        
                                                    </asp:DropDownList><br />
                                                    </td> 
                        </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Pertemuan :</b><br /><br /></td>  <td><asp:DropDownList ID="pertemuanp" Width="70%" runat="server" class="form-control" DataSourceID="SqlDataSource8" DataTextField="pertemuan" DataValueField="id_jadwal" >
                                                        
                                                    </asp:DropDownList>
                                                    <br /><br /></td>
                      </tr>
                                                    
                    <tr style="width: 50%">
                        <td align="right"><b>Status :</b><br /><br /></td>  <td> <asp:DropDownList ID="statusp" Width="70%" runat="server" class="form-control" DataTextField="nama_kelompok" DataValueField="id_kelompok" >
                                                        <asp:ListItem>Hadir</asp:ListItem>
                                                        <asp:ListItem>Izin</asp:ListItem>
                                                        <asp:ListItem>Alpha</asp:ListItem>
                                                    </asp:DropDownList><br />
                                                    
                                                   </td>
                        </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Keterangan :</b><br /><br /></td>  <td> <asp:TextBox  Width="70%" ID="keteranganp" TextMode="MultiLine" Text='<%# Eval("keterangan")%>' class="form-control" runat="server" ></asp:TextBox>
                                           <br />         
                                                   </td>
                        </tr>
                    
                      <tr style="width:50%">
                         <td align="right"></td>
                       <td  colspan="1">
                         <asp:Button ID="cancelUpdate"
                                        class="btn btn-default" Text="Cancel" OnClick="Button2_Click"
                                        RunAt="server"/>
                          <asp:Button ID="Button1"
                                        class="btn btn-success" Text="Update"  OnClick="Button1_Click"
                                        RunAt="server"/>
                         </center>
                      </td>
                      </tr>
                    </table>
                </ItemTemplate>
              </asp:FormView>
         
        <div class="modal-footer">
                    
         </div>
          Pertemuan : <asp:DropDownList ID="DL3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="keterangan" DataValueField="pertemuan" >
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
         
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         
         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [materi]"></asp:SqlDataSource>
         
        <br />
         <br />
        
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="id_absen" 
                OnSelectedIndexChanged="Kelompok_OnSelectedIndexChanged"
                RunAt="Server" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">

                  <EditRowStyle BackColor="#2461BF" />
                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                <HeaderStyle backcolor="#507CD1"
                  forecolor="White" Font-Bold="True" />

                  <AlternatingRowStyle BackColor="White" />

                <Columns >
                      <asp:ButtonField Text='<div class="btn btn-success waves-effect waves-light btn-xs m-b-5"><i class="fa fa-pencil "></i></div>'
                    HeaderText=""
                    CommandName="Select"/> 
                      
                      <asp:CommandField ShowDeleteButton="True" DeleteText='<div class="btn btn-danger waves-effect waves-light btn-xs m-b-5"><i class="fa fa-trash "></i></div>' />
                    <asp:BoundField DataField="nim"   HeaderText="NIM" SortExpression="nim" ReadOnly="True"/>                        
                    <asp:BoundField DataField="nama"  HeaderText="Nama Siswa" SortExpression="nama"/>
                      <asp:BoundField DataField="pertemuan" HeaderText="Pertemuan" SortExpression="pertemuan" />
                    <asp:BoundField DataField="tanggal"  HeaderText="Tanggal" SortExpression="tanggal"/>
                      <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                    <asp:BoundField DataField="keterangan"  HeaderText="Keterangan" SortExpression="keterangan"/>
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
          selectCommand="SELECT mente.nim, mente.nama, jadwal.pertemuan, jadwal.tanggal, absensi.status, absensi.keterangan, absensi.id_absen FROM absensi INNER JOIN jadwal ON absensi.id_jadwal = jadwal.id_jadwal INNER JOIN mente ON absensi.nim = mente.nim WHERE (jadwal.id_kelompok = @id_kelompok) AND (jadwal.pertemuan = @pertemuan)" 
            DeleteCommand="DELETE FROM [absensi] WHERE [id_absen] = @id_absen" 
            InsertCommand="INSERT INTO [absensi] ([nim], [id_jadwal], [status], [keterangan], [validasi]) VALUES (@nim, @id_jadwal, @status, @keterangan, 'belum')" UpdateCommand="UPDATE [absensi] SET [id_mente] = @id_mente, [id_jadwal] = @id_jadwal, [status] = @status, [keterangan] = @keterangan, [validasi] = @validasi WHERE [id_absen] = @id_absen" >
            <DeleteParameters>
                <asp:Parameter Name="id_absen" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="nim" Name="nim" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="pertemuan" Name="id_jadwal" PropertyName="SelectedValue" Type="Int32" />
                <asp:ControlParameter ControlID="status" Name="status" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="keterangan" Name="keterangan" PropertyName="Text" Type="String" />
                </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="id_kelompok" SessionField="id" />
                <asp:ControlParameter ControlID="DL3" Name="pertemuan" PropertyName="SelectedValue" />
            </SelectParameters>
            </asp:sqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
            SelectCommand="SELECT * FROM absensi where id_absen = @id_absen" >
            <SelectParameters>
                <asp:Parameter Name="id_absen" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_absen" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
      
     <!-- Modal -->
                                    <div class="modal fade" id="dialog-mahasiswa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h3 id="myModalLabel">Tambah Absensi</h3>
                                                </div>
                                                <div class="modal-body">
                                                    Nama Siswa&nbsp; <asp:DropDownList ID="nim" Class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="nama" DataValueField="nim">
                                                      <asp:ListItem>Ikhwan</asp:ListItem>
                                                      <asp:ListItem>Akhwat</asp:ListItem>
                                                    </asp:DropDownList><br />
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT mente.nim, mente.nama, mente.password, mente.kelas, mente.prodi, mente.alamat, mente.nohape, mente.email, mente.jk, angkel.id, angkel.nim AS Expr1, angkel.status, angkel.id_kelompok FROM mente INNER JOIN angkel ON mente.nim = angkel.nim WHERE (angkel.id_kelompok = @id_kelompok)">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="id_kelompok" SessionField="id" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                    <asp:ScriptManager ID="ScriptManager1" runat="server">
                                                    </asp:ScriptManager>
                                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                    <ContentTemplate>
                                                    Kelompok&nbsp; <asp:DropDownList ID="kelompok" runat="server" class="form-control" DataSourceID="SqlDataSource5" DataTextField="nama_kelompok" DataValueField="id_kelompok" AutoPostBack="True" >
                                                        
                                                    </asp:DropDownList><br />
                                                    
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [kelompok] WHERE ([id_kelompok] = @id_kelompok)">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="id_kelompok" SessionField="id" Type="String" />
                                                        </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    Pertemuan <asp:DropDownList ID="pertemuan" runat="server" class="form-control" DataSourceID="SqlDataSource6" DataTextField="pertemuan" DataValueField="id_jadwal" >
                                                        
                                                    </asp:DropDownList>
                                                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [jadwal] WHERE ([id_kelompok] = @id_kelompok and kategori = 'admin' and status = 'Belum Selesai')">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="kelompok" Name="id_kelompok" PropertyName="SelectedValue" Type="String" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        <asp:SqlDataSource ID="SqlDataSource8" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [jadwal] WHERE ([id_kelompok] = @id_kelompok) and kategori = @kategori">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="kelompok" Name="id_kelompok" PropertyName="SelectedValue" Type="String" />
                                                                <asp:Parameter DefaultValue="admin" Name="kategori" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                        
                                                    
                                                    </ContentTemplate>
                                                    </asp:UpdatePanel>
                                                    <asp:UpdateProgress ID="UpdateProgress1" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                                                    </asp:UpdateProgress>
                                                    <br />
                                                    Status <asp:DropDownList ID="status" runat="server" class="form-control" DataTextField="nama_kelompok" DataValueField="id_kelompok" >
                                                        <asp:ListItem>Hadir</asp:ListItem>
                                                        <asp:ListItem>Izin</asp:ListItem>
                                                        <asp:ListItem>Alpha</asp:ListItem>
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


