using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class login : System.Web.UI.Page
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


    protected void btnLogin_Click(object sender, EventArgs e)
    {
        String s = "SELECT * FROM tblusers WHERE username ='" + txtusername.Text + "' AND password='" + txtpassword.Text + "'";
        SqlCommand cm = new SqlCommand(s, db);
        SqlDataReader rd = cm.ExecuteReader();
        String usertype = "";
        if (rd.HasRows)
        {
            while (rd.Read())
            {
                usertype = rd[8].ToString();
            }

            if (usertype.Trim() == "Seller")
            {
                Session["member"] = txtusername.Text;
                Response.Write("<script>alert('Login accepted: usertype (seller)!')</script>");
                Response.Write("<script>alert('Redirecting to seller page'); window.location.href='sellerpage.aspx'</script>");
            }
            else {
                Session["member"] = txtusername.Text;
                Response.Write("<script>alert('Login accepted: usertype (buyer)!')</script>");
                Response.Write("<script>alert('Redirecting to buyer page'); window.location.href='product.aspx'</script>");

            }
            rd.Close();
        }

     
        else
        {
            Literal1.Text = "Login failed! please check your username/password";
        }
     
          

       
    }
}