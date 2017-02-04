
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Configuration;


public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindGrid();
        }
        HttpCookie userCookie;
        userCookie = Request.Cookies["Preferences"];


        if(userCookie != null)
        {
            if(!userCookie.Value.Equals(-1))
            {
                Session.Clear();
                Session["Login"] = Login1.UserName.ToString();
                Response.Redirect("success.aspx");
            }
        }
    }

    private void BindGrid()
    {
        string strConnString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(strConnString))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = "select Id, questionTitle from tblQuestion";
                cmd.Connection = con;
                con.Open();
                DataList1.DataSource = cmd.ExecuteReader();
                DataList1.DataBind();
                con.Close();
            }
        }
    }


    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        con.Open();

        SqlCommand select = new SqlCommand();
        select.Connection = con;

        select.CommandText = "select username from login where username = '" + Login1.UserName.ToString() + "' and password = '" + Login1.Password.ToString() + "'";
        SqlDataReader reader = select.ExecuteReader();
        if (reader.Read())
        {
            Session["login"] = Login1.UserName.ToString();
            if (Login1.RememberMeSet == true)
            {
                HttpCookie userCookie;
                userCookie = Request.Cookies["Preferences"];
                if (userCookie == null)
                {
                    userCookie = new HttpCookie("Preferences");
                    userCookie.Expires = DateTime.Now.AddMonths(1);
                    Response.Cookies.Add(userCookie);
                }

            }
            Response.Redirect("success.aspx");
        }
        reader.Close();
        con.Close();

    }
    protected void Registration_Click(object sender, EventArgs e)
    {
        Response.Redirect("registration.aspx");
    }

    protected void java_Click(object sender, EventArgs e)
    {
        Response.Redirect("success.aspx");
    }

}