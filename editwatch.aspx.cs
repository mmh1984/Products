using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class editwatch : System.Web.UI.Page
{
    SqlConnection db;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            db = new SqlConnection(ConfigurationManager.ConnectionStrings["WatchMen"].ConnectionString);
            db.Open();
            if (Session["Seller"] == null)
            {
                Response.Redirect("login.aspx");

            }
            else {
                if (Page.IsPostBack == false)
                {
                    load_watch();
                }

            }
        }
        catch (Exception ex)
        {
            Literal1.Text = ex.Message;
        }
    }

    protected void load_watch()
    {
        try
        {
            String open = "SELECT * FROM tblSellers WHERE id=" + Convert.ToInt32(Request.QueryString["id"]) + "";
            SqlCommand com = new SqlCommand(open, db);
            SqlDataReader rd = com.ExecuteReader();

            while (rd.Read())
            {
                brand.Text = rd[1].ToString();
                txtmodel.Text = rd[2].ToString();
                txtdesc.Text = rd[3].ToString();
                txtprice.Text = rd[4].ToString();
                txtqty.Text = rd[5].ToString();
             
            }

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

    }

    

    protected void updateproduct()
    {
        try
        {

            String updatemember = "UPDATE tblSellers SET brand='" + brand.Text + "',model='" + txtmodel.Text + "',description='" + txtdesc.Text + "',";
            updatemember += "price=" + Convert.ToDouble(txtprice.Text) + ",quantity=" + Convert.ToInt32(txtqty.Text) + " WHERE Id="+ Convert.ToInt32(Request.QueryString["id"]) + "";
            SqlCommand com = new SqlCommand(updatemember, db);
            com.ExecuteNonQuery();

            com.Dispose();
            Response.Write("<script>alert('Product successfully updated!')</script>");
            Response.Write("<script>window.location.href='sellerpage.aspx'</script>");
        }
        catch (Exception ex)
        {
            Literal1.Text = ex.Message;
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
       
      
            updateproduct();
     
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        try
        {
            String del = "DELETE FROM tblSellers WHERE Id=" + Convert.ToInt32(Request.QueryString["id"]) + "";
            SqlCommand com = new SqlCommand(del, db);
            if (com.ExecuteNonQuery()!=0)
            {
                Response.Write("<script>alert('Product Deleted!')</script>");
                Response.Write("<script>window.location.href='sellerpage.aspx'</script>");
            }
            com.Dispose();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}