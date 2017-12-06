<%@ Page Language="VB" AutoEventWireup="false" CodeFile="requestJadwal.aspx.vb" Inherits="View_admin_requestJadwal" MasterPageFile="~/Konten.master" %>

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
                  <table>
                    <tr >
                        <td><b>ID Jadwal :</b><br /><asp:TextBox ID="idp1" Width="400px" runat="server" Text='<%# Eval("id_jadwal")%>' class="form-control" disabled="disabled" /><br /></td>
                        <asp:HiddenField ID="idp" runat="server" value='<%# Eval("id_jadwal")%>' />
                    </tr>
                    <tr>
                        <td><b>Status :</b><br /><br /> <asp:DropDownList ID="statusp" Class="form-control" runat="server">
                             <asp:ListItem>Diterima</asp:ListItem>
                             <asp:ListItem>Ditolak</asp:ListItem>
                          </asp:DropDownList><br /><br /></td>
                    </tr>
                    <tr>
                        
                       <td >
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
                    <asp:BoundField DataField="id_jadwal" HeaderText="ID"/>
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
          selectCommand="SELECT * FROM jadwal where kategori = 'mentor' order by tanggal desc "  >
            <SelectParameters>
                    
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

    </form>
</asp:Content>
