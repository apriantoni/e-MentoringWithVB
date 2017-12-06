﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Materi.aspx.vb" Inherits="View_admin_Materi" MasterPageFile="~/Konten.master" %>

<script runat="server">
    Sub Kelompok_OnSelectedIndexChanged(sender As Object, e As EventArgs)
        SqlDataSource1.SelectParameters("pertemuan").DefaultValue = _
          GridView1.SelectedValue.ToString()
        PementorFormView.DataBind()
    End Sub

</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
         <br />
        
         <a href="#dialog-mahasiswa" id="d" class="btn tambah" data-toggle="modal">
                                            <button id="editable-sample_new" class="btn btn-shadow btn-primary">
                                                Tambah Data Pertemuan <i class="icon-plus"></i>
                                            </button>
                                        </a>
         <br />
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
         
       
         <div class="modal-footer"></div>
              <asp:FormView ID="PementorFormView"
                DataSourceID="SqlDataSource1"
                DataKeyNames="pertemuan"     
                Gridlines="Both" 
                BorderColor="White"
                  RunAt="server" Width="100%">

                <HeaderStyle backcolor="Navy"
                  forecolor="White"/>

                <RowStyle backcolor="White"/>         

                  <ItemTemplate>
                  <table style="width: 100%"; position: center">
                    <tr style="width: 50%">
                        <td align="right"><b>ID Pertemuan :</b><br /></td><td><asp:TextBox ID="idp1" runat="server" Text='<%# Eval("pertemuan")%>' Width="70%" class="form-control" disabled="disabled" /><br /></td>
                        <asp:HiddenField ID="idp" runat="server" value='<%# Eval("pertemuan")%>' />
                        
                    </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Materi Pertemuan :</b><br /><br /></td>  <td><asp:TextBox ID="ketp" runat="server" Text='<%# Eval("keterangan")%>' Width="70%" class="form-control"/><br /><br /></td>
                          
                      </tr>
                      
                      <tr style="width: 50%">
                        <td align="right"><b>Materi Pertemuan :</b><br /><br /></td>  <td><asp:TextBox ID="materip" TextMode="MultiLine" runat="server" Width="70%" Text='<%# Eval("materi")%>' class="form-control"/><br /><br /></td>
                         
                      </tr>
                      <tr style="width:50%">
                          <td align="right"></td>
                          <td align="center">
                         <asp:Button ID="cancelUpdate"
                                        class="btn btn-default" Text="Cancel" OnClick="Button2_Click"
                                        RunAt="server"/>
                          <asp:Button ID="Button1"
                                        class="btn btn-success" Text="Update"  OnClick="update_Click"
                                        RunAt="server"/>
                         </center>
                      </td>
                      </tr>
                    </table>
                </ItemTemplate>
              </asp:FormView>
        <div class="modal-footer"></div>
         
        
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="pertemuan" 
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
                    <asp:CommandField ShowDeleteButton="True" DeleteText='<div class="btn btn-danger waves-effect waves-light btn-xs m-b-5"><i class="fa fa-trash "></i></div>' />
                    <asp:BoundField DataField="pertemuan" HeaderText="ID" ReadOnly="True" SortExpression="pertemuan"/>
                  <asp:BoundField DataField="keterangan"   HeaderText="Keterangan" SortExpression="keterangan"/>                        
                  <asp:BoundField DataField="materi"  HeaderText="Materi Ceramah" SortExpression="materi"/>

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
          selectCommand="SELECT * FROM [materi]" 
            DeleteCommand="DELETE FROM [materi] WHERE [pertemuan] = @pertemuan" 
            InsertCommand="INSERT INTO [materi] ([pertemuan], [keterangan], [materi]) VALUES (@pertemuan, @keterangan, @materi)" UpdateCommand="UPDATE [materi] SET [keterangan] = @keterangan, [materi] = @materi WHERE [pertemuan] = @pertemuan" >
            <DeleteParameters>
                <asp:Parameter Name="pertemuan" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:ControlParameter ControlID="id" Name="pertemuan" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ket" Name="keterangan" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="materi" Name="materi" PropertyName="Text" Type="String" />
                </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="keterangan" Type="String" />
                <asp:Parameter Name="materi" Type="String" />
                <asp:Parameter Name="pertemuan" Type="String" />
            </UpdateParameters>
        </asp:sqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
            SelectCommand="SELECT * FROM [materi] where pertemuan = @pertemuan" DeleteCommand="DELETE FROM [materi] WHERE [pertemuan] = @pertemuan" InsertCommand="INSERT INTO [materi] ([pertemuan], [keterangan], [materi]) VALUES (@pertemuan, @keterangan, @materi)" UpdateCommand="UPDATE [materi] SET [keterangan] = @keterangan, [materi] = @materi WHERE [pertemuan] = @pertemuan" >
            <SelectParameters>
                <asp:Parameter Name="pertemuan" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
   
     <!-- Modal -->
                                    <div class="modal fade" id="dialog-mahasiswa" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h3 id="myModalLabel">Tambah Data Materi</h3>
                                                </div>
                                                <div class="modal-body">
                                                    ID&nbsp; Pertemuan&nbsp;
                                                    <asp:TextBox ID="id" runat="server" class="form-control" ></asp:TextBox>
                                                    &nbsp;<br />
        <br />
                                                    Keterangan
                                                    <asp:TextBox ID="ket" class="form-control" runat="server" ></asp:TextBox>
        &nbsp;<br />
        <br />
                                                    Materi
                                                    <asp:TextBox ID="materi" TextMode="MultiLine" class="form-control" runat="server" ></asp:TextBox>
                                                    <br />
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