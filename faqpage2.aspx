<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="faqpage2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <h2><asp:label ID="Label1" runat="server" text=""></asp:label></h2>
    <p>
        <asp:label ID="Label2" runat="server" text=""></asp:label>
    </p>
    <div class="form-group" width: 676px;" width: 507px;">
         <h3><label runat="server" style="color:blue"  for="comment">Answer:</label></h3>
         <asp:TextBox BorderStyle="Double" BorderColor="SteelBlue" class="form-control" rows="5" ID="TextBox1" TextMode="multiline" runat="server" CssClass="alert-link" Width="580px"></asp:TextBox>
         <br />
         <asp:Button ID="ButtonComment" runat="server" OnClick="ButtonComment_Click" class="btn btn-primary" Text="Answer" Height="43px" Width="80px" />
    </div>
    <br />
    <br />
    <br />
    <asp:placeholder ID="placeholder1" runat="server">



    </asp:placeholder>

</asp:Content>

