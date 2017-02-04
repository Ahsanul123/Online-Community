<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Demopage.aspx.cs" Inherits="Demopage" %>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table>
<tr>
<td>Name: </td>
<td><asp:TextBox ID="txtName" runat="server"/></td>
</tr>
<tr>
<td>Subject: </td>
<td><asp:TextBox ID="txtSubject" runat="server"/></td>
</tr>
<tr>
<td valign="top">Comments:</td>
<td><asp:TextBox ID="txtComment" runat="server" Rows="5" Columns="20" 
        TextMode="MultiLine" Width="391px"/></td>
</tr>
<tr>
<td></td>
<td><asp:Button ID="btnSubmit" runat="server" Text="Submit" onclick="btnSubmit_Click" /></td>
</tr>
</table>
</div>
<div>
<asp:Repeater ID="RepDetails" runat="server" DataSourceID="SqlDataSource1">
<HeaderTemplate>
<table style=" border:1px solid #df5015; width:500px" cellpadding="0">
<tr style="background-color:#df5015; color:White">
<td colspan="2">
<b>Post a Feedback, Comment, or Question about this article</b> 
</td>
</tr>
</HeaderTemplate>
<ItemTemplate>
<tr style="background-color:#EBEFF0">
<td>
<table style="background-color:#EBEFF0;border-top:1px dotted #df5015; width:500px" >
<tr>
<td>
Subject:
<asp:Label ID="lblSubject" runat="server" Text='<%#Eval("Subject") %>' Font-Bold="true"/>
</td>
</tr> 
</table> 
</td> 
</tr>
<tr>
<td>
<asp:Label ID="lblComment" runat="server" Text='<%#Eval("Comment") %>'/>
</td>
</tr>
<tr>
<td>
<table style="background-color:#EBEFF0;border-top:1px dotted #df5015;border-bottom:1px solid #df5015; width:500px" >
<tr>
<td>Post By: <asp:Label ID="lblUser" runat="server" Font-Bold="true" Text='<%#Eval("UserName") %>'/></td>
<td>Created Date:<asp:Label ID="lblDate" runat="server" Font-Bold="true" Text='<%#Eval("PostedDate") %>'/></td>
</tr>
</table>
</td>
</tr>
<tr>
<td colspan="2">&nbsp;</td>
</tr>
</ItemTemplate>
<FooterTemplate>
</table>
</FooterTemplate>
</asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:logDBConnectionString %>" SelectCommand="SELECT [username], [FirstName], [LastName], [Email] FROM [login]"></asp:SqlDataSource>
    </div>
    </form>
</body>
</html> 