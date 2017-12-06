<%@ Page Language="VB" AutoEventWireup="false" CodeFile="listAnggota.aspx.vb" Inherits="View_admin_listAnggota" MasterPageFile="~/Konten.master" %>

<script runat="server">
    Sub Kelompok_OnSelectedIndexChanged(sender As Object, e As EventArgs)
        SqlDataSource1.SelectParameters("id").DefaultValue = _
          GridView1.SelectedValue.ToString()
        KelompokFormView.DataBind()
    End Sub

</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
        <br />
         <a href="#dialog-mahasiswa" id="d" class="btn tambah" data-toggle="modal">
                                            <button id="editable-sample_new" class="btn btn-shadow btn-primary">
                                                Tambah Anggota Kelompok <i class="icon-plus"></i>
                                            </button>
                                        </a>
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
                        <td align="right"><b>NIM Siswa:</b><br /></td>
                        <td><asp:TextBox ID="ids1" runat="server" Text='<%# Eval("nim")%>' class="form-control" disabled="disabled" />
                            <asp:HiddenField ID="nimp" runat="server" value='<%# Eval("nim")%>'/><br />
                            <asp:HiddenField ID="idp" runat="server" value='<%# Eval("id")%>'/><br />
                        </td>
                        <td align="right"><b>Status Anggota:</b><br /></td>
                        <td><asp:DropDownList ID="statusp" Class="form-control" runat="server">
                             <asp:ListItem>aktif</asp:ListItem>
                             <asp:ListItem>tidak aktif</asp:ListItem>
                          </asp:DropDownList></td>
                        </td>
                    </tr>
                    <tr  style="width: 50%">
                        <td align="right"><b>Kelompok :</b><br /></td><td>
                            <asp:DropDownList ID="kelompokp" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="nama_kelompok" DataValueField="id_kelompok"></asp:DropDownList>
                        </td>
                        <td></td><td></td>
                    </tr>
                      <tr  style="width: 50%">
                          <td></td>
                          <td colspan="10">
                            <br />
                                <asp:Button ID="cancelUpdate"
                                        class="btn btn-default" Text="Cancel" OnClick="Button2_Click"
                                        RunAt="server"/>
                                <asp:Button ID="update"
                                        class="btn btn-success" Text="Update"  OnClick="update_Click"
                                        RunAt="server"/>
                            <br /><br />
                        </td>
                     </tr>
              </table>                 
                </ItemTemplate>
              </asp:FormView>
        <div class="modal-footer"></div>
       
              Kelompok :
         <asp:DropDownList ID="DL3" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="nama_kelompok" DataValueField="id_kelompok">
         </asp:DropDownList>
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [kelompok]"></asp:SqlDataSource>
         <br />
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
                    <asp:ButtonField Text='<div class="btn btn-success waves-effect waves-light btn-xs m-b-5"><i class="fa fa-pencil "></i></div></a>'
                    HeaderText=""
                    CommandName="Select"/>  
                    <asp:CommandField ShowDeleteButton="True" DeleteText='<div class="btn btn-danger waves-effect waves-light btn-xs m-b-5"><i class="fa fa-trash "></i></div></a>'/>
                    <asp:BoundField DataField="nama"   HeaderText="Nama Mente"/>                        
                  <asp:BoundField DataField="nama_kelompok" HeaderText="Kelompok"/>
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
          selectCommand="SELECT k.nama_kelompok, m.nama, a.*
             FROM kelompok k, angkel a, mente m 
            where k.id_kelompok = a.id_kelompok and a.nim = m.nim and a.id_kelompok = @id_kelompok" 
            DeleteCommand="DELETE angkel WHERE id = @id" 
            InsertCommand="INSERT INTO angkel(nim, status, id_kelompok) VALUES (@nim, @status, @id_kelompok)" >
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="kelompok" Name="id_kelompok" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="nim" Name="nim" PropertyName="Text" />
                <asp:ControlParameter ControlID="status" Name="status" PropertyName="SelectedValue" />
                </InsertParameters>
             <SelectParameters>
                    <asp:ControlParameter ControlID="DL3" Name="id_kelompok" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
        </asp:sqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
            SelectCommand="SELECT k.nama_kelompok, m.nama, a.* 
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
   
     <!-- Modal -->
                                    <div class="modal fade" id="dialog-mahasiswa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h3 id="myModalLabel">Tambah Anggota Kelompok</h3>
                                                </div>
                                                <div class="modal-body">
                                                    NIM&nbsp;
                                                    <asp:TextBox ID="nim" runat="server" class="form-control" ></asp:TextBox>
                                                    &nbsp;<br />
        <br />
                                                    Kelompok&nbsp;
        <asp:DropDownList ID="kelompok" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="nama_kelompok" DataValueField="id_kelompok">
                                                    </asp:DropDownList>
        &nbsp;<br />
                                                    <br />
                                                    Status<asp:DropDownList ID="status" runat="server" class="form-control">
                                                        <asp:ListItem>aktif</asp:ListItem>
                                                        <asp:ListItem>tidak aktif</asp:ListItem>
                                                    </asp:DropDownList>
&nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [kelompok]"></asp:SqlDataSource>
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


