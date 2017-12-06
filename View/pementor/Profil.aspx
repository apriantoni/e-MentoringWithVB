<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Profil.aspx.vb" Inherits="View_pementor_Profil" MasterPageFile="~/Konten1.master" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
     <form id="form1" runat="server">
         <br /><h3>Data Diri </h3>
        <div class="modal-footer">       
         </div>
         <asp:FormView ID="FormView1" runat="server" DataKeyNames="id_user" DataSourceID="SqlDataSource1" Width="643px">
             <EditItemTemplate>
                 ID User :
                 <asp:Label ID="id_userLabel1" runat="server" CssClass="form-control" Text='<%# Eval("id_user") %>' />
                 <br />
                 Nama :
                 <asp:TextBox ID="namaTextBox" runat="server" CssClass="form-control" Width="100%" Text='<%# Bind("nama") %>' />
                 <br />
                 Alamat :
                 <asp:TextBox ID="alamatTextBox" CssClass="form-control" Width="100%" runat="server" Text='<%# Bind("alamat") %>' />
                 <br />
                 Nomor Handphone :
                 <asp:TextBox ID="nohapeTextBox" CssClass="form-control" Width="100%" runat="server" Text='<%# Bind("nohape") %>' />
                 <br />
                 Password :
                 <asp:TextBox ID="passwordTextBox" CssClass="form-control" Width="100%" runat="server" Text='<%# Bind("password") %>' />
                 <br />
                 Email :
                 <asp:TextBox ID="emailTextBox" CssClass="form-control" Width="100%" runat="server" Text='<%# Bind("email") %>' />
                 <br />
                 Jenis Kelamin <b>(Ikhwan/Akhwat)</b> :
                 <asp:TextBox ID="jkTextBox" CssClass="form-control" Width="100%" runat="server" Text='<%# Bind("jk") %>' />
                 <br />
                 <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                 &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
             </EditItemTemplate>
             
             <ItemTemplate>
                 ID User :
                 <asp:Label ID="id_userLabel" CssClass="form-control" Width="100%" runat="server" Text='<%# Eval("id_user") %>' />
                 <br /><br />
                 Nama :
                 <asp:Label ID="namaLabel" CssClass="form-control" Width="100%" runat="server" Text='<%# Bind("nama") %>' />
                 <br /><br />
                 Alamat :
                 <asp:Label ID="alamatLabel" CssClass="form-control" Width="100%" runat="server" Text='<%# Bind("alamat") %>' />
                 <br /><br />
                 Nomor Handphone :
                 <asp:Label ID="nohapeLabel" CssClass="form-control" Width="100%" runat="server" Text='<%# Bind("nohape") %>' />
                 <br /><br />
                 Password :
                 <asp:Label ID="passwordLabel" CssClass="form-control" Width="100%" runat="server" Text='<%# Bind("password") %>' />
                 <br /><br />
                 Email :
                 <asp:Label ID="emailLabel" CssClass="form-control" Width="100%" runat="server" Text='<%# Bind("email") %>' />
                 <br /><br />
                 Jenis Kelamin :
                 <asp:Label ID="jkLabel" CssClass="form-control" Width="100%" runat="server" Text='<%# Bind("jk") %>' />
                 <br /><br />
                 <button class="btn btn-primary" type="button"> <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text=' <font color="#ffffff">Edit Profil</font>' /></button>
                 &nbsp;
             </ItemTemplate>
         </asp:FormView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MentoringString %>" 
             SelectCommand="SELECT * FROM [user] WHERE ([id_user] = @id_user)" 
             UpdateCommand="UPDATE [user] SET [nama] = @nama, [alamat] = @alamat, [nohape] = @nohape, [password] = @password, [email] = @email, [jk] = @jk WHERE [id_user] = @id_user">
             <SelectParameters>
                 <asp:SessionParameter Name="id_user" SessionField="user" Type="String" />
             </SelectParameters>
             <UpdateParameters>
                 <asp:Parameter Name="nama" Type="String" />
                 <asp:Parameter Name="alamat" Type="String" />
                 <asp:Parameter Name="nohape" Type="String" />
                 <asp:Parameter Name="password" Type="String" />
                 <asp:Parameter Name="email" Type="String" />
                 <asp:Parameter Name="jk" Type="String" />
                 <asp:Parameter Name="id_user" Type="String" />
             </UpdateParameters>
         </asp:SqlDataSource>
        
    </form>
</asp:Content>

