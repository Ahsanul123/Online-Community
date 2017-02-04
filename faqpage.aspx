<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.master" AutoEventWireup="true" CodeFile="faqpage.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    
    <h1>Ask Your Question:</h1>
    <h3>Question Title: </h3>
    <asp:TextBox  class="form-control" rows="5" ID="TextBox2" TextMode="multiline" runat="server" CssClass="alert-link" Height="56px" Width="540px"></asp:TextBox>
    <div style="width: 682px">
        <div class="form-group" width: 676px;" width: 507px;">
            <h2><label runat="server" style="color:blue"  for="comment">Post Description:</label></h2>
            <asp:TextBox BorderStyle="Double" BorderColor="SteelBlue" class="form-control" rows="5" ID="TextBox1" TextMode="multiline" runat="server" CssClass="alert-link" Width="545px" Height="85px"></asp:TextBox>
        </div>
            <asp:Button ID="Button2" runat="server" OnClick="Post_Click" class="btn btn-primary" Text="Post" Height="46px" Width="80px" />
    </div>
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <br />

    <asp:gridview id="GridView1" runat="server" autogeneratecolumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" EnableModelValidation="True" Width="729px">
    <Columns>
        
        <asp:TemplateField HeaderText="Id" ItemStyle-Width="5%" ItemStyle-VerticalAlign="Top" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" Text='<%#Eval("Id") %>'  onClick="LinkButton1_Click" runat="server">LinkButton</asp:LinkButton>
            </ItemTemplate>

<ItemStyle HorizontalAlign="Center" VerticalAlign="Top" Width="5%"></ItemStyle>
        </asp:TemplateField>
        <asp:BoundField DataField="questionTitle" HeaderText="   Question Title" ItemStyle-Width="95%" ItemStyle-VerticalAlign="Top">
<ItemStyle VerticalAlign="Top" Width="95%"></ItemStyle>
        </asp:BoundField>
    </Columns>
        <FooterStyle BackColor="White" ForeColor="#000066" />
        <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
        <RowStyle ForeColor="#000066" />
        <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
</asp:gridview>




</asp:Content>

