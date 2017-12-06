<%@ Page Language="VB" AutoEventWireup="false" CodeFile="AbsenMente.aspx.vb" Inherits="View_admin_AbsenMente" MasterPageFile="~/Konten.master" %>

<script runat="server">
    Sub Kelompok_OnSelectedIndexChanged(sender As Object, e As EventArgs)
        SqlDataSource1.SelectParameters("id_absen").DefaultValue = _
          GridView1.SelectedValue.ToString()
        PementorFormView.DataBind()
    End Sub
</script>


<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
         <br />
        
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
                        <td align="right"><b>NIM Siswa :</b><br /></td><td><asp:TextBox ID="idp1" Width="70%" runat="server" Text='<%# Eval("nim")%>' class="form-control" disabled="disabled" /><br /></td>
                        <asp:HiddenField ID="idp" runat="server" value='<%# Eval("id_absen")%>' />
                    <tr style="width: 50%">
                        <td align="right"><b>Status Validasi :</b><br /><br /></td>  <td> <asp:DropDownList ID="validp" Width="70%" runat="server" class="form-control" DataTextField="nama_kelompok" DataValueField="id_kelompok" >
                                                        <asp:ListItem>Tidak Disetujui</asp:ListItem>
                                                        <asp:ListItem>Disetujui</asp:ListItem>
                                                    </asp:DropDownList><br />
                                                    
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
         
         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Kelompok :
         <asp:DropDownList ID="D1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="nama_kelompok" DataValueField="id_kelompok">
         </asp:DropDownList>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [kelompok]"></asp:SqlDataSource>
&nbsp;<asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [materi]"></asp:SqlDataSource>
         
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
                      
                      <asp:BoundField DataField="nim"   HeaderText="NIM" SortExpression="nim" ReadOnly="True"/>                        
                    <asp:BoundField DataField="nama"  HeaderText="Nama Siswa" SortExpression="nama"/>
                      <asp:BoundField DataField="pertemuan" HeaderText="Pertemuan" SortExpression="pertemuan" />
                    <asp:BoundField DataField="tanggal"  HeaderText="Tanggal" SortExpression="tanggal"/>
                      <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                    <asp:BoundField DataField="keterangan"  HeaderText="Keterangan" SortExpression="keterangan"/>
                    <asp:BoundField DataField="validasi"  HeaderText="Validasi" SortExpression="validasi"/>
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
          selectCommand="SELECT mente.nim, mente.nama, jadwal.pertemuan, jadwal.tanggal, absensi.status, absensi.keterangan, absensi.id_absen, absensi.validasi FROM absensi INNER JOIN jadwal ON absensi.id_jadwal = jadwal.id_jadwal INNER JOIN mente ON absensi.nim = mente.nim WHERE (jadwal.pertemuan = @pertemuan) AND (jadwal.id_kelompok = @id_kelompok)" 
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
                <asp:ControlParameter ControlID="DL3" Name="pertemuan" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="D1" Name="id_kelompok" PropertyName="SelectedValue" />
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
        
    </form>
</asp:Content>

