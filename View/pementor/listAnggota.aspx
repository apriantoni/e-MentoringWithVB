<%@ Page Language="VB" AutoEventWireup="false" CodeFile="listAnggota.aspx.vb" Inherits="View_pementor_listAnggota" MasterPageFile="~/Konten1.master" %>
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
        SqlDataSource1.SelectParameters("id").DefaultValue = _
          GridView1.SelectedValue.ToString()
        KelompokFormView.DataBind()
    End Sub

</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
        
       <br /><br />
         <div class="modal-footer"></div>
              <asp:FormView ID="KelompokFormView"
                DataSourceID="SqlDataSource1"
                DataKeyNames="id"     
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
                        <td align="right"><b>NIM Siswa :</b><br /></td>
                        <td><asp:TextBox ID="nim" runat="server" Text='<%# Eval("nim")%>' class="form-control" disabled="disabled" />
                        <br /></td>
                        <td align="right"><b>Alamat :</b><br /></td>
                        <td><asp:TextBox ID="alamat" runat="server" Text='<%# Eval("alamat")%>' class="form-control" disabled="disabled" /></td>
                    </tr>
                    <tr style="width: 50%">
                        <td align="right"><b>Nama Siswa :</b><br /></td>
                        <td><asp:TextBox ID="nama" runat="server" Text='<%# Eval("nama")%>' class="form-control" disabled="disabled" />
                        <br /></td>
                        <td align="right"><b>No. Handphone :</b><br /></td>
                        <td><asp:TextBox ID="nohape" runat="server" Text='<%# Eval("nohape")%>' class="form-control" disabled="disabled" /></td>
                    </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Kelas :</b><br /></td>
                        <td><asp:TextBox ID="kelas" runat="server" Text='<%# Eval("kelas")%>' class="form-control" disabled="disabled" />
                        <br /></td>
                        <td align="right"><b>Email :</b><br /></td>
                        <td><asp:TextBox ID="email" runat="server" Text='<%# Eval("email")%>' class="form-control" disabled="disabled" /></td>
                    </tr>  
                      <tr style="width: 50%">
                        <td align="right"><b>Program Studi :</b></td>
                        <td><asp:TextBox ID="prodi" runat="server" Text='<%# Eval("prodi")%>' class="form-control" disabled="disabled" />
                        <br /></td>
                        <td align="right"><b>Jenis Kelamin :</b><br /></td>
                        <td><asp:TextBox ID="jk" runat="server" Text='<%# Eval("jk")%>' class="form-control" disabled="disabled" /></td>
                    </tr> 
                      <tr  style="width: 50%">
                          <td></td>
                          <td colspan="10">
                            <br />
                                <asp:Button ID="cancelUpdate"
                                        class="btn btn-primary" Text="Tutup Detail" OnClick="Button2_Click"
                                        RunAt="server"/>
                                
                            <br /><br />
                        </td>
                     </tr>
              </table>                 
                </ItemTemplate>
              </asp:FormView>
        <div class="modal-footer"></div>
       
             
&nbsp;<asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="id" 
                OnSelectedIndexChanged="Kelompok_OnSelectedIndexChanged"
                RunAt="Server" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">

                  <EditRowStyle BackColor="#2461BF" />
                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                <HeaderStyle backcolor="#507CD1"
                  forecolor="White" Font-Bold="True" />

                  <AlternatingRowStyle BackColor="White" />

                <Columns >
                    <asp:ButtonField Text='<div class="btn btn-success waves-effect waves-light btn-xs m-b-5"><i class="fa fa-search "></i> Lihat Detail</div>'
                    HeaderText=""
                    CommandName="Select"/>  
                    <asp:BoundField DataField="nim"   HeaderText="NIM"/>
                    <asp:BoundField DataField="nama"   HeaderText="Nama Mente"/> 
                    <asp:BoundField DataField="kelas"   HeaderText="Kelas"/> 
                    <asp:BoundField DataField="prodi"   HeaderText="Program Studi"/> 
                    <asp:BoundField DataField="email"   HeaderText="Email"/>                        
                  <asp:BoundField DataField="nama_kelompok" HeaderText="Kelompok"/>
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
          selectCommand="SELECT m.*, k.*, a.*
             FROM kelompok k, angkel a, mente m 
            where k.id_kelompok = a.id_kelompok and a.nim = m.nim and a.id_kelompok = @id_kelompok"  >
             <SelectParameters>
                 <asp:SessionParameter Name="id_kelompok" SessionField="id" />
             </SelectParameters>
        </asp:sqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
            SelectCommand="SELECT k.*, m.*, a.* 
             FROM kelompok k, angkel a, mente m 
            where k.id_kelompok = a.id_kelompok and a.nim = m.nim and a.id= @id" >
            
            <SelectParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
   
    </form>
</asp:Content>

