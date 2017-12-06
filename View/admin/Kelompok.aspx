<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Kelompok.aspx.vb" Inherits="View_admin_Kelompok" MasterPageFile="~/Konten.master" %>

<script runat="server">
    Sub Kelompok_OnSelectedIndexChanged(sender As Object, e As EventArgs)
        SqlDataSource1.SelectParameters("id_kelompok").DefaultValue = _
          GridView1.SelectedValue.ToString()
        KelompokFormView.DataBind()
    End Sub

</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
         <br />
        
         <a href="#dialog-mahasiswa" id="d" class="btn tambah" data-toggle="modal">
                                            <button id="editable-sample_new" class="btn btn-shadow btn-primary">
                                                Tambah Data Kelompok <i class="icon-plus"></i>
                                            </button>
                                        </a>
         <br />
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
         
       
         <div class="modal-footer"></div>
              <asp:FormView ID="KelompokFormView"
                DataSourceID="SqlDataSource1"
                DataKeyNames="id_kelompok"     
                Gridlines="Both" 
                BorderColor="White"
                  RunAt="server" Width="100%">

                <HeaderStyle backcolor="Navy"
                  forecolor="White"/>

                <RowStyle backcolor="White"/>         

                <EditRowStyle backcolor="LightCyan"/>

                <ItemTemplate>
                  <table style="width: 100%"; position: center">
                    <tr  style="width: 50%">
                        <td align="right"><b>ID Kelompok:</b><br /></td><td><asp:TextBox ID="ids1" runat="server" Width="70%" Text='<%# Eval("id_kelompok")%>' class="form-control" disabled="disabled" />
                            <asp:HiddenField ID="ids" runat="server" value='<%# Eval("id_kelompok")%>'/><br /></td>
                        <td></td>
                            </tr>
                    <tr  style="width: 50%"><td align="right"><b>Nama Kelompok:</b><br /></td> <td><asp:TextBox ID="nama2" Width="70%" runat="server" Text='<%# Eval("nama_kelompok")%>' class="form-control"/><br /></td>
                      <td></td>
                    </tr>
                    <tr  style="width: 50%"><td align="right"><b>ID Pementor:</b><br /><br /></td>  <td><asp:DropDownList ID="mentor2" Width="70%" class="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="nama" DataValueField="id_user"></asp:DropDownList><br /><br /></td>
                     <td></td>
                    </tr>
                      <tr  style="width: 50%">
                        <td></td>
                      <td colspan="10">
                        
                         <asp:Button ID="cancelUpdate"
                                        class="btn btn-default" Text="Cancel" OnClick="Button2_Click"
                                        RunAt="server"/>
                          <asp:Button ID="update"
                                        class="btn btn-success" Text="Update"  OnClick="update_Click"
                                        RunAt="server"/>
                         
                      </td>
                    </tr>
                    </table>                 
                </ItemTemplate>
              </asp:FormView>
        <div class="modal-footer"></div>
         
        
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="id_kelompok" 
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

                  <asp:BoundField DataField="id_kelompok" HeaderText="ID Kelompok"/>
                  <asp:BoundField DataField="nama_kelompok"   HeaderText="Nama Kelompok"/>                        
                  <asp:BoundField DataField="nama"  HeaderText="Pementor"/>
                    <asp:BoundField DataField="nim"  HeaderText="NIM Ketua Kelompok"/>

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
          selectCommand="SELECT kelompok.*, [user].*
            FROM [user], kelompok where [user].id_user = kelompok.id_user"
            DeleteCommand="DELETE kelompok WHERE id_kelompok = @id_kelompok"  
            InsertCommand="INSERT INTO kelompok(id_kelompok, nama_kelompok, id_user) VALUES (@id_kelompok, @nama_kelompok, @id_user)" >
            <DeleteParameters>
                <asp:Parameter Name="id_kelompok" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="id" Name="id_kelompok" PropertyName="Text" />
                <asp:ControlParameter ControlID="nama" Name="nama_kelompok" PropertyName="Text" />
                <asp:ControlParameter ControlID="mentor" Name="id_user" PropertyName="SelectedValue" />
                </InsertParameters>
        </asp:sqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
            SelectCommand="SELECT kelompok.id_kelompok, kelompok.nama_kelompok, [user].nama, kelompok.nim FROM kelompok INNER JOIN [user] ON kelompok.id_user = [user].id_user where kelompok.id_kelompok = @id_kelompok" >
            
            <SelectParameters>
                <asp:Parameter Name="id_kelompok" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_kelompok" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
   
     <!-- Modal -->
                                    <div class="modal fade" id="dialog-mahasiswa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h3 id="myModalLabel">Tambah Data Kelompok</h3>
                                                </div>
                                                <div class="modal-body">
                                                    ID&nbsp; Kelompok
                                                    <asp:TextBox ID="id" runat="server" class="form-control" ></asp:TextBox>
                                                    &nbsp;<br />
        <br />
        Nama Kelompok
                                                    <asp:TextBox ID="nama" class="form-control" runat="server" ></asp:TextBox>
        &nbsp;<br />
        <br />
        Nama Pementor
        <asp:DropDownList ID="mentor" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="nama" DataValueField="id_user" AutoPostBack="True">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
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