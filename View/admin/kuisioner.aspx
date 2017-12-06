<%@ Page Language="VB" AutoEventWireup="false" CodeFile="kuisioner.aspx.vb" Inherits="View_admin_kuisioner" MasterPageFile="~/Konten.master" %>

<script runat="server">
    Sub Kelompok_OnSelectedIndexChanged(sender As Object, e As EventArgs)
        SqlDataSource1.SelectParameters("id_kuisioner").DefaultValue = _
          GridView1.SelectedValue.ToString()
        PementorFormView.DataBind()
    End Sub

</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
         <br />
        
         <a href="#dialog-mahasiswa" id="d" class="btn tambah" data-toggle="modal">
                                            <button id="editable-sample_new" class="btn btn-shadow btn-primary">
                                                Tambah Data Kuisioner <i class="icon-plus"></i>
                                            </button>
                                        </a>
         <br />
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [kuisioner]"></asp:SqlDataSource>
         
       
         <div class="modal-footer">
             
         </div>
              <asp:FormView ID="PementorFormView"
                DataSourceID="SqlDataSource1"
                DataKeyNames="id_kuisioner"     
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
                        <td align="right"><b>ID Kuisioner:</b><br /></td><td><asp:TextBox  ID="idp1" runat="server" Text='<%# Eval("id_kuisioner")%>' class="form-control" disabled="disabled" /><br />
                            <asp:HiddenField ID="idp" runat="server" value='<%# Eval("id_kuisioner")%>'/></td>
                                                                        </td>
                        <td align="right"><b>Keterangan:</b><br /><br /></td>  <td><asp:TextBox ID="ketp" runat="server" TextMode="MultiLine" Text='<%# Eval("keterangan")%>' class="form-control"/><br /><br /></td>
                    
                    </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Bobot Nilai:</b><br /></td> <td><asp:TextBox ID="bobotp" runat="server" Text='<%# Eval("bobot")%>' class="form-control"/><br /></td> 
                <td align="right"><b>Status:</b><br /><br /></td>
                          <td>
                          <asp:DropDownList ID="DL1" Class="form-control" runat="server">
                             <asp:ListItem>aktif</asp:ListItem>
                             <asp:ListItem>tidak aktif</asp:ListItem>
                          </asp:DropDownList>
                      </td>
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
         
         <br />
         
        
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="id_kuisioner" 
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

                  <asp:BoundField DataField="id_kuisioner" HeaderText="ID Kuisioner"/>
                  <asp:BoundField DataField="keterangan"   HeaderText="Keterangan"/>                        
                  <asp:BoundField DataField="bobot"  HeaderText="Bobot Nilai"/>
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
          selectCommand="SELECT * FROM kuisioner" 
            DeleteCommand="DELETE FROM kuisioner WHERE id_kuisioner = @id_kuisioner" 
            InsertCommand="INSERT INTO kuisioner (id_kuisioner, keterangan, bobot, status) VALUES (@id_kuisioner, @keterangan, @bobot, @status)" 
            UpdateCommand="UPDATE kuisioner SET keterangan = @keterangan, bobot = @bobot, status = @status WHERE id_kuisioner = @id_kuisioner">
            <DeleteParameters>
                <asp:Parameter Name="id_kuisioner" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="id" Name="id_kuisioner" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="keterangan" Name="keterangan" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="bobot" Name="bobot" PropertyName="Text" Type="Int32" />
                <asp:ControlParameter ControlID="status" Name="status" PropertyName="SelectedValue" Type="String" />
                </InsertParameters>
            </asp:sqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
            SelectCommand="SELECT id_kuisioner, keterangan, bobot, status FROM kuisioner where id_kuisioner = @id_kuisioner" >
            <SelectParameters>
                <asp:Parameter Name="id_kuisioner" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="id_kuisioner" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
   
     <!-- Modal -->
                                    <div class="modal fade" id="dialog-mahasiswa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h3 id="myModalLabel">Tambah Data Kuisioner</h3>
                                                </div>
                                                <div class="modal-body">
                                                    ID&nbsp; Kuisionetr <asp:TextBox ID="id" runat="server" class="form-control" ></asp:TextBox><br />
                                                    Keterangan <asp:TextBox ID="keterangan" TextMode="MultiLine" class="form-control" runat="server" ></asp:TextBox><br />
                                                    Bobot Nilai<asp:TextBox ID="bobot" class="form-control" runat="server" ></asp:TextBox><br />
                                                    Status <asp:DropDownList ID="status" Class="form-control" runat="server">
                                                      <asp:ListItem>aktif</asp:ListItem>
                                                      <asp:ListItem>tidak aktif</asp:ListItem>
                                                    </asp:DropDownList><br />
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