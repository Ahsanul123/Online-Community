using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class demopage2 : System.Web.UI.Page
{
    SqlCommand cmd;
    /*
    string connStr = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
    SqlCommand com;
    SqlDataAdapter sqlda;
    DataSet ds;
    string str;
     */

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
                ResetStartTime();
            /*
            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            con.Open();

            SqlCommand select = new SqlCommand();
            select.Connection = con;

            select.CommandText = "select * from login";
            SqlDataReader reader = select.ExecuteReader();
            int i = 1;
            while (reader.Read())
            {
                Label objLabel = new Label();
                objLabel.ID = "label" + i.ToString();
                objLabel.Text = reader["username"].ToString() + ": ";
                Label objLabel2 = new Label();
                objLabel2.ID = "lbl" + i.ToString();
                objLabel2.Text = reader["Email"].ToString() + "<br/>";
                //Control is ready.Now let's add it to the form 
                form1.Controls.Add(objLabel);
                form1.Controls.Add(objLabel2);
                i++;
            }
             * 
             */
            /* 
            for (int i = 1; i <= 5; i++)
            {
                Label objLabel = new Label();
                objLabel.ID = "label" + i.ToString();
                objLabel.Text = "I am number " + i.ToString() + ".<br/>";

                //Control is ready.Now let's add it to the form 
                form1.Controls.Add(objLabel);
            }
             */
        }

    }

    void ResetStartTime()
    {
        Response.Write("ssssssssssssssssssssssss");
        //Session["StartTime"] = DateTime.Now;
    }

    protected void LoadComment()
    {
        string productId = Request.QueryString["ID"];
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

        con.Open();
        cmd = new SqlCommand("SELECT * from tblAnswer where Id = '" + productId + "'", con);
        SqlDataReader reader = cmd.ExecuteReader();
        int i = 1;
        while (reader.Read())
        {
            form1.Controls.Add(new LiteralControl("<h3><a>"));
            Label objLabel = new Label();
            objLabel.ID = "label" + i.ToString();

            objLabel.Text = "<h3><a>" + reader["username"].ToString() + ": </h3></a>";
            Label objLabel2 = new Label();
            objLabel2.ID = "lbl" + i.ToString();
            objLabel2.Text = "<pre>" + reader["answer"].ToString() + "</pre><br/>";

            form1.Controls.Add(new LiteralControl("<br/>"));



            form1.Controls.Add(objLabel);
            form1.Controls.Add(objLabel2);
            i++;
        }

    }
    
    void bindlist()
    {
        /*
        SqlConnection con = new SqlConnection(connStr);
        con.Open();
        str = "select * from login";
        com = new SqlCommand(str, con);
        SqlDataReader rdr = com.ExecuteReader();
        DataList1.DataSource = rdr;
        DataList1.DataBind();

        /*
        sqlda = new SqlDataAdapter(com);
        ds = new DataSet();
        sqlda.Fill(ds, "username");
        DataList1.DataMember = "username";
        sqlda.Fill(ds, "Email");
        DataList1.DataMember = "Email";
        DataList1.DataSource = ds;
        DataList1.DataBind();
        con.Close();

        SqlCommand cmd = new SqlCommand("Select * from tblImages", con);
        con.Open();
        SqlDataReader rdr = cmd.ExecuteReader();
        GridView1.DataSource = rdr;
        GridView1.DataBind();
         */ 
    }
    

}