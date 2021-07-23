using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class edituser : System.Web.UI.Page
{
    SqlConnection db;
    String user;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            db = new SqlConnection(ConfigurationManager.ConnectionStrings["WatchMen"].ConnectionString);
            db.Open();
            if (Session["member"] == null)
            {
                Response.Redirect("login.aspx");

            }

           

            else {
                user = Session["member"].ToString();

                if (Request.QueryString["user"] == "buyer")
                {
                    Literal3.Text = "<a href = 'product.aspx' >Back </a>";

                }
                else
                {
                    Literal3.Text = "<a href = 'sellerpage.aspx' >Back </a>";
                }


                if (Page.IsPostBack == false)

                {

                   
                    load_user();
                    
                }

            }
        }
        catch (Exception ex)
        {
            Literal1.Text = ex.Message;
        }
    }

    protected void load_user()
    {
        try
        {
            String openuser="SELECT * FROM tblusers WHERE username='" + user +"'";
            SqlCommand com = new SqlCommand(openuser, db);
            SqlDataReader rd = com.ExecuteReader();

            while (rd.Read())
            {
                Literal1.Text = rd[0].ToString();
                txtusername.Text = rd[1].ToString();
                txtpass.Text = rd[2].ToString();
                txtfname.Text = rd[3].ToString();
                txtdob.Text = rd[4].ToString();
                gender.Text = rd[5].ToString();
                txtemail.Text = rd[6].ToString();
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (ifuserexists())
        {
            Literal1.Text = "This username is already taken!";
            txtusername.Focus();
        }
        else
        {
            updateuser();
        }
    }

    protected void updateuser()
    {
        try
        {
       
            String updatemember= "UPDATE tblusers SET username='" + txtusername.Text + "',password='" + txtpass.Text + "',fullname='" + txtfname.Text + "',";
            updatemember += "dob='" + txtdob.Text + "',gender='" + gender.Text + "',email='" + txtemail.Text + "' WHERE Id="+ Convert.ToInt32(Literal1.Text) +"";
            SqlCommand com = new SqlCommand(updatemember, db);
            com.ExecuteNonQuery();

            com.Dispose();
            update_seller();
            Response.Write("<script>alert('Account successfully update!')</script>");
            Response.Write("<script>alert('Redirecting to login page'); window.location.href='login.aspx'</script>");
        }
        catch (Exception ex)
        {
            Literal1.Text = ex.Message;
        }
    }

    protected void update_seller()
    {
        try
        {

            String updatemember = "UPDATE tblSellers SET sellername='" + txtusername.Text + "' WHERE sellername='"+ user +"'";
            SqlCommand com = new SqlCommand(updatemember, db);
            com.ExecuteNonQuery();

            com.Dispose();
          

        }
        catch (Exception ex)
        {
            Literal1.Text = ex.Message;
        }
    }

    protected Boolean ifuserexists()
    {
        try
        {
            String s = "SELECT COUNT(*) FROM tblusers WHERE username ='" + txtusername.Text + "'";
            SqlCommand cm = new SqlCommand(s, db);
            int result = Convert.ToInt32(cm.ExecuteScalar().ToString());

            if (result == 0)
            {
                return false;
            }
            else
            {
                return true;
            }


        }

        catch (Exception ex)
        {
            Literal1.Text = ex.Message;
            return true;
        }
    }


}




    