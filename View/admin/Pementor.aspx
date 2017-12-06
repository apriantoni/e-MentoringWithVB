<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Pementor.aspx.vb" Inherits="View_admin_Pementor" MasterPageFile="~/Konten.master" %>


<script runat="server">
    Sub Kelompok_OnSelectedIndexChanged(sender As Object, e As EventArgs)
        SqlDataSource1.SelectParameters("id_user").DefaultValue = _
          GridView1.SelectedValue.ToString()
        PementorFormView.DataBind()
    End Sub

</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
         <br />
        
         <a href="#dialog-mahasiswa" id="d" class="btn tambah" data-toggle="modal">
                                            <button id="editable-sample_new" class="btn btn-shadow btn-primary">
                                                Tambah Data Pementor <i class="icon-plus"></i>
                                            </button>
                                        </a>
         <br />
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
         
       
         <div class="modal-footer">
             
         </div>
              <asp:FormView ID="PementorFormView"
                DataSourceID="SqlDataSource1"
                DataKeyNames="id_user"     
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
                        <td align="right"><b>ID Pementor:</b><br /></td><td><asp:TextBox  ID="idp1" runat="server" Text='<%# Eval("id_user")%>' class="form-control" disabled="disabled" /><br />
                            <asp:HiddenField ID="idp" runat="server" value='<%# Eval("id_user")%>'/></td>
                                                                        </td>
                        <td align="right"><b>No. HP Pementor:</b><br /><br /></td>  <td><asp:TextBox ID="nohapep" runat="server" Text='<%# Eval("nohape")%>' class="form-control"/><br /><br /></td>
                    
                    </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Nama Pementor:</b><br /></td> <td><asp:TextBox ID="namap" runat="server" Text='<%# Eval("nama")%>' class="form-control"/><br /></td>
                        <td align="right"><b>Jenis Kelamin:</b><br /><br /></td>
                        <td>
                          <asp:DropDownList ID="DL1" Class="form-control" runat="server">
                             <asp:ListItem>Ikhwan</asp:ListItem>
                             <asp:ListItem>Akhwat</asp:ListItem>
                          </asp:DropDownList><br /><br />
                      </td>
                          </tr>
                    <tr style="width: 50%">
                        <td align="right"><b>Alamat Pementor:</b><br /><br /></td>  <td><asp:TextBox ID="alamatp" runat="server" Text='<%# Eval("alamat")%>' class="form-control"/><br /><br /></td>
                          <td align="right"><b>Password:</b><br /><br /></td>  <td><asp:TextBox ID="passwordp" runat="server" Text='<%# Eval("password")%>' class="form-control"/><br /><br /></td>
                    </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Email Pementor:</b></td>  <td><asp:TextBox ID="emailp" runat="server" Text='<%# Eval("email")%>' class="form-control"/><br /></td>
                        
                      </tr>
                    <tr style="width: 50%">
                        <td align="right">

                        </td>
                        <td align="right" colspan="1">
                            
                         <asp:Button ID="cancelUpdate" OnClick="Button2_Click"
                                        class="btn btn-default" Text="Cancel"
                                        RunAt="server"/>
                          <asp:Button ID="Button1"
                                        class="btn btn-success" Text="Update"  OnClick="Button1_Click"
                                        RunAt="server"/>
                        </td>
                    </tr>
            </table>
                </ItemTemplate>
              </asp:FormView>
         
        <div class="modal-footer">
                    
         </div>
         
        
              Kategori :
         <asp:DropDownList ID="DL3" runat="server" AutoPostBack="True" CssClass="">
             <asp:ListItem>Ikhwan</asp:ListItem>
             <asp:ListItem>Akhwat</asp:ListItem>
         </asp:DropDownList>
         <br />
         <br />
         
        
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="id_user" 
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
                  <asp:BoundField DataField="id_user" HeaderText="ID Pementor"/>
                  <asp:BoundField DataField="nama"   HeaderText="Nama Pementor"/>                        
                  <asp:BoundField DataField="alamat"  HeaderText="Alamat Pementor"/>
                    <asp:BoundField DataField="nohape"  HeaderText="No. HP"/>
                    <asp:BoundField DataField="email"  HeaderText="Email Pementor"/>
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
          selectCommand="SELECT * FROM [user] WHERE jk = @jk and kategori = 'Pementor'" 
            DeleteCommand="DELETE FROM [user] WHERE id_user = @id_user" 
            InsertCommand="INSERT INTO [user] (id_user, nama, alamat, nohape, password, email, jk, kategori) VALUES (@id_user, @nama, @alamat, @nohape, @password, @email, @jk, @kategori)" >
            <DeleteParameters>
                <asp:Parameter Name="id_user" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="id" Name="id_user" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="nama" Name="nama" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="alamat" Name="alamat" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="hape" Name="nohape" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="password" Name="password" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="emailTextBox1" Name="email" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="jk" Name="jk" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter DefaultValue="Pementor" Name="kategori" Type="String" />
                </InsertParameters>
            <SelectParameters>
                    <asp:ControlParameter ControlID="DL3" Name="jk" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:sqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
            SelectCommand="SELECT nama, alamat, nohape, id_user, email, password FROM [user] where id_user = @id_user" >
            <SelectParameters>
                <asp:Parameter Name="id_user" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_user" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
   
     <!-- Modal -->
                                    <div class="modal fade" id="dialog-mahasiswa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h3 id="myModalLabel">Tambah Data Pementor</h3>
                                                </div>
                                                <div class="modal-body">
                                                    ID&nbsp; Pementor
                                                    <asp:TextBox ID="id" runat="server" class="form-control" ></asp:TextBox><br />
                                                    Nama Pementor<asp:TextBox ID="nama" class="form-control" runat="server" ></asp:TextBox><br />
                                                    Alamat Pementor<asp:TextBox ID="alamat" class="form-control" runat="server" ></asp:TextBox><br />
                                                    No. HP<asp:TextBox ID="hape" class="form-control" runat="server" ></asp:TextBox><br />
                                                    E-mail<asp:TextBox ID="emailTextBox1" TextMode="Email" class="form-control" runat="server" ></asp:TextBox><br />
                                                    Jenis Kelamin <asp:DropDownList ID="jk" Class="form-control" runat="server">
                                                      <asp:ListItem>Ikhwan</asp:ListItem>
                                                      <asp:ListItem>Akhwat</asp:ListItem>
                                                    </asp:DropDownList><br />
                                                    Password<asp:TextBox ID="password" TextMode="Password" class="form-control" runat="server" ></asp:TextBox><br />
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