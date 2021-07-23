using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class product : System.Web.UI.Page
{
    SqlConnection db;
    Boolean present;
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
                

                load_image();
                if (Request.QueryString["id"] != null)
                {
                    add_cart(Request.QueryString["id"].ToString());
                }
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

    protected void add_cart(string id)
    {
        try
        {
            existsincart();
            if (present == false) { 
            String add = "INSERT INTO carts(watchid,username,date,paymentstatus,paypalid) VALUES(";
            add+="" + id + ",'" + Session["member"].ToString() + "','none','cart','none')";
            SqlCommand com = new SqlCommand(add, db);
            if (com.ExecuteNonQuery()!=0)
            {
                Response.Write("<script>alert('Product added to cart')</script>");
            }
            else
            {
                Response.Write("<script>alert('Error')</script>");
            }
            }
            else
            {
                Response.Write("<script>alert('Error! This item is already in your cart')</script>");
            }

        }

        catch(Exception ex)
        {
            Response.Write(ex.Message);
        }

    }


    protected void existsincart()
    {
        try
        {
            String check = "SELECT COUNT(*) FROM Carts WHERE watchid='" + Request.QueryString["id"] + "' AND username='" + Session["member"].ToString() + "' AND paymentstatus='cart'";
            SqlCommand com = new SqlCommand(check, db);
            int row = Convert.ToInt32(com.ExecuteScalar().ToString());

            if (row > 0)
            {
                present = true;
            }
            else
            {
                present = false;
            }
            com.Dispose();

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void load_image()
    {
        try
        {
            String openimage = "SELECT profilephoto FROM tblusers WHERE username='" + Session["member"].ToString() + "'";
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
            Literal1.Text = (ex.Message);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT * FROM tblSellers WHERE model LIKE '%" + txtsearch.Text + "%'";
        Repeater1.DataSourceID = "SqlDataSource1";
        Repeater1.DataBind();
    }

    
}