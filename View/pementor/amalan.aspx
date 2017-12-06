<%@ Page Language="VB" AutoEventWireup="false" CodeFile="amalan.aspx.vb" Inherits="View_pementor_amalan" MasterPageFile="~/Konten1.master" %>
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
        <div class="modal-footer">
                    
         </div>
         
         Pertemuan : <asp:DropDownList ID="DL3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="pertemuan" DataValueField="id_jadwal" >
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
         
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [jadwal] WHERE ([kategori] = @kategori)">
             <SelectParameters>
                 <asp:Parameter DefaultValue="admin" Name="kategori" Type="String" />
             </SelectParameters>
         </asp:SqlDataSource>
         
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nama Siswa : <asp:DropDownList ID="DL4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="nama" DataValueField="nim" >
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
         
         &nbsp;<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT mente.nim, mente.nama FROM mente INNER JOIN angkel ON mente.nim = angkel.nim WHERE (angkel.id_kelompok = @id_kelompok)">
             <SelectParameters>
                 <asp:SessionParameter Name="id_kelompok" SessionField="id" />
             </SelectParameters>
         </asp:SqlDataSource>
         
        &nbsp;
         
        <br />
         <br />
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="id_amal"
                RunAt="Server" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">

                  <EditRowStyle BackColor="#2461BF" />
                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                <HeaderStyle backcolor="#507CD1"
                  forecolor="White" Font-Bold="True" />
                  <AlternatingRowStyle BackColor="White" />
                  <Columns >
                    <asp:BoundField DataField="nama"   HeaderText="Nama"/> 
                      <asp:BoundField DataField="namam"   HeaderText="Amalan Yaummi"/>                        
                    <asp:BoundField DataField="keterangan"  HeaderText="Aktivitas"/>
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
          selectCommand="SELECT am.*, a.*, m.*, aml.*, j.*, aml.nama as namam FROM absenamalan am, mente m, absensi a, amalan aml, jadwal j 
            where aml.id_amalan =  am.id_amalan and m.nim = am.nim and a.id_absen = am.id_absen and j.id_jadwal = a.id_jadwal and
            j.id_jadwal = @pertemuan and am.nim = @nim and j.kategori = 'admin'" 
            DeleteCommand="DELETE FROM absenamalan WHERE id_amal = @id_amal">
            <DeleteParameters>
                <asp:Parameter Name="id_amal" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                    <asp:ControlParameter ControlID="DL3" Name="pertemuan" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="DL4" Name="nim" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:sqlDataSource>

        <br />  
    </form>
</asp:Content>
