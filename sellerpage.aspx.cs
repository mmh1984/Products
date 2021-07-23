using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class sellerpage : System.Web.UI.Page
{
    SqlConnection db;
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
                SqlDataSource1.SelectCommand="SELECT * FROM tblSellers WHERE sellername='" + Session["member"] +"'";
                Repeater1.DataSourceID = "SqlDataSource1";
                Repeater1.DataBind();
                load_image();
                load_products();
            }
            if (Request.QueryString["logout"] != null)
            {
                Session.RemoveAll();
                Session.Clear();
                Response.Write("<script>alert('Logging out')</script>");
                Response.Write("<script>window.location.href='login.aspx'</script>");
            }

           

        }
        catch (Exception ex)
        {
            Literal1.Text = ex.Message;
        }
    }
    protected void load_image()
    {
        try {
            String openimage = "SELECT profilephoto FROM tblusers WHERE username='" + Session["member"].ToString() +"'";
            SqlCommand com = new SqlCommand(openimage, db);
            SqlDataReader rd = com.ExecuteReader();

            while (rd.Read())
            {
                Image1.ImageUrl = rd[0].ToString();
            }
            rd.Close();
            com.Dispose();
        }
        catch (Exception ex)
        {
            Literal1.Text=(ex.Message);
        }
    }

    protected void load_products()
    {
        try
        {
            String openproducts = "SELECT * FROM tblSellers WHERE sellername='" + Session["member"].ToString() + "'";
            SqlCommand com = new SqlCommand(openproducts, db);
            SqlDataReader rd = com.ExecuteReader();

           if (rd.HasRows)
            {

            }
           else
            {
                Literal2.Text = "<h1>You dont have anything to sell</h1>";
                Literal2.Text += "Click <a href='addwatch.aspx'> here </a>to Sell something";
            }
            rd.Close();
            com.Dispose();
        }
        catch (Exception ex)
        {
            Literal1.Text = (ex.Message);
        }
    }


}