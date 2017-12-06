<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Dashboard.aspx.vb" Inherits="View_admin_Dashboard" MasterPageFile="~/Konten.master" %>
<script runat="server"> 
    Sub Kelompok_OnSelectedIndexChanged(sender As Object, e As EventArgs)
        SqlDataSource2.SelectParameters("id_berita").DefaultValue = _
          GridView1.SelectedValue.ToString()
        PementorFormView.DataBind()
    End Sub
</script>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
          <br />
          Kelompok :
          <asp:DropDownList ID="DL1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="nama_kelompok" DataValueField="id_kelompok">
          </asp:DropDownList>
          <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [kelompok]"></asp:SqlDataSource>
          <br />        <br /><br />
         <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource1">
             <Series>
                 <asp:Series Name="Series1" XValueMember="nama" YValueMembers="presensi">
                 </asp:Series>
             </Series>
             <ChartAreas>
                 <asp:ChartArea Name="ChartArea1">
                 </asp:ChartArea>
             </ChartAreas>
         </asp:Chart>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
             SelectCommand="SELECT round((( select count(status) from absensi where status like 'Hadir' and validasi like 'Disetujui' group by id_jadwal) / 1), 2) as presensi, mt.keterangan as nama
                         FROM [mente] m, absensi a, jadwal j, materi mt
                         where m.nim = a.nim and a.id_jadwal = j.id_jadwal and mt.pertemuan = j.pertemuan
                         and j.id_kelompok = @id_kelompok GROUP BY mt.keterangan" >
             <SelectParameters>
                <asp:ControlParameter ControlID="DL1" Name="id_kelompok" PropertyName="SelectedValue" />
            </SelectParameters>
         </asp:SqlDataSource>
         <br />
        
         <br />
        
         <h4></h4>
        
       
         <div class="modal-footer">
             
         </div>
         <asp:FormView ID="PementorFormView"
                DataSourceID="SqlDataSource2"
                DataKeyNames="id_berita"     
                Gridlines="Both" 
                BorderColor="White"
                  RunAt="server" Width="100%">

                <HeaderStyle backcolor="Navy"
                  forecolor="White"/>

                <RowStyle backcolor="White"/>         

                  <EditRowStyle backcolor="LightCyan"/>
                <ItemTemplate>
                  <table style="width: 100%"; position: center">
                    <tr style="width: 100%">
                        <td><center><h4><asp:label ID="judul" runat="server" Text='<%# Eval("judul")%>' /></h4></center><br /></td>
                    </tr>
                      <tr style="width: 100%">
                        <td><asp:label ID="isi" runat="server" Text='<%# Eval("isi")%>' HtmlEncode="False"/><br /></td>
                    </tr>
                    <tr style="width: 100%">
                        
                        <td><center>
                            <br /><br /><br /><br />
                         <asp:Button ID="cancelUpdate" OnClick="Button2_Click"
                                        class="btn btn-primary" Text="Tutup Berita"
                                        RunAt="server"/>
                          </center><br />
                        </td>
                    </tr>
            </table>
                </ItemTemplate>
              </asp:FormView>
         
        <div class="modal-footer">
                    
         </div>
        
              <asp:GridView class="table table-striped" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="id_berita" 
                OnSelectedIndexChanged="Kelompok_OnSelectedIndexChanged"
                RunAt="Server" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">

                  <FooterStyle BackColor="#CCCC99" ForeColor="Black" />

                <HeaderStyle backcolor="#333333"
                  forecolor="White" Font-Bold="True" />

                <Columns >
                  <asp:BoundField DataField="judul"   HeaderText="Judul Berita" SortExpression="judul" ItemStyle-Width="70%" ItemStyle-ForeColor="#0066FF" />                        
                  <asp:BoundField DataField="tanggal"  HeaderText="Tanggal" SortExpression="tanggal"/>
                    <asp:ButtonField Text='<div class="btn btn-success waves-effect waves-light btn-xs m-b-5"><i class="fa fa-search "></i> Lihat</div></a>'
                    HeaderText=""
                    CommandName="Select"/>
                 </Columns>

                  <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                  <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                  <SortedAscendingCellStyle BackColor="#F7F7F7" />
                  <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                  <SortedDescendingCellStyle BackColor="#E5E5E5" />
                  <SortedDescendingHeaderStyle BackColor="#242121" />

              </asp:GridView>

                <br />

        <asp:sqlDataSource ID="KelompokSqlDataSource" ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
          RunAt="server" 
          selectCommand="SELECT * FROM [berita] ORDER BY tanggal DESC" 
            DeleteCommand="DELETE FROM [berita] WHERE [id_berita] = @id_berita" 
            InsertCommand="INSERT INTO [berita] ([judul], [tanggal], [isi], [id_user], [status]) VALUES (@judul, @tanggal, @isi, @id_user, @status)" UpdateCommand="UPDATE [berita] SET [judul] = @judul, [tanggal] = @tanggal, [isi] = @isi, [id_user] = @id_user, [status] = @status WHERE [id_berita] = @id_berita" >
            </asp:sqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
            SelectCommand="SELECT * FROM berita where id_berita = @id_berita" >
            <SelectParameters>
                <asp:Parameter Name="id_berita" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        
    </form>
</asp:Content>