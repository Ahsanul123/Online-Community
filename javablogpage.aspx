<%@ Page Language="C#" AutoEventWireup="true" CodeFile="javablogpage.aspx.cs" Inherits="javablogpage" %>
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
                    <li><a href="#">
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
                <li><a href="Firend.aspx">Friends</a></li>
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
                            <img src="image/java.png"/>
                        </div>
                        <div class="col-sm-8">
                            <h1 style="margin-top:90px;">Online Community Java Blog</h1>
                        </div>

                    </div>
                        <h1>1. Introduction to Java</h1>
                        <span class="more">
                            Java is a programming language created by James Gosling from Sun Microsystems (Sun) in 1991. The first publicly available version 
                            of Java (Java 1.0) was released in 1995. Sun Microsystems was acquired by the Oracle Corporation in 2010. Oracle has now the steermanship
                            for Java. In 2006 Sun started to make Java available under the GNU General Public License (GPL). Oracle continues this project called OpenJDK.
                            Over time new enhanced versions of Java have been released. The current version of Java is Java 1.8 which is also known as Java 8.
                            Java is defined by a specification and consists of a programming language, a compiler, core libraries and a runtime (Java virtual machine) The
                            Java runtime allows software developers to write program code in other languages than the Java programming language which still runs on the 
                            Java virtual machine. The Java platform is usually associated with the Java virtual machine and the Java core libraries.
                            The Java virtual machine (JVM) is a software implementation of a computer that executes programs like a real machine.
                            The Java virtual machine is written specifically for a specific operating system, e.g., for Linux a special implementation is required as well as for Windows.
                            Java programs are compiled by the Java compiler into bytecode. The Java virtual machine interprets this bytecode and executes the Java program.
                        </span>
                    <script>

                        $(document).ready(function () {
                            // Configure/customize these variables.
                            var showChar = 600;  // How many characters are shown by default
                            var ellipsestext = "...";
                            var moretext = "Show more >";
                            var lesstext = "Show less";


                            $('.more').each(function () {
                                var content = $(this).html();

                                if (content.length > showChar) {

                                    var c = content.substr(0, showChar);
                                    var h = content.substr(showChar, content.length - showChar);

                                    var html = c + '<span class="moreellipses">' + ellipsestext + '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';

                                    $(this).html(html);
                                }

                            });

                            $(".morelink").click(function () {
                                if ($(this).hasClass("less")) {
                                    $(this).removeClass("less");
                                    $(this).html(moretext);
                                } else {
                                    $(this).addClass("less");
                                    $(this).html(lesstext);
                                }
                                $(this).parent().prev().toggle();
                                $(this).prev().toggle();
                                return false;
                            });
                        });

                    </script>
                    <h1>Java Interview Questions with Answers</h1>
                    <div>
                     <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                      <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingOne">
                          <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                              Q1. What is the difference between an Inner Class and a Sub-Class?
                            </a>
                          </h4>
                        </div>
                        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                          <div class="panel-body">
                            Ans: An Inner class is a class which is nested within another class. An Inner class has access rights for the class which is nesting it and it can access all variables and methods defined in the outer class.
                            A sub-class is a class which inherits from another class called super class. Sub-class can access all public and protected methods and fields of its super class
                          </div>
                        </div>
                      </div>
                      <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingTwo">
                          <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                              Q2. What are the various access specifiers for Java classes?
                            </a>
                          </h4>
                        </div>
                        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                          <div class="panel-body">
                           Ans: In Java, access specifiers are the keywords used before a class name which defines the access scope. The types of access specifiers for classes are:
                                1. Public : Class,Method,Field is accessible from anywhere.<br/>
                                2. Protected:Method,Field can be accessed from the same class to which they belong or from the sub-classes,and from the class of same package,but not from outside.<br/>
                                3. Default: Method,Field,class can be accessed only from the same package and not from outside of it’s native package.<br/>
                                4. Private: Method,Field can be accessed from the same class to which they belong.
                           </div>
                        </div>
                      </div>
                      <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingThree">
                          <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                              Q3. What’s the purpose of Static methods and static variables?
                            </a>
                          </h4>
                        </div>
                        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
                          <div class="panel-body">
                            Ans: When there is a requirement to share a method or a variable between multiple objects of a class instead of creating separate copies for each object, we use static keyword to make a method or variable shared for all objects.
                          </div>
                        </div>
                      </div>
                        <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingFour">
                          <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                              Q4. What is data encapsulation and what’s its significance?
                            </a>
                          </h4>
                        </div>
                        <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                          <div class="panel-body">
                            Ans: Encapsulation is a concept in Object Oriented Programming for combining properties and methods in a single unit.
                            Encapsulation helps programmers to follow a modular approach for software development as each object has its own set of methods and variables and serves its functions independent of other objects. Encapsulation also serves data hiding purpose.
                          </div>
                        </div>
                      </div>

                       <div class="panel panel-default">
                        <div class="panel-heading" role="tab" id="headingFive">
                          <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                              Q5. What is a singleton class? Give a practical example of its usage.
                            </a>
                          </h4>
                        </div>
                        <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                          <div class="panel-body">
                             A singleton class in java can have only one instance and hence all its methods and variables belong to just one instance. Singleton class concept is useful for the situations when there is a need to limit the number of objects for a class.
                              The best example of singleton usage scenario is when there is a limit of having only one connection to a database due to some driver limitations or because of any licensing issues.
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
