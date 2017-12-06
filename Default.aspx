<%@ Page Title="Home Page" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="konten" runat="server">     
 
                              <form class="form-horizontal" action="#">
                                <div class="form-group ">
                                  <div class="col-xs-12">
                                      <br />
                                    <asp:Label ID="KategoriLabel" runat="server" AssociatedControlID="kategori">Kategori :</asp:Label><br />
                                    <asp:DropDownList ID="kategori"  class="form-control" runat="server" Font-Size="1em">
                                        <asp:ListItem>Admin</asp:ListItem>
                                        <asp:ListItem>Pementor</asp:ListItem>
                                    </asp:DropDownList>
                                   </div>
                                  </div>
                                  <div class="form-group ">
                                  <div class="col-xs-12">
                                      <br />
                                      <asp:TextBox ID="UserName" placeholder="Username" class="form-control" runat="server" Font-Size="1em"></asp:TextBox>
                                    </div>
                                  </div>
                                  <div class="form-group ">
                                  <div class="col-xs-12">
                                      <br />
                                   <asp:TextBox ID="Password" placeholder="Password" class="form-control" runat="server" Font-Size="1em" TextMode="Password"></asp:TextBox>
<br />                                  </div>
                                  </div>
                                   
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                <br />
                                    <asp:Button ID="LoginButton" runat="server" BackColor="#F5707A" BorderColor="#F5707A" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" style="margin-left: 60%" Font-Size="1.2em" ForeColor="White" Text="Log In"/>
                                    <br /><br /><br />
                                    <asp:Label ID="alert" runat="server" Font-Size="0.9em"></asp:Label>
                                
           </form>
</asp:Content>