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

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LoadData();
        }
    }

    private void LoadData()
    {
        string cs = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("Select * from tblQuestion", con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();
        }
    }



    protected void Post_Click(object sender, EventArgs e)
    {
            string filenameTitle = TextBox2.Text.ToString();
            string fileDescription = TextBox1.Text.ToString();

            if (filenameTitle != null && fileDescription != null && Session["login"] != null)
            {
                string fiileUsername = Session["login"].ToString();

                string cs = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("spUploadQuestion", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter paramName = new SqlParameter()
                    {
                        ParameterName = @"questionTitle",
                        Value = filenameTitle
                    };
                    cmd.Parameters.Add(paramName);



                    SqlParameter paramDescription = new SqlParameter()
                    {
                        ParameterName = @"questionDescription",
                        Value = fileDescription
                    };
                    cmd.Parameters.Add(paramDescription);

                    SqlParameter paramUsername = new SqlParameter()
                   {
                       ParameterName = @"username ",
                       Value = fiileUsername
                   };
                    cmd.Parameters.Add(paramUsername);


                    SqlParameter paramNewId = new SqlParameter()
                    {
                        ParameterName = "@NewId",
                        Value = -1,
                        Direction = ParameterDirection.Output
                    };
                    cmd.Parameters.Add(paramNewId);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();


                    TextBox2.Text = null;
                    TextBox1.Text = null;
                    Response.Redirect("~/faqpage2.aspx?Id=" + cmd.Parameters["@NewId"].Value.ToString());

                   /* hyperlink.Visible = true;
                    hyperlink.NavigateUrl = "~/WebForm2.aspx?Id=" +
                        cmd.Parameters["@NewId"].Value.ToString();*/

                }
            }
            else
            {
                Label1.Visible = true;
                Label1.ForeColor = System.Drawing.Color.Red;
                Label1.Text = "You must Log In First. And Must Fill Question Title and Description.";
                //hyperlink.Visible = false;
            }



    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/faqpage2.aspx?" + "ID=" + ((LinkButton)sender).Text);
    }


}