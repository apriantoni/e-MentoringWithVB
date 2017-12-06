<%@ Page Language="VB" AutoEventWireup="false" CodeFile="penilaian.aspx.vb" Inherits="View_admin_penilaian" MasterPageFile="~/Konten.master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
         <br />
         <br />
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [kelompok]"></asp:SqlDataSource>
         
         
          Kelompok :
            <asp:DropDownList ID="DL" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="nama_kelompok" DataValueField="id_kelompok">
            </asp:DropDownList>
         <br /><br />
        <div class="modal-footer">
                    
                    
         </div>
        
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="id_penilaian"
                RunAt="Server" AllowPaging="True" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">

                  <EditRowStyle BackColor="#2461BF" />
                  <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                <HeaderStyle backcolor="#507CD1"
                  forecolor="White" Font-Bold="True" />

                  <AlternatingRowStyle BackColor="White" />

                <Columns >
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
          selectCommand="SELECT angkel.*, penilaian.*, [mente].*, bobot.* FROM penilaian, [mente], angkel, bobot WHERE angkel.nim = [mente].nim and [mente].nim = penilaian.nim and bobot.id_bobot = penilaian.id_bobot and angkel.id_kelompok = @id_kelompok" >
            <InsertParameters>
                <asp:ControlParameter ControlID="nim" Name="nim" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="am" Name="nilai1" PropertyName="Text" Type="Int32" />
                </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="DL" Name="id_kelompok" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
            </asp:sqlDataSource>
        
    </form>
</asp:Content>

