using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            BindGrid();
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
    
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string connectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        string insertSql = "INSERT INTO login(FirstName, LastName,username,password,Email,Address,Gender) values (@FirstName,@LastName,@UserName,@Password,@Email,@Address,@Gender)";

        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = insertSql;

        SqlParameter firstName = new SqlParameter("@FirstName", SqlDbType.VarChar, 50);
        firstName.Value = txtFirstName.Text.ToString();
        cmd.Parameters.Add(firstName);

        SqlParameter LastName = new SqlParameter("@LastName", SqlDbType.VarChar, 50);
        LastName.Value = txtLastName.Text.ToString();
        cmd.Parameters.Add(LastName);

        SqlParameter UserName = new SqlParameter("@UserName", SqlDbType.VarChar, 50);
        UserName.Value = txtUserName.Text.ToString();
        cmd.Parameters.Add(UserName);

        SqlParameter Password = new SqlParameter("@Password", SqlDbType.VarChar, 50);
        Password.Value = txtPassword.Text.ToString();
        cmd.Parameters.Add(Password);

        SqlParameter Email = new SqlParameter("@Email", SqlDbType.VarChar, 50);
        Email.Value = txtEmail.Text.ToString();
        cmd.Parameters.Add(Email);

        SqlParameter Gender = new SqlParameter("@Gender", SqlDbType.VarChar, 50);
        Gender.Value = RdoGender.Text.ToString();
        cmd.Parameters.Add(Gender);

        SqlParameter Address = new SqlParameter("@Address", SqlDbType.VarChar, 50);
        Address.Value = txtAddress.Text.ToString();
        cmd.Parameters.Add(Address);

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            lblMsg.Text = "Registered Successfully..";
            ClearControls(Page);
        }
        catch(SqlException ex)
        {
            string errorMessage = "Error in registring user";
            errorMessage += ex.Message;
            throw new Exception(errorMessage);
        }
        finally
        {
            con.Close();
        }


        /**
        SqlConnection con = new SqlConnection();
        con.ConnectionString = ConfigurationManager.ConnectionStrings["mycon"].ConnectionString;
        con.Open();

        SqlCommand cmd = new SqlCommand();
        //cmd.Connection = con;

        try
        {
            cmd.Connection = con; //assigning connection to command
            cmd.CommandType = CommandType.Text; //representing type of command
            //cmd.CommandText = "INSERT INTO UserDetails (Fname,Lname,Email,Password,Gender,Dob,Mobile,Address) values
            // (@Fname,@Lname,@Email,@Password,@Gender,@Dob,@Mobile,@Address)";
            cmd.CommandText = "INSERT INTO login values(@username,@Fname,@Lname,@Email,@Password,@Gender)";

            
            //adding parameters with value
            cmd.Parameters.AddWithValue("@username", txtUserName.Text.ToString());
            cmd.Parameters.AddWithValue("@Fname", txtFirstName.Text.ToString());
            cmd.Parameters.AddWithValue("@Fname", txtFirstName.Text.ToString());
            cmd.Parameters.AddWithValue("@Lname", txtLastName.Text.ToString());
            cmd.Parameters.AddWithValue("@Email", txtEmail.Text.ToString());
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text.ToString());
            cmd.Parameters.AddWithValue("@Gender", RdoGender.SelectedItem.Text.ToString());
            cmd.Parameters.AddWithValue("@Address", txtAddress.Text.ToString());
            
            con.Open(); //opening connection
            cmd.ExecuteNonQuery();  //executing query
            con.Close(); //closing connection
            lblMsg.Text = "Registered Successfully..";

        }
        catch (Exception ex)
        {
            lblMsg.Text = ex.Message.ToString();
        }
         * 
         */

    }

    public static void ClearControls(Control Parent)
    {
        foreach (Control c in Parent.Controls)
            ClearControls(c);
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        //refreshing/reloading page to clear all the controls
        Page.Response.Redirect(Page.Request.Url.ToString(), true);
    }
    protected void Home_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
    
}