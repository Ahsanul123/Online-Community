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


public partial class success : System.Web.UI.Page
{
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BindGrid();
            LoadSharepost();
                
                
                //LoadImages();



            this.imgDemo.Visible = false;
            if (Session["login"] != null)
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;

                con.Open();
                cmd = new SqlCommand("SELECT * FROM login where username = '" + Session["login"] + "'", con);
                try
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    reader.Read();
                    string FullName = reader["FirstName"].ToString() + " " + reader["LastName"].ToString();

                    Session["FullName"] = FullName;
                    lb1.Text = "<h2 color=red>Hello:: " + "<font color=red>" + Session["FullName"] + "</font></h2>";
                }
                catch(Exception)
                {

                }
                finally {
                    con.Close();
                }
            }

            if (Session["login"] == null)
                Response.Redirect("Default.aspx");
            else
            {
                Response.ClearHeaders();

                Response.AddHeader("Cache-Control", "no-cache, no-store, max-age=0, must-revalidate");

                Response.AddHeader("Pragma", "no-cache");

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


    protected void LoadSharepost()
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        con.Open(); //
        //SELECT * FROM tblSharepost ORDER BY Id DESC
        cmd = new SqlCommand("SELECT * FROM tblSharepost ORDER BY Id DESC", con);
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
            objLabel2.Text = "<h5>" + reader["PostDescription"].ToString() + "</h5>";
            
            byte[] bytes = (byte[])reader["ImageData"];
            string strBase64 = Convert.ToBase64String(bytes);
            //Image1.ImageUrl = "data:Image/png;base64," + strBase64;


            Image img = new Image();
            img.ID = "img" + i.ToString();
            img.ImageUrl = "data:Image/jpg;base64," + strBase64;
            //img.Height = 64;
            img.Width = 690;
            img.BorderStyle = BorderStyle.Double;
            img.BorderWidth = 3;
            img.BorderColor = System.Drawing.Color.Brown;
            //placeholder1.Controls.Add(new LiteralControl("<br/>"));



            placeholder1.Controls.Add(objLabel);
            placeholder1.Controls.Add(objLabel2);
            placeholder1.Controls.Add(img);
            placeholder1.Controls.Add(new LiteralControl("<hr />"));
            i++;
        }
    }


    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            HttpPostedFile postedFile = FileUpload1.PostedFile;
            string filename = Path.GetFileName(postedFile.FileName);
            string fileExtension = Path.GetExtension(filename);
            int fileSize = postedFile.ContentLength;
            string post = TextBox1.Text.ToString();
            


            if (post != null && Session["login"]!=null && (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
                || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp"))
            {
                string username = Session["login"].ToString();
                Stream stream = postedFile.InputStream;
                BinaryReader binaryReader = new BinaryReader(stream);
                Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);


                string cs = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmd = new SqlCommand("spSharepost", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    SqlParameter paramPost = new SqlParameter()
                    {
                        ParameterName = @"PostDescription",
                        Value = post
                    };
                    cmd.Parameters.Add(paramPost);

                    SqlParameter paramUsername = new SqlParameter()
                    {
                        ParameterName = "@username",
                        Value = username
                    };
                    cmd.Parameters.Add(paramUsername);

                    SqlParameter paramImageData = new SqlParameter()
                    {
                        ParameterName = "@ImageData",
                        Value = bytes
                    };
                    cmd.Parameters.Add(paramImageData);

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

                    LoadSharepost();
                    



                    //Response.Redirect(Request.RawUrl);

                    //lblMessage.Visible = true;
                    //lblMessage.ForeColor = System.Drawing.Color.Green;
                    //lblMessage.Text = "Upload Successful";
                    //hyperlink.Visible = true;
                    //hyperlink.NavigateUrl = "~/WebForm2.aspx?Id=" +
                    //    cmd.Parameters["@NewId"].Value.ToString();

                }
            }

            
        }
        else
        {
            Label2.Text = "You must fill Post box and must choose a jpg file.";
            LoadSharepost();

            //lblMessage.Visible = true;
            //lblMessage.ForeColor = System.Drawing.Color.Red;
            //lblMessage.Text = "Only images (.jpg, .png, .gif and .bmp) can be uploaded";
            //hyperlink.Visible = false;


        }
    }





    /* 
    ////// For GridView Control----------------------------------------------------///////
    
     
      
     private void LoadImages()
    {
        string cs = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("Select * from tblImages", con);
            con.Open();
            SqlDataReader rdr = cmd.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();
        }
    }

     
     
     
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        HttpPostedFile postedFile = FileUpload1.PostedFile;
        string filename = Path.GetFileName(postedFile.FileName);
        string fileExtension = Path.GetExtension(filename);
        int fileSize = postedFile.ContentLength;

        if (fileExtension.ToLower() == ".jpg" || fileExtension.ToLower() == ".gif"
            || fileExtension.ToLower() == ".png" || fileExtension.ToLower() == ".bmp")
        {
            Stream stream = postedFile.InputStream;
            BinaryReader binaryReader = new BinaryReader(stream);
            Byte[] bytes = binaryReader.ReadBytes((int)stream.Length);


            string cs = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("spUploadImage", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter paramName = new SqlParameter()
                {
                    ParameterName = @"Name",
                    Value = filename
                };
                cmd.Parameters.Add(paramName);

                SqlParameter paramSize = new SqlParameter()
                {
                    ParameterName = "@Size",
                    Value = fileSize
                };
                cmd.Parameters.Add(paramSize);

                SqlParameter paramImageData = new SqlParameter()
                {
                    ParameterName = "@ImageData",
                    Value = bytes
                };
                cmd.Parameters.Add(paramImageData);

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
                Response.Redirect(Request.RawUrl);
                
                //lblMessage.Visible = true;
                //lblMessage.ForeColor = System.Drawing.Color.Green;
                //lblMessage.Text = "Upload Successful";
                //hyperlink.Visible = true;
                //hyperlink.NavigateUrl = "~/WebForm2.aspx?Id=" +
                //    cmd.Parameters["@NewId"].Value.ToString();
                 
            }
        }
        else
        {
            
            //lblMessage.Visible = true;
            //lblMessage.ForeColor = System.Drawing.Color.Red;
            //lblMessage.Text = "Only images (.jpg, .png, .gif and .bmp) can be uploaded";
            //hyperlink.Visible = false;
           
             
        }
    }
     */



}





/*
    protected void LinkButton1_Click(object sender, GridViewCommandEventArgs e)
    {
        Response.Clear();
        Response.ContentType = "application/octet-stream";
        Response.AppendHeader("Content-Disposition", "filename="
            + e.CommandArgument);
        Response.TransmitFile(Server.MapPath("~/image/")
            + e.CommandArgument);
        Response.End();
    }
 */
