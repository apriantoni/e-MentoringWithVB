<%@ Page Language="VB"  ValidateRequest="false" AutoEventWireup="false" CodeFile="Berita.aspx.vb" Inherits="View_admin_Berita" MasterPageFile="~/Konten.master" %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<script runat="server">
    Sub Kelompok_OnSelectedIndexChanged(sender As Object, e As EventArgs)
        SqlDataSource1.SelectParameters("id_berita").DefaultValue = _
          GridView1.SelectedValue.ToString()
        KelompokFormView.DataBind()
    End Sub

</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        
         <br />
        
            <button  class="btn btn-shadow btn-primary">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/View/admin/AddBerita.aspx" ForeColor="White"> Tambah Berita </asp:HyperLink>
            </button>
         <br />
         <hr />
         <asp:FormView ID="KelompokFormView"
                DataSourceID="SqlDataSource1"
                DataKeyNames="id_berita"     
                Gridlines="Both" 
                BorderColor="White"
                  RunAt="server" Width="100%">

                <HeaderStyle backcolor="Navy"
                  forecolor="White"/>

                <RowStyle backcolor="White"/>         

                <EditRowStyle backcolor="LightCyan"/>

                <ItemTemplate>
                    <table >
                    <tr>
                            <asp:HiddenField ID="idsp" runat="server" value='<%# Eval("id_berita")%>'/><br />
                        <td><b>Judul Berita :</b><br /></td><td><asp:TextBox ID="judulp" Width="510px" runat="server" Text='<%# Eval("judul")%>' class="form-control"/><br /></td>
                    </tr>
                    <tr>
                        <FTB:FreeTextBox id="isip" runat="Server" Height="200px" Text='<%# Eval("isi")%>'/><br />
                    </tr>
                    <tr>
                        <td><b>Status :</b>
                            <asp:DropDownList ID="statusp" runat="server">
                               <asp:ListItem>publish</asp:ListItem>
                               <asp:ListItem>draft</asp:ListItem>
                          </asp:DropDownList><br /><br />
                        </td>
                    </tr>
                      <tr>
                          <br />
                        <td colspan="10">
                        
                         <asp:Button ID="cancelUpdate"
                                        class="btn btn-default" Text="Cancel" OnClick="Button2_Click"
                                        RunAt="server"/>
                          <asp:Button ID="update"
                                        class="btn btn-success" Text="Update"  OnClick="Button1_Click"
                                        RunAt="server"/>
                         
                      </td>
                    </tr>
                    </table>                 
                
                  </ItemTemplate>
              </asp:FormView>
         <br />
        <div class="modal-footer">
             
         </div>
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="id_berita" 
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
                  <asp:BoundField DataField="id_berita" HeaderText="ID"/>
                    <asp:BoundField DataField="judul" HeaderText="Judul Berita"/>
                  <asp:BoundField DataField="isi"   HeaderText="Isi Beita" HtmlEncode="False" />
                  <asp:BoundField DataField="tanggal"   HeaderText="Waktu"/>                          
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
          selectCommand="SELECT * FROM berita" 
            DeleteCommand="DELETE FROM berita WHERE id_berita = @id_berita">
            <DeleteParameters>
                <asp:Parameter Name="id_pementor" Type="String" />
            </DeleteParameters>
            </asp:sqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
            SelectCommand="SELECT * FROM berita where id_berita = @id_berita" >
            <SelectParameters>
                <asp:Parameter Name="id_berita" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        
    </form>
</asp:Content>