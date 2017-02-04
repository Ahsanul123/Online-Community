<%@ Page Language="C#" AutoEventWireup="true" CodeFile="raf.aspx.cs" Inherits="raf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>


    <form id="form1" runat="server">
      <div>

          <asp:PlaceHolder ID="placeholder1" runat="server">



          </asp:PlaceHolder>

      <div >Choose a background color:<br />
        <asp:dropdownlist ID="lstBackColor" 
                          runat="server" 
                          Height="22px" 
                          Width="194px"></asp:dropdownlist>
        <br /><br />
        Choose a font:<br />
        <asp:dropdownlist ID="lstFontName" 
                          runat="server" 
                          Height="22px" 
                          Width="194px"></asp:dropdownlist>
        <br /><br />
        
        Specify a numeric font size:<br />
        <asp:textbox ID="txtFontSize" runat="server"></asp:textbox>
        <br /><br />
        Choose a border style:<br />
        <asp:radiobuttonlist ID="lstBorder" 
                             runat="server" 
                             Height="59px" 
                             Width="177px" 
                             Font-Size="X-Small"></asp:radiobuttonlist>
        <br /><br />
        <asp:checkbox ID="chkPicture" 
                      runat="server" 
                      Text="Add the Default Picture"></asp:checkbox>
        <br /><br />
        Enter the greeting text below:<br />
        <asp:textbox ID="txtGreeting" 
                     runat="server" 
                     Height="85px" 
                     Width="240px" 
                     TextMode="MultiLine"></asp:textbox>
        <br /><br />
        <asp:button ID="cmdUpdate" 
                    runat="server" 
                    Height="24px" 
                    Width="71px" 
                    Text="Update" 
                    onclick="cmdUpdate_Click"></asp:button>
      </div>
      <asp:panel ID="pnlCard" runat="server" 
      Height="507px" Width="339px" 
                     HorizontalAlign="Center"><br />&nbsp; 
          <asp:Label ID="lblGreeting" 
                     runat="server" 
                     Height="150px" 
                     Width="256px"></asp:Label>
          <br /><br /><br />
          <asp:Image ID="imgDefault" 
                     runat="server" 
                     Height="160px" 
                     Width="212px" 
                     Visible="False"></asp:Image>
        </asp:panel>
        </div>
    </form>


    <%--
    <form id="form1" runat="server">

        <div style="border:double; border-color:#00ff21">
           <tr valign="top|middle|bottom|baseline">
                <tr valign="bottom" />


            <asp:PlaceHolder ID="PlaceHolder1" runat="server">

            </asp:PlaceHolder>
        </div>
    </form>
    --%>
</body>
</html>
