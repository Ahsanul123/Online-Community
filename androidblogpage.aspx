<%@ Page Language="C#" AutoEventWireup="true" CodeFile="androidblogpage.aspx.cs" Inherits="androidblogpage" %>

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
    <link rel="icon" type="image/png" href="icon/image.png" />
    
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/bootstrap.min.css"/>
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
                    <li ><a href="#">
                        <%if (Session["login"] != null) Response.Write(Session["login"].ToString());
                          else
                              Response.Write("Profile");
                             
                         %>
                         <span class="sr-only">(current)</span></a></li>
                    <li><a href="faqpage.aspx">FAQ</a></li>
                    <li class="dropdown">
                        <a href="#" class="active" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Learn <span class="caret"></span></a>
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
                    <div class="">  <!-- <div class="form-group"> --> 
                        <input type="text" class="form-control" placeholder="Search"/>
                        <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                    
                </form>
                <ul class="nav navbar-nav navbar-right">

                    <li><a href="#" id="link1" runat="server" onserverclick="Link_Click"><%if(Session["login"]!=null)
                                                                                            Response.Write("<span class=\"glyphicon glyphicon-log-in\"></span> Log Out");
                                                                                             %></a></li>

                    
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

    <form id="form1" runat="server">
        
       <div class="container-fluid">
         <div class="row content">
            <div class="col-sm-3 sidenav">
              <h3>Online Community Blog</h3>
              <ul class="nav nav-pills nav-stacked">
                <li class="active"><a href="#section1">Home</a></li>
                <li><a href="#section2">Friends</a></li>
                <li><a href="#section3">Family</a></li>
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


              </ul><br>
            </div>

            <div class="col-sm-9">

                 <div>
                    <div class="row">
                        <div class="col-sm-4">
                            <img src="image/androidicon.png" />
                        </div>
                        <div class="col-sm-8">
                            <h1 style="margin-top:90px;">Online Community Android Blog</h1>
                        </div>

                    </div>
                        <h1>1. What is Android?</h1>
                        <p>Android is an operating system based on the Linux kernel. The project responsible for developing the Android system is called the Android 
                            Open Source Project (AOSP) and is primarily lead by Google. The Android system supports background processing, provides a rich user interface 
                            library, supports 2-D and 3-D graphics using the OpenGL-ES (short OpenGL) standard and grants access to the file system as well as an embedded SQLite database.
                            An Android application typically consists of different visual and non visual components and can reuse components of other applications.</p>



                    <div>
                     <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                      <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                          <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                              Q1. What is Android?
                            </a>
                          </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                          <div class="panel-body">
                            It is an open-sourced operating system that is used primarily on mobile devices, such as cell phones and tablets. It is a Linux kernel-based system that’s been equipped with rich components that allows developers to create and run apps that can perform both basic and advanced functions
                          </div>
                        </div>
                      </div>
                      <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                          <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                              Q2. What Is the Google Android SDK?
                            </a>
                          </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                          <div class="panel-body">
                                The Google Android SDK is a toolset that developers need in order to write apps on Android enabled devices. It contains a graphical interface that emulates an Android driven handheld environment, allowing them to test and debug their codes.
                          </div>
                        </div>
                      </div>
                      <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                          <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                              Q3. What is the Android Architecture?
                            </a>
                          </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                          <div class="panel-body">
                            <p>Android Architecture is made up of 4 key components:<br/>– Linux Kernel<br/>
                                                                                   – Libraries<br/>
                                                                                   – Android Framework<br/>
                                                                                   – Android Applications</p>
                          </div>
                        </div>
                      </div>
                    </div>

                    </div>
                </div>




            </div>


           </div>

       </div>

           
    </form>


    <div class="footer">
        <p>CopyRight &copy; Ahsanul Haque CSE 2k13</p>
    </div>

</body>
</html>
