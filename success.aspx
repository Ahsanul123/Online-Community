<%@ Page Language="C#" AutoEventWireup="true" CodeFile="success.aspx.cs" Inherits="success" %>

<script runat="server" lang="C#">

    protected void Link_Click(object o, EventArgs e)
    {
        Session.Clear();

        HttpCookie myCookie = new HttpCookie("Preferences");
        myCookie.Expires = DateTime.Now.AddDays(-1d);
        Response.Cookies.Add(myCookie);

        Response.Redirect("Default.aspx");
    }

</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Community</title>
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Default.aspx">Home</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">
                        <%Response.Write(Session["login"].ToString()); %>
                        <span class="sr-only">(current)</span></a></li>
                    <li><a href="faqpage.aspx">FAQ</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Learn <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="javablogpage.aspx">Java</a></li>
                            <li><a href="androidblogpage.aspx">Android</a></li>
                            <li><a href="#">C Programming</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Web Development</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Others</a></li>
                        </ul>
                    </li>
                </ul>
                <form class="navbar-form navbar-left" role="search">
                    <div class="">  <!-- form-group -->
                        <input type="text" class="form-control" placeholder="Search"/>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                    
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#" id="link1" runat="server" onserverclick="Link_Click"><span class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>



    <div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
        <h4>Online Community Blog</h4>
        <ul class="nav nav-pills nav-stacked">
            <li class="active"><a href="Default.aspx">Home</a></li>
            <li><a href="Friend.aspx">Friends</a></li>
            <li><a href="#section3">Photos</a></li>
            <li>
                <div class="panel-group">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" href="#collapse1">Blog</a>
                            </h4>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse">
                            <ul class="list-group">
                                <li class="list-group-item"><a href="javablogpage.aspx">Java Blog</a></li>
                                <li class="list-group-item"><a href="androidblogpage.aspx">Android Blog</a></li>
                                <li class="list-group-item"><a href="#">Others</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </li>

            <li>
                <div class="panel-group">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h4 class="panel-title">
                                <a data-toggle="collapse" href="#collapse2">Questions</a>
                            </h4>
                        </div>
                        <div id="collapse2" class="panel-collapse collapse">
                            <ul class="list-group">
                                <asp:DataList ID="DataList1" Visible="true" runat="server" AutoGenerateColumns="false"
                                RepeatColumns="1" CellSpacing="5">
                                <ItemTemplate>
                                        
                                    <li class="list-group-item"><a href="faqpage2.aspx?ID=<%# Eval("Id") %>"><%# Eval("questionTitle") %></a></li>
                                        
                                </ItemTemplate>
                            </asp:DataList>
                            </ul>
                        </div>
                    </div>
                </div>
                </li>

        </ul>
        </br>
        </div>

    <div class="col-sm-9">
        <div class="">

             <form id="form1" runat="server">


        <div style="padding-left:10px;padding-right:10px;padding-bottom:10px;">

            <h1>Welcome To Online Community</h1>
            <asp:Label ID="lb1" runat="server" Text=""></asp:Label>
            
             <h2><label runat="server" style="color:blue"  for="comment">Share Your Views:</label></h2>
             <asp:TextBox BorderStyle="Double" BorderColor="SteelBlue" ID="TextBox1" TextMode="MultiLine" Width="620px" Height="85px" runat="server"></asp:TextBox>
            

            

            <div>

<%--                <asp:FileUpload ID="FileUpload1" class="file" runat="server" Height="48px" Width="386px" CssClass="btn-default focus" ForeColor="#009933" />--%>
                <asp:FileUpload ID="FileUpload1" runat="server" />

                <asp:Button ID="btnUpload" runat="server" Text="Upload Post" class="btn btn-primary" OnClick="btnUpload_Click" Height="45px" Width="145px" />
                <br />
                <asp:Label ID="Label2" style="color:red;" runat="server" Text=""></asp:Label>
                <br />
                <div style="width: 695px;">
                    <asp:PlaceHolder ID="placeholder1" runat="server">







                    </asp:PlaceHolder>
                </div>
                <br />



                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Height="1286px" Width="694px">
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" />
                        <asp:BoundField DataField="Name" HeaderText="Name" />
                        <asp:BoundField DataField="Size" HeaderText="Size (bytes)" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" Height="250px" Width="250px"
                                    ImageUrl='<%# "data:Image/jpg;base64,"
                                    + Convert.ToBase64String((byte[])Eval("ImageData")) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>



                <asp:Image ID="imgDemo" runat="server" />
                <br />



                <asp:LinkButton ID="LinkButton1" runat="server"
                    CausesValidation="False"
                    CommandArgument='<%# Eval("filename") %>'
                    CommandName="Download" Text='<%# Eval("filename") %>'>
                </asp:LinkButton>




                <br />

            </div>

            <div style="width: 537px; height: 118px">
                <br />
               <p> <asp:Label ID="Label1" runat="server"></asp:Label></p>
            </div>
            </div>
    
    </form>

        </div>
    </div>
  </div>
</div>





    
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <%# Eval("Name") %>
        </ItemTemplate>
    </asp:Repeater>


    <div class="footer">
        <p>CopyRight &copy; Ahsanul Haque CSE 2k13</p>
    </div>


</body>
</html>
