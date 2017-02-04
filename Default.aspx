<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>


    <title>Online Community</title>

    <style type="text/css">
        #form1 {
            text-align: left;
            width: 289px;
            height: 185px;
            margin-bottom: 20px;
            margin-left: 130px;
        }

        .auto-style1 {
            font-size: x-large;
        }
    </style>

    <link rel="icon" type="image/png" href="icon/image.png" />
    <link rel="stylesheet" href="css/bootstrap.min.css" />
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
                <li class="active"><a class="navbar-brand" href="Default.aspx">Home</a></li>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="#">Profile <span class="sr-only">(current)</span></a></li>
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
                    <div class="">
                        <input type="text" class="form-control" placeholder="Search"/>
                         <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                   
                </form>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="registration.aspx"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                     <li><a href="#" data-toggle="modal" data-target="#myModal"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                    <!-- Modal --------------------------Pop Up Box-------------------------------------------------->

                    <!-- Trigger the modal with a button -->

                    <!-- Modal -->
                    <div class="modal fade" id="myModal" role="dialog">
                        <div class="modal-dialog">

                            <!-- Modal content-->
                            <div class="modal-content">
                                <div class="modal-header" style="background-color: #000;">
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    <h4 style="text-align: center; color: #ffffff;" class="modal-title">Log In To Online Community</h4>
                                </div>
                                <div class="modal-body">




                                    <form id="form1" runat="server">
                                       
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" Height="206px" Style="margin-top: 0px" Width="333px">
                                            <LayoutTemplate>
                                                <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                                    <tr>
                                                        <td>
                                                            <table cellpadding="0" style="height: 188px; width: 333px;">
                                                                <tr>
                                                                    <td align="center" class="auto-style1" colspan="2" style="color: White; background-color: #6B696B;"><strong><em>Log In</em></strong></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right">
                                                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right">
                                                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="2">
                                                                        <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" colspan="2" style="color: Red;">
                                                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" colspan="2">
                                                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" Height="27px" Style="margin-top: 0px" Text="Log In" ValidationGroup="Login1" Width="98px" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </LayoutTemplate>
                                            <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
                                        </asp:Login>


                                    </form>

                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                </div>
                            </div>

                        </div>

                         <%--popup--%>

                    </div>
                    

                </ul>
            </div>


           



                    
                
        <!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>



    <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img src="image/android.jpg" alt="Chania">
            </div>

            <div class="item">
                <img src="image/faq.jpg" alt="Chania">
            </div>

            <div class="item">
                <img src="image/android.jpg " alt="Flower">
            </div>

            <div class="item">
                <img src="image/faq.jpg" alt="Flower">
            </div>
        </div>

        <!-- Left and right controls -->
        <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>



    <div class="navigation">
        <div class="col-sm-3 sidenav">
            <h3>Online Community Blog</h3>
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
            <br>
        </div>
        <div class="description">
            <div class="mainlearn">
                <div class="learn">
                    <img src="image/android1.jpg" href="" />
                    <h1>Learn many thing</h1>
                    <p>
                    In this session, you’ll become familiar with Java, the programming language used to develop Android
                     applications. Our goal is to prepare those already familiar with one programming language, such 
                    as PHP or Objective-C, to become comfortable working with the Java programming language and dive 
                    into Android app development. In this session, you’ll get a brief introduction to Java 
                    fundamentals, including object oriented programming, inheritance and more. If you’re new to Java,
                     or just looking to brush up on the details, then this is the session for you!
                </div>
            </div>
            <div class="mainshare">
                <div class="shareyourviews">
                    <img src="image/views1.jpg" href="" />
                    <h1>Share your views</h1>
                    <p>
                        This site links you to a number of innovative web-based surveys developed by researchers at the
                     University of British Columbia. The purpose of the surveys is to facilitate well-informed
                     discussion and explore attitudes about complex issues related to ethics (including animal 
                    welfare) and scientific and technological developments. We look forward to hearing Your Views!
                    You can use the sidebar (the left-hand side of your screen) to navigate through the site. If this
                     is your first visit to YourViews, please click Create New Account on the sidebar. Once you have 
                    done this, you will be returned to this homepage where you can begin by clicking on a survey of
                     your choice. All surveys have been approved by the University of British Columbia Research 
                    Ethics Board.
                    </p>
                </div>
            </div>
            <div class="mainfaq">
                <div class="FAQ">
                    <img src="image/faq1.jpg" href="" />
                    <h1>Frequently Ask Question</h1>
                    <p>
                        Frequently asked questions (FAQ) or Questions and Answers (Q&A), are listed questions and answers,
                     all supposed to be commonly asked in some context, and pertaining to a particular topic. The 
                    format is commonly used on email mailing lists and other online forums, where certain common 
                    questions tend to recur."FAQ" is pronounced as either an initialism (F-A-Q) or an acronym. Since
                     the acronym FAQ originated in textual media, its pronunciation varies; "F-A-Q",[1] "fack",[1]
                     "fuck",[1] "faak",[citation needed] "fax",[citation needed] and "facts"[citation needed] are 
                    commonly heard. Depending on usage, the term may refer specifically to a single frequently asked 
                    question, or to an assembled list of many questions and their answers. Web page designers often
                     label a single list of questions as a "FAQ", such as on Google.com,[2] while using "FAQs" to 
                    denote multiple lists of questions such as on United States Treasury sites.
                    </p>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
        <p>CopyRight &copy; Ahsanul Haque CSE 2k13</p>
    </div>

    <marquee>This text will scroll from right to left</marquee>


</body>
</html>




