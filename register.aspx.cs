using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class register : System.Web.UI.Page
{
    SqlConnection db;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            db = new SqlConnection(ConfigurationManager.ConnectionStrings["WatchMen"].ConnectionString);
            db.Open();

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
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (ifuserexists())
        {
            Literal1.Text = "This username is already taken!";
            txtusername.Focus();
        }
        else
        {
            addmember();
        }
    }

    protected void addmember()
    {
        try
        {
            String type = System.IO.Path.GetExtension(FileUpload1.FileName);
            String path = "/images/users/" + txtusername.Text + type;
            FileUpload1.SaveAs(Server.MapPath("/images/users/") + txtusername.Text + type);
            String addmember = "INSERT INTO tblusers (username,password,fullname,dob,gender,email,profilephoto,membertype) VALUES(";
            addmember += "'" + txtusername.Text + "','" + txtpass.Text + "','" + txtfname.Text + "','" + txtdob.Text + "','" + gender.Text + "','" + txtemail.Text + "','" + path + "','" + membertype.Text +"')";
            SqlCommand com = new SqlCommand(addmember, db);
            com.ExecuteNonQuery();

            com.Dispose();
            Response.Write("<script>alert('Account successfully created!')</script>");
            Response.Write("<script>alert('Redirecting to login page'); window.location.href='login.aspx'</script>");
        }
        catch (Exception ex)
        {
            Literal1.Text = ex.Message;
        }
    }
}