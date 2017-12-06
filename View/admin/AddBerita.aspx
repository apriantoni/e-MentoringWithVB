<%@ Page Language="VB"   AutoEventWireup="false" CodeFile="AddBerita.aspx.vb" Inherits="View_admin_Berita" MasterPageFile="~/Konten.master" %>
   <%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Content" runat="server">
    <form id="form1" runat="server">

                        <br />
        <br /><br />
                        <div class="row">
							<div class="col-sm-12">
								<div class="card-box">
									Judul Berita :&nbsp;
                                    <asp:TextBox ID="judul" runat="server" Width="493px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="judul" ErrorMessage="Harus diisi*"></asp:RequiredFieldValidator>
                                    <br />
                                    <br />
                                    <FTB:FreeTextBox id="isi" runat="Server" Width="100%" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="isi" ErrorMessage="Harus diisi*"></asp:RequiredFieldValidator>
									<br />
									<br />
                                    Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; :
                                    <asp:DropDownList ID="status" runat="server">
                                        <asp:ListItem>publish</asp:ListItem>
                                        <asp:ListItem>draft</asp:ListItem>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                    <br />
                                    <button  type="submit" class="btn btn-shadow btn-default"><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/View/admin/Berita.aspx">Batal</asp:HyperLink></button>
&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btnSimpan" runat="server" class="btn btn-shadow btn-primary" Text="Simpan" Width="81px" />
									</div>
							</div>
						</div>
                        <!-- End row -->



    </form>
</asp:Content>
