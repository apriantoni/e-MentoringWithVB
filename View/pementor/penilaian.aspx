<%@ Page Language="VB" AutoEventWireup="false" CodeFile="penilaian.aspx.vb" Inherits="View_pementor_penilaian" MasterPageFile="~/Konten1.master" %>

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
        SqlDataSource1.SelectParameters("id_penilaian").DefaultValue = _
          GridView1.SelectedValue.ToString()
        PementorFormView.DataBind()
    End Sub
</script>


<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
         <br />
        
         <a href="#dialog-mahasiswa" id="d" class="btn tambah" data-toggle="modal">
                                            <button id="editable-sample_new" class="btn btn-shadow btn-primary">
                                                Tambah Penilaian <i class="icon-plus"></i>
                                            </button>
                                        </a>
         <br />
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
         
         <div class="modal-footer">
             
         </div>
              <asp:FormView ID="PementorFormView"
                DataSourceID="SqlDataSource1"
                DataKeyNames="id_penilaian"     
                Gridlines="Both" 
                BorderColor="White"
                  RunAt="server" Width="100%">

                <HeaderStyle backcolor="Navy"
                  forecolor="White"/>

                <RowStyle backcolor="White"/>         

                  <EditRowStyle backcolor="LightCyan"/>
<ItemTemplate>
                  <table style="width: 100%"; position: center">
                       <td align="right"><b>Nilai Amalan Yaummi :</b><br /></td> <td>
                                <asp:TextBox  Width="70%" ID="nim"  Text='<%# Eval("nim")%>' class="form-control" runat="server"  disabled="disabled"></asp:TextBox>
                             <asp:HiddenField ID="idp" runat="server" value='<%# Eval("id_penilaian")%>' />
                           <asp:HiddenField ID="b1" runat="server" value='<%# Eval("bobot1")%>' />
                           <asp:HiddenField ID="b2" runat="server" value='<%# Eval("bobot2")%>' />
                           <asp:HiddenField ID="b3" runat="server" value='<%# Eval("bobot3")%>' />
                           <asp:HiddenField ID="b4" runat="server" value='<%# Eval("bobot4")%>' />
                           <br /><asp:HiddenField ID="b5" runat="server" value='<%# Eval("bobot5")%>' />
                       </td> 
                        </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>NIM Siswa :</b><br /></td> <td>
                                <asp:TextBox  Width="70%" ID="n1"  Text='<%# Eval("nilai1")%>' class="form-control" runat="server" ></asp:TextBox>
                            <br /></td> 
                        </tr>
                      <td align="right"><b>Nilai Keaktifan :</b><br /></td> <td>
                                <asp:TextBox  Width="70%" ID="n2"  Text='<%# Eval("nilai2")%>' class="form-control" runat="server" ></asp:TextBox>
                           <br /> </td> 
                        </tr>
                      <td align="right"><b>Nilai Tugas :</b><br /></td> <td>
                                <asp:TextBox  Width="70%" ID="n3"  Text='<%# Eval("nilai3")%>' class="form-control" runat="server" ></asp:TextBox>
                            <br /></td> 
                        </tr>
                      <td align="right"><b>Nilai UTS :</b><br /></td> <td>
                                <asp:TextBox  Width="70%" ID="n4"  Text='<%# Eval("nilai4")%>' class="form-control" runat="server" ></asp:TextBox>
                            <br /></td> 
                        </tr>
                      <td align="right"><b>Nilai UAS :</b><br /></td> <td>
                                <asp:TextBox  Width="70%" ID="n5"  Text='<%# Eval("nilai5")%>' class="form-control" runat="server" ></asp:TextBox>
                            <br /></td> 
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
         <br />
        
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="id_penilaian" 
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
                      <asp:CommandField ShowDeleteButton="True" DeleteText='<div class="btn btn-danger waves-effect waves-light btn-xs m-b-5"><i class="fa fa-trash "></i></div></a>'/>
                      <asp:BoundField DataField="nama"   HeaderText="Nama Siswa" SortExpression="nim" ReadOnly="True"/>                        
                    <asp:BoundField DataField="nilai1"  HeaderText="Nilai Amalan" SortExpression="nama"/>
                      <asp:BoundField DataField="nilai2" HeaderText="Nilai Keaktifan" SortExpression="pertemuan" />
                    <asp:BoundField DataField="nilai3"  HeaderText="NIlai Tugas" SortExpression="tanggal"/>
                      <asp:BoundField DataField="nilai4" HeaderText="Nilai UTS" SortExpression="status" />
                    <asp:BoundField DataField="nilai5"  HeaderText="Nilai UAS" SortExpression="keterangan"/>
                    <asp:BoundField DataField="nilaiakhir"  HeaderText="Nilai Akhir" SortExpression="keterangan"/>
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
          selectCommand="SELECT angkel.*, penilaian.*, [mente].* FROM penilaian, [mente], angkel WHERE angkel.nim = [mente].nim and [mente].nim = penilaian.nim and angkel.id_kelompok = @id_kelompok" 
            InsertCommand="INSERT INTO [penilaian] ([nim], [id_bobot]) VALUES (@nim, 'B01')" 
            DeleteCommand="DELETE FROM penilaian WHERE id_penilaian = @id_penilaian">
            <DeleteParameters>
                <asp:Parameter Name="id_penilaian" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="nim" Name="nim" PropertyName="SelectedValue" Type="String" />
                </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="id_kelompok" SessionField="id" />
            </SelectParameters>
            </asp:sqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
            SelectCommand="SELECT p.*, b.* FROM bobot b, penilaian p where p.id_bobot = b.id_bobot and p.id_penilaian = @id_penilaian" >
            <SelectParameters>
                <asp:Parameter Name="id_penilaian" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
      
     <!-- Modal -->
                                    <div class="modal fade" id="dialog-mahasiswa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h3 id="myModalLabel">Tambah Penilaian Siswa</h3>
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

