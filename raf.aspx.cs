using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


public partial class raf : System.Web.UI.Page
{
    SqlCommand cmd;

    protected void Page_Load(object sender, System.EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            LoadSharepost();

            lstBackColor.Items.Add("White");
            lstBackColor.Items.Add("Red");
            lstBackColor.Items.Add("Green");
            lstBackColor.Items.Add("Blue");
            lstBackColor.Items.Add("Yellow");

            lstFontName.Items.Add("Times New Roman");
            lstFontName.Items.Add("Arial");
            lstFontName.Items.Add("Verdana");
            lstFontName.Items.Add("Tahoma");

            ListItem item = new ListItem();
            item.Text = BorderStyle.None.ToString();
            item.Value = ((int)BorderStyle.None).ToString();
            lstBorder.Items.Add(item);
            item = new ListItem();
            item.Text = BorderStyle.Double.ToString();
            item.Value = ((int)BorderStyle.Double).ToString();
            lstBorder.Items.Add(item);

            item = new ListItem();
            item.Text = BorderStyle.Solid.ToString();
            item.Value = ((int)BorderStyle.Solid).ToString();
            lstBorder.Items.Add(item);

            lstBorder.SelectedIndex = 0;

            imgDefault.ImageUrl = "default.png";
        }
    }

    protected void cmdUpdate_Click(object sender, System.EventArgs e)
    {
        //pnlCard.BackColor = Color.FromName(lstBackColor.SelectedItem.Text);
        lblGreeting.Font.Name = lstFontName.SelectedItem.Text;

        try
        {
            if (Int32.Parse(txtFontSize.Text) > 0)
            {
                lblGreeting.Font.Size = FontUnit.Point(Int32.Parse(txtFontSize.Text));
            }
        }
        catch
        {
        }
        pnlCard.BorderStyle = (BorderStyle)Int32.Parse(lstBorder.SelectedItem.Value);

        if (chkPicture.Checked == true)
        {
            imgDefault.Visible = true;
        }
        else
        {
            imgDefault.Visible = false;
        }
        lblGreeting.Text = txtGreeting.Text;
    }

    
    protected void LoadSharepost()
    {
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        con.Open();
        cmd = new SqlCommand("SELECT * from tblImages", con);
        SqlDataReader reader = cmd.ExecuteReader();
        int i = 1;
        while (reader.Read())
        {
            /*
            placeholder1.Controls.Add(new LiteralControl("<h3><a>"));
            Label objLabel = new Label();
            objLabel.ID = "label" + i.ToString();

            objLabel.Text = "<h3><a>" + reader["username"].ToString() + ": </h3></a>";
            Label objLabel2 = new Label();
            objLabel2.ID = "lbl" + i.ToString();
            objLabel2.Text = "<p>" + reader["PostDescription"].ToString() + "</p><br/>";
            */
            byte[] bytes = (byte[])reader["ImageData"];
            string strBase64 = Convert.ToBase64String(bytes);
            //Image1.ImageUrl = "data:Image/png;base64," + strBase64;


            Image img = new Image();
            img.ID = "img" + i.ToString();
            img.ImageUrl = "data:Image/jpg;base64," + strBase64;
            //img.Height = 64;
            img.Width = 790;
            img.BorderStyle = BorderStyle.Double;
            img.BorderWidth = 3;
            img.BorderColor = System.Drawing.Color.Brown;
            //placeholder1.Controls.Add(new LiteralControl("<br/>"));



            //placeholder1.Controls.Add(objLabel);
            //placeholder1.Controls.Add(objLabel2);
            placeholder1.Controls.Add(img);

            i++;
        }
    }

    /*
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            LoadPage();
        }

    }

    protected void LoadPage()
    {


        SqlConnection con = new SqlConnection();
            con.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
            con.Open();

            SqlCommand select = new SqlCommand();
            select.Connection = con;

            select.CommandText = "select * from login";
            SqlDataReader reader = select.ExecuteReader();
            int i = 1;
            int top = 25;
            while (reader.Read())
            {
                Label objLabel = new Label();
                objLabel.ID = "label" + i.ToString();
                objLabel.Text = reader["username"].ToString() + ": ";
                Label objLabel2 = new Label();
                objLabel2.ID = "lbl" + i.ToString();
                objLabel2.Text = reader["Email"].ToString() + "<br/>";
                form1.Controls.Add(new LiteralControl("<br/>"));
                TextBox textBox = new TextBox();
                textBox.ID = "textBox" + i.ToString();
                //textBox.Style["Top"] = top + "px";
                //textBox.Style["Left"] = "100px";
                textBox.Style["height"] = "30px";
                textBox.Style["Width"] = "200px";


                textBox.TextMode = TextBoxMode.MultiLine;

                //Control is ready.Now let's add it to the form 
                form1.Controls.Add(objLabel);
                form1.Controls.Add(objLabel2);
                form1.Controls.Add(textBox);
                i++;
                top = top + 65;
                form1.Controls.Add(new LiteralControl("<br/>"));
                form1.Controls.Add(new LiteralControl("<br/>"));
            }


       
        //int index = 1;
        //int top=10;


        //while()
        //{
        //    TextBox textBox = new TextBox();
        //    textBox.ID = "textBox" + index.ToString();
        //    textBox.Style.Add(HtmlTextWriterStyle.Position, "absolute");
        //    textBox.Style[HtmlTextWriterStyle.Top] = top + "px";
        //    textBox.Style[HtmlTextWriterStyle.Left] = "50px";
        //    top += 50;
        //    form1.Controls.Add(textBox);


        //}
        

    }
    */



    
}