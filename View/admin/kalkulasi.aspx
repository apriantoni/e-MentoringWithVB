<%@ Page Language="VB" AutoEventWireup="false" CodeFile="kalkulasi.aspx.vb" Inherits="View_admin_kalkulasi" MasterPageFile="~/Konten.master" %>

<script runat="server">
    Sub Kelompok_OnSelectedIndexChanged(sender As Object, e As EventArgs)
        SqlDataSource1.SelectParameters("id_bobot").DefaultValue = _
          GridView1.SelectedValue.ToString()
        PementorFormView.DataBind()
    End Sub

</script>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
        <br />
         <h4>Presentase Bobot Nilai </h4>
        
         <br />
         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" SelectCommand="SELECT * FROM [user]"></asp:SqlDataSource>
         
       
         <div class="modal-footer"></div>
              <asp:FormView ID="PementorFormView"
                DataSourceID="SqlDataSource1"
                DataKeyNames="id_bobot"     
                Gridlines="Both" 
                BorderColor="White"
                  RunAt="server" Width="100%">

                <HeaderStyle backcolor="Navy"
                  forecolor="White"/>

                <RowStyle backcolor="White"/>         

                  <ItemTemplate>
                  <table style="width: 100%"; position: center">
                    <tr style="width: 50%">
                        <asp:HiddenField ID="idp" runat="server" value='<%# Eval("id_bobot")%>' />
                    </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Presentase Amalan Yaummi :</b><br /><br /></td>  <td><asp:TextBox ID="n1" runat="server" Text='<%# Eval("bobot1")%>' Width="70%" class="form-control"/><br /><br /></td>
                      </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Presentase Nilai Keaktifan :</b><br /><br /></td>  <td><asp:TextBox ID="n2" runat="server" Width="70%" Text='<%# Eval("bobot2")%>' class="form-control"/><br /><br /></td>
                      </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Presentase Nilai Tugas :</b><br /><br /></td>  <td><asp:TextBox ID="n3" runat="server" Width="70%" Text='<%# Eval("bobot3")%>' class="form-control"/><br /><br /></td>
                      </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Presentase Nilai UTS :</b><br /><br /></td>  <td><asp:TextBox ID="n4" runat="server" Width="70%" Text='<%# Eval("bobot4")%>' class="form-control"/><br /><br /></td>
                      </tr>
                      <tr style="width: 50%">
                        <td align="right"><b>Presentase Nilai UAS :</b><br /><br /></td>  <td><asp:TextBox ID="n5" runat="server" Width="70%" Text='<%# Eval("bobot5")%>' class="form-control"/><br /><br /></td>
                      </tr>
                      
                      <tr style="width:50%">
                          <td align="right"></td>
                          <td align="center">
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
        <div class="modal-footer"></div>
         
        
              <asp:GridView class="table table-striped table-bordered" ID="GridView1"
                DataSourceID="KelompokSqlDataSource" 
                AutoGenerateColumns="False"
                DataKeyNames="id_bobot" 
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
                    <asp:BoundField DataField="bobot1" HeaderText="Bobot Amalan" ReadOnly="True" SortExpression="amalan"/>
                  <asp:BoundField DataField="bobot2"   HeaderText="Bobot Keaktifan" SortExpression="keaktifan"/>                        
                  <asp:BoundField DataField="bobot3"  HeaderText="Bobot Tugas" SortExpression="tugas"/>
                    <asp:BoundField DataField="bobot4"  HeaderText="Bobot UTS" SortExpression="UTS"/>
                    <asp:BoundField DataField="bobot5"  HeaderText="Bobot UAS" SortExpression="UAS"/>
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
          selectCommand="SELECT * FROM [bobot]">
            </asp:sqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
            SelectCommand="SELECT * FROM [bobot] where id_bobot = @id_bobot" >
            <SelectParameters>
                <asp:Parameter Name="id_bobot" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />     
    </form>
</asp:Content>