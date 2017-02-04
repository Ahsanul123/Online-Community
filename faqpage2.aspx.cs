using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Text;
using System.Configuration;
using System.Web.Security;
using System.Data;
using System.IO;

public partial class Default2 : System.Web.UI.Page
{

    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string productId = Request.QueryString["ID"];
            if (productId == null)
            {
                Response.Redirect("faqpage.aspx");
            }

            SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

            con.Open();
            //SqlDataReader dr;
            cmd = new SqlCommand("SELECT * from tblQuestion where Id = '" + productId + "'", con);
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            Label1.Text = reader["questionTitle"].ToString();
            Label2.Text = reader["questionDescription"].ToString();

            LoadComment();

        }
    }

    protected void LoadComment()
    {
        string productId = Request.QueryString["ID"];
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        con.Open();
        cmd = new SqlCommand("SELECT * from tblAnswer where questionId = '" + productId + "'", con);
        SqlDataReader reader = cmd.ExecuteReader();
        int i = 1;
        while (reader.Read())
        {
            placeholder1.Controls.Add(new LiteralControl("<h3><a>"));
            Label objLabel = new Label();
            objLabel.ID = "label" + i.ToString();

            objLabel.Text = "<h3><a>" + reader["username"].ToString() + ": </h3></a>";
            Label objLabel2 = new Label();
            objLabel2.ID = "lbl" + i.ToString();
            objLabel2.Text = "<pre>" + reader["answer"].ToString() + "</pre><br/>";

            //placeholder1.Controls.Add(new LiteralControl("<br/>"));



            placeholder1.Controls.Add(objLabel);
            placeholder1.Controls.Add(objLabel2);
            i++;


            placeholder1.Controls.Add(new LiteralControl("<hr/>"));
            //<hr style="width: 100%; color: black; height: 1px; background-color:black;" />
        }

    }

    protected void ButtonComment_Click(object o, EventArgs e)
    {
        string productId = Request.QueryString["ID"];
        int id = Convert.ToInt32(productId);
        string filename = TextBox1.Text.ToString();

        if (filename != null && Session["login"] != null)
        {
            string fiileUsername = Session["login"].ToString();
            string cs = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spUploadAnswer", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramName = new SqlParameter()
                {
                    ParameterName = @"answer",
                    Value = filename
                };
                cmd.Parameters.Add(paramName);



                SqlParameter paramDescription = new SqlParameter()
                {
                    ParameterName = @"questionId",
                    Value = id
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

                TextBox1.Text = null;
            }
            LoadComment();
        }
    }



}