<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Mente.aspx.vb" Inherits="View_admin_Mente" MasterPageFile="~/Konten.master" %>


<script runat="server">
    Sub Kelompok_OnSelectedIndexChanged(sender As Object, e As EventArgs)
        SqlDataSource1.SelectParameters("nim").DefaultValue = _
          GridView1.SelectedValue.ToString()
        PementorFormView.DataBind()
    End Sub

</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
         <br />
        
         <a href="#dialog-mahasiswa" id="d" class="btn tambah" data-toggle="modal">
                                            <button id="editable-sample_new" class="btn btn-shadow btn-primary">
                                                Tambah Data Siswa <i class="icon-plus"></i>
                                            </button>
                                        </a>
         <br />
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [pementor]"></asp:SqlDataSource>
         
       
         <div class="modal-footer"></div>
              <asp:FormView ID="PementorFormView"
                DataSourceID="SqlDataSource1"
                DataKeyNames="nim"     
                Gridlines="Both" 
                BorderColor="White" Width="100%"
                  RunAt="server">

                <HeaderStyle backcolor="Navy"
                  forecolor="White"/>

                <RowStyle backcolor="White"/>         

                  <EditRowStyle backcolor="LightCyan"/>
                <ItemTemplate>
                  <table style="width: 100%"; position: center">
                    <tr style="width: 50%">
                        <td align="right"><b>NIM :</b><br /></td><td><asp:TextBox ID="idp1" runat="server" Text='<%# Eval("nim")%>' class="form-control" disabled="disabled" /><br /></td>
                        <asp:HiddenField ID="idp" runat="server" value='<%# Eval("nim")%>' />
                        <td></td>
                        <td align="right"><b>No. HP :</b><br /><br /></td>  <td><asp:TextBox ID="nohapep" runat="server" Text='<%# Eval("nohape")%>' class="form-control"/><br /><br /></td>
                    
                    </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Nama Siswa :</b><br /></td> <td><asp:TextBox ID="namap" runat="server" Text='<%# Eval("nama")%>' class="form-control"/><br /></td> 
                        <td></td>
                       <td align="right"><b>Kelas :</b><br /><br /></td>  <td><asp:TextBox ID="kelasp" runat="server" Text='<%# Eval("kelas")%>' class="form-control"/><br /><br /></td>
                    </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Prodi :</b><br /><br /></td>  <td>
                            <asp:DropDownList ID="prodip" runat="server" CssClass="form-control">
                                                        <asp:ListItem>Akuntansi</asp:ListItem>
                                                        <asp:ListItem>Teknik Mekatronika</asp:ListItem>
                                                        <asp:ListItem>Teknik Eletkronika Telekomunikasi</asp:ListItem>
                                                        <asp:ListItem>Teknik Mesin</asp:ListItem>
                                                        <asp:ListItem>Teknik Listrik</asp:ListItem>
                                                        <asp:ListItem>Teknik Elektronika</asp:ListItem>
                                                        <asp:ListItem>Teknik Informatika</asp:ListItem>
                                                        <asp:ListItem>Teknik Komputer</asp:ListItem>
                                                        <asp:ListItem>Sistem Informasi</asp:ListItem>
                                                        <asp:ListItem>Teknik Telekomunikasi</asp:ListItem>
                                                    </asp:DropDownList>
                            <br /><br /></td>
                        <td></td> 
                          <td align="right"><b>Jenis Kelamin:</b><br /><br /></td> 
                        <td>
                          <asp:DropDownList ID="DL1" Class="form-control" runat="server">
                             <asp:ListItem>Ikhwan</asp:ListItem>
                             <asp:ListItem>Akhwat</asp:ListItem>
                          </asp:DropDownList><br />
                      </td>
                      </tr>
                    <tr style="width: 50%">
                        <td align="right"><b>Alamat Siswa :</b><br /><br /></td>  <td><asp:TextBox ID="alamatp" runat="server" Text='<%# Eval("alamat")%>' class="form-control"/><br /><br /></td>
                        <td></td>  
                        <td align="right"><b>Password :</b><br /><br /></td>  <td><asp:TextBox ID="passwordp" runat="server" Text='<%# Eval("password")%>' class="form-control"/><br /><br /></td>
                    </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Email Siswa :</b><br /><br /></td>  <td><asp:TextBox ID="emailp" runat="server" Text='<%# Eval("email")%>' class="form-control"/><br /><br /></td>
                        <td>
                            
                        
                      </tr>
                        </td>
                     <tr style="width:50%">
                         <td align="right"></td>
                       <td align="right" colspan="1">
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
         Jenis Kelamin :
         <asp:DropDownList ID="jkl" runat="server" AutoPostBack="True">
             <asp:ListItem>Ikhwan</asp:ListItem>
             <asp:ListItem>Akhwat</asp:ListItem>
         </asp:DropDownList>
         <br />
         <br />
        
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="nim" 
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
                    <asp:BoundField DataField="NIM" HeaderText="NIM"/>
                    <asp:BoundField DataField="nama"   HeaderText="Nama Siswa"/>                        
                    <asp:BoundField DataField="kelas"  HeaderText="Kelas"/>
                    <asp:BoundField DataField="alamat"  HeaderText="Alamat"/>
                    <asp:BoundField DataField="nohape"  HeaderText="No. HP"/>
                    <asp:BoundField DataField="email"  HeaderText="Email"/>
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
          selectCommand="SELECT * FROM mente where jk = @jk" 
            DeleteCommand="DELETE FROM mente WHERE nim = @nim" 
            InsertCommand="INSERT INTO mente (nim, nama, password, kelas, prodi, alamat, nohape, email, jk) VALUES (@nim, @nama, @password, @kelas, @prodi, @alamat, @nohape, @email, @jk)">
            <DeleteParameters>
                <asp:Parameter Name="nim" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="id" Name="nim" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="nama" Name="nama" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="alamat" Name="alamat" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="nohape" Name="nohape" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="password" Name="password" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="email" Name="email" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="prodi" Name="prodi" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="kelas" Name="kelas" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="jk" Name="jk" PropertyName="SelectedValue" Type="String" />
                </InsertParameters>
            <SelectParameters>
                    <asp:ControlParameter ControlID="jkl" Name="jk" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:sqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
            SelectCommand="SELECT * from mente where nim = @nim" >
            <SelectParameters>
                <asp:Parameter Name="nim" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="nim" Type="String" />
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
                                                    NIM
                                                    <asp:TextBox ID="id" runat="server" class="form-control" ></asp:TextBox>
                                                    <br />
                                                    Nama <asp:TextBox ID="nama" class="form-control" runat="server" ></asp:TextBox>
                                                    <br />
                                                    Kelas <asp:TextBox ID="kelas" class="form-control" runat="server" ></asp:TextBox>
                                                    <br />
                                                    Prodi 
                                                    <asp:DropDownList ID="prodi" runat="server" CssClass="form-control">
                                                        <asp:ListItem>Akuntansi</asp:ListItem>
                                                        <asp:ListItem>Teknik Mekatronika</asp:ListItem>
                                                        <asp:ListItem>Teknik Eletkronika Telekomunikasi</asp:ListItem>
                                                        <asp:ListItem>Teknik Mesin</asp:ListItem>
                                                        <asp:ListItem>Teknik Listrik</asp:ListItem>
                                                        <asp:ListItem>Teknik Elektronika</asp:ListItem>
                                                        <asp:ListItem>Teknik Informatika</asp:ListItem>
                                                        <asp:ListItem>Teknik Komputer</asp:ListItem>
                                                        <asp:ListItem>Sistem Informasi</asp:ListItem>
                                                        <asp:ListItem>Teknik Telekomunikasi</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br />
                                                    Alamat <asp:TextBox ID="alamat" class="form-control" runat="server" ></asp:TextBox>
                                                    <br />
                                                    No. HP<asp:TextBox ID="nohape" class="form-control" runat="server" ></asp:TextBox>
                                                    <br />
                                                    E-mail<asp:TextBox ID="email" TextMode="Email" class="form-control" runat="server" ></asp:TextBox>
                                                    <br />
                                                    Jenis Kelamin <asp:DropDownList ID="jk" Class="form-control" runat="server">
                                                      <asp:ListItem>Ikhwan</asp:ListItem>
                                                      <asp:ListItem>Akhwat</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <br />
                                                    Password<asp:TextBox ID="password" TextMode="Password" class="form-control" runat="server" ></asp:TextBox>
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