<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Jadwal.aspx.vb" Inherits="View_admin_Jadwal" MasterPageFile="~/Konten.master" %>

<script runat="server">
    Sub Kelompok_OnSelectedIndexChanged(sender As Object, e As EventArgs)
        SqlDataSource1.SelectParameters("id_jadwal").DefaultValue = _
          GridView1.SelectedValue.ToString()
        PementorFormView.DataBind()
    End Sub

</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
         <br />
        
         <a href="#dialog-mahasiswa" id="d" class="btn tambah" data-toggle="modal">
                                            <button id="editable-sample_new" class="btn btn-shadow btn-primary">
                                                Tambah Data Jadwal <i class="icon-plus"></i>
                                            </button>
                                        </a>
         <br />
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [pementor]"></asp:SqlDataSource>
         
       
         <div class="modal-footer"></div>
              <asp:FormView ID="PementorFormView"
                DataSourceID="SqlDataSource1"
                DataKeyNames="id_jadwal"     
                Gridlines="Both" 
                BorderColor="White" Width="100%"
                  RunAt="server">

                <HeaderStyle backcolor="Navy"
                  forecolor="White"/>

                <RowStyle backcolor="White"/>         

                  <EditRowStyle backcolor="LightCyan"/>
                <ItemTemplate>
                  <table style="width: 100%"; position: center">
                    <tr style="width: 50%">
                        <td align="right"><b>ID Jadwal :</b><br /></td><td><asp:TextBox ID="idp1" runat="server" Text='<%# Eval("id_jadwal")%>' class="form-control" disabled="disabled" /><br /></td>
                        <asp:HiddenField ID="idp" runat="server" value='<%# Eval("id_jadwal")%>' />
                        <td></td>
                        <td align="right"><b>Waktu Mulai :</b><br /><br /></td>  <td><asp:TextBox ID="waktu1p" TextMode="Time" runat="server" Text='<%# Eval("waktu_awal")%>' class="form-control"/><br /><br /></td>
                    
                    </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Nama Kelompok :</b><br /></td> <td>
                            <asp:DropDownList ID="idkp" Class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="nama_kelompok" DataValueField="id_kelompok">
                                                      <asp:ListItem>Ikhwan</asp:ListItem>
                                                      <asp:ListItem>Akhwat</asp:ListItem>
                                                    </asp:DropDownList><br /></td> 
                        <td></td>
                          <td align="right"><b>Waktu Berakhir :</b><br /><br /></td>  <td><asp:TextBox ID="waktu2p" TextMode="Time" runat="server" Text='<%# Eval("waktu_akhir")%>' class="form-control"/><br /><br /></td>
                        </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Pertemuan :</b><br /><br /></td>  <td><asp:DropDownList ID="pertemuanp" runat="server" class="form-control" DataSourceID="SqlDataSource4" DataTextField="keterangan" DataValueField="pertemuan" >
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
                                                    </asp:DropDownList><br /><br /></td>
                        <td></td>  
                        <td align="right"><b>Tempat :</b><br /><br /></td>  <td><asp:TextBox ID="tempatp" runat="server" Text='<%# Eval("tempat")%>' class="form-control"/><br /><br /></td>
                    </tr>
                    <tr style="width: 50%">
                        <td align="right"><b>Tanggal :</b><br /><br /></td>  <td><asp:TextBox ID="tanggalp" TextMode="Date" runat="server" Text='<%# Eval("tanggal")%>' class="form-control"/><br /><br /></td>
                        <td></td>  
                        <td align="right"><b>Status :</b><br /><br /></td>  <td> <asp:DropDownList ID="statusp" Class="form-control" runat="server">
                             <asp:ListItem>Selesai</asp:ListItem>
                             <asp:ListItem>Belum Selesai</asp:ListItem>
                          </asp:DropDownList><br /><br /></td>
                    </tr>
                      <tr style="width:50%">
                         <td align="right"></td>
                       <td align="right" colspan="1">
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
         
         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [materi]"></asp:SqlDataSource>
         
        <br />
         <br />
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="id_jadwal" 
                OnSelectedIndexChanged="Kelompok_OnSelectedIndexChanged"
                RunAt="Server" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">

                  <EditRowStyle BackColor="#2461BF" />
                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                <HeaderStyle backcolor="#507CD1"
                  forecolor="White" Font-Bold="True" />
                  <AlternatingRowStyle BackColor="White" />
                  <Columns >
                    <asp:ButtonField Text='<div class="btn btn-success waves-effect waves-light btn-xs m-b-5"><i class="fa fa-pencil "></i></div></a>'
                    HeaderText=""
                    CommandName="Select"/>  
                    <asp:CommandField ShowDeleteButton="True" DeleteText='<div class="btn btn-danger waves-effect waves-light btn-xs m-b-5"><i class="fa fa-trash "></i></div></a>'/>
                    <asp:BoundField DataField="id_kelompok"   HeaderText="Kelompok"/>                        
                    <asp:BoundField DataField="pertemuan"  HeaderText="pertemuan"/>
                    <asp:BoundField DataField="tanggal"  HeaderText="Tanggal"/>
                    <asp:BoundField DataField="waktu_awal"  HeaderText="Waktu Mulai (WIB)"/>
                    <asp:BoundField DataField="waktu_akhir"  HeaderText="Waktu Berakhir (WIB)"/>
                      <asp:BoundField DataField="tempat"  HeaderText="Tempat"/>
                      <asp:BoundField DataField="status"  HeaderText="Status"/>
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
          selectCommand="SELECT * FROM jadwal where pertemuan = @pertemuan and kategori = 'admin'" 
            DeleteCommand="DELETE FROM jadwal WHERE id_jadwal = @id_jadwal" 
            InsertCommand="INSERT INTO jadwal(id_kelompok, pertemuan, tanggal, waktu_awal, waktu_akhir, tempat, status, kategori) VALUES (@id_kelompok, @pertemuan, @tanggal, @waktu_awal, @waktu_akhir, @tempat, 'Belum Selesai','admin')" >
            <DeleteParameters>
                <asp:Parameter Name="nim" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="idk" Name="id_kelompok" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="pertemuan" Name="pertemuan" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="tanggal" Name="tanggal" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="waktu1" Name="waktu_awal" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="waktu2" Name="waktu_akhir" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="tempat" Name="tempat" PropertyName="Text" Type="String" />
                <asp:Parameter DefaultValue="admin" Name="ketegori" Type="String" />
                </InsertParameters>
            <SelectParameters>
                    <asp:ControlParameter ControlID="DL3" Name="pertemuan" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
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
                                                    <h3 id="myModalLabel">Tambah Data Jadwal</h3>
                                                </div>
                                                <div class="modal-body">
                                                    Kelompok <asp:DropDownList ID="idk" Class="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="nama_kelompok" DataValueField="id_kelompok">
                                                      <asp:ListItem>Ikhwan</asp:ListItem>
                                                      <asp:ListItem>Akhwat</asp:ListItem>
                                                    </asp:DropDownList><br />
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [kelompok]"></asp:SqlDataSource>
                                                    Pertemuan <asp:DropDownList ID="pertemuan" runat="server" class="form-control" DataSourceID="SqlDataSource4" DataTextField="keterangan" DataValueField="pertemuan" >
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
                                                    
                                                    <br />
                                                    Tanggal <asp:TextBox ID="tanggal" TextMode="Date" class="form-control" runat="server" ></asp:TextBox>
                                                    <br />
                                                    Waktu Mulai <asp:TextBox ID="waktu1" TextMode="Time" class="form-control" runat="server" ></asp:TextBox>
                                                    <br />
                                                    Waktu Akhir <asp:TextBox ID="waktu2" TextMode="Time" class="form-control" runat="server" ></asp:TextBox>
                                                    <br />
                                                    Tempat <asp:TextBox ID="tempat" class="form-control" runat="server" ></asp:TextBox>
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
