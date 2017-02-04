<%@ Page Language="C#" AutoEventWireup="true" CodeFile="demopage2.aspx.cs" Inherits="demopage2" %>

<script runat="server" lang="C#">

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started  
        if (Session["LoginUserName"] != null)
        {
            //Redirect to Welcome Page if Session is not null  
            Response.Redirect("Default.aspx");

        }
        
        


    }

    void Session_End(object sender, EventArgs e)
    {
        Response.Redirect("registration.aspx");  

    }
    
    
    //void btnAgain_Click(Object sender, EventArgs e)
    //{
    //    ResetStartTime();
    //}
    
    
    void valAnswer_ServerValidate(Object source, ServerValidateEventArgs args)
    {
        DateTime startTime = (DateTime)Session["StartTime"];
    if (startTime.AddSeconds(5) > DateTime.Now)
        args.IsValid = true;
    else
        args.IsValid = false;
    }

</script>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Community</title>
    <link rel="icon" type="image/png" href="icon/image.png" />
   
   <link rel="stylesheet" href="css/bootstrap.min.css"/>
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    
    <%--<asp:ContentPlaceHolder id="head" runat="server">
    </asp:ContentPlaceHolder>--%>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="banner">
        <img src="image/faqbanner1.jpg" alt=""/>
    </div>

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
                        <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">FAQ</a></li>
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
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#" id="link1" runat="server">Log Out</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">FAQ<span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Question</a></li>
                            <li><a href="#">Tags</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">Ask Question</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
    <div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
      <h4>John's Blog</h4>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">Home</a></li>
        <li><a href="#section2">Friends</a></li>
        <li><a href="#section3">Family</a></li>
        <li><a href="#section3">Photos</a></li>
      </ul><br>
      <div class="input-group">
        <input type="text" class="form-control" placeholder="Search Blog..">
        <span class="input-group-btn">
          <button class="btn btn-default" type="button">
            <span class="glyphicon glyphicon-search"></span>
          </button>
        </span>
      </div>
    </div>

    <div class="col-sm-9">
        <div class="">

             <form id="form1" runat="server">

              <authentication mode="Forms">
                <forms defaultUrl="~/Default.aspx"
                    loginUrl="~/raf.aspx"
                    slidingExpiration="true"
                    timeout="6" />
            </authentication>
                 



                </div>
              </form>

        </div>
    </div>
  </div>
</div>

<%--    <div class="navigation">
        <div class="col-sm-6 sidenav">
            <h4>John's Blog</h4>
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
                                    <a data-toggle="collapse" href="#collapse1">Others</a>
                                </h4>
                            </div>
                            <div id="collapse1" class="panel-collapse collapse">
                                <ul class="list-group">
                                    <li class="list-group-item"><a href="#">One</a></li>
                                    <li class="list-group-item"><a href="#">Two</a></li>
                                    <li class="list-group-item"><a href="#">Three</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </li>



            </ul>
        </div>


        <div class="">

             <form id="form1" runat="server">
                <div>
                   <asp:ContentPlaceHolder id="ContentPlaceHolder1" runat="server">
        




                    </asp:ContentPlaceHolder>
                </div>
              </form>

        </div>

    </div>

    --%>



   


    <div class="footer">
        <p>CopyRight &copy; Ahsanul Haque CSE 2k13</p>
    </div>
</body>
</html>
