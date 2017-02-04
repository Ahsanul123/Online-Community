<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchajax.aspx.cs" Inherits="searchajax" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

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



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Online Community</title>
    <link rel="icon" type="image/png" href="icon/image.png" />
   
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
                        <%--<asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Search"></asp:TextBox>
                        --%><button type="submit" class="btn btn-default">Submit</button>
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
        <li ><a href="Default.aspx">Home</a></li>
        <li class="active"><a href="Friend.aspx">Friends</a></li>
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
        <div class="">

             <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div>   
    <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
    <asp:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtCity"
         MinimumPrefixLength="1" EnableCaching="true" CompletionSetCount="1" CompletionInterval="1000"
         ServiceMethod="GetCity" UseContextKey="True" >
    </asp:AutoCompleteExtender>
    </div>
        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" EnableModelValidation="True">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <asp:Label ID="questionTitleLabel" runat="server" Text='<%# Eval("questionTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="questionDescriptionLabel" runat="server" Text='<%# Eval("questionDescription") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    </td>
                    <td>
                        <asp:TextBox ID="questionTitleTextBox" runat="server" Text='<%# Bind("questionTitle") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="questionDescriptionTextBox" runat="server" Text='<%# Bind("questionDescription") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="questionTitleTextBox" runat="server" Text='<%# Bind("questionTitle") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="questionDescriptionTextBox" runat="server" Text='<%# Bind("questionDescription") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <asp:Label ID="questionTitleLabel" runat="server" Text='<%# Eval("questionTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="questionDescriptionLabel" runat="server" Text='<%# Eval("questionDescription") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table id="itemPlaceholderContainer" runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server">questionTitle</th>
                                    <th runat="server">questionDescription</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <asp:Label ID="questionTitleLabel" runat="server" Text='<%# Eval("questionTitle") %>' />
                    </td>
                    <td>
                        <asp:Label ID="questionDescriptionLabel" runat="server" Text='<%# Eval("questionDescription") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:logDBConnectionString %>" SelectCommand="SELECT [questionTitle], [questionDescription] FROM [tblQuestion] WHERE ([questionTitle] LIKE '%' + @questionTitle + '%')">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtCity" Name="questionTitle" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
              

        </div>
    </div>
  </div>
</div>



        </form>
    </body>
    </html>