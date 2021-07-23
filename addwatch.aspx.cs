using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class addwatch : System.Web.UI.Page
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

        }
        catch (Exception ex)
        {
            Literal1.Text = ex.Message;
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (watchexists())
        {
            Response.Write("<script>alert('Ooops,you already have this product in your list')</script>");
        }
        else
        {
            save_watch();
        }
    }

    protected void save_watch()
    {
        try
        {
            String type = System.IO.Path.GetExtension(FileUpload1.FileName);
            String path = "/images/watches/" + txtmodel.Text + type;
            FileUpload1.SaveAs(Server.MapPath("/images/watches/") + txtmodel.Text + type);
            String addwatch = "INSERT INTO tblSellers (brand,model,description,price,quantity,photo,sellername) VALUES(";
            addwatch += "'" + brand.Text + "','" + txtmodel.Text + "','" + txtdesc.Text + "'," + txtprice.Text + "," + txtqty.Text + ",'" + path + "','" + Session["Seller"].ToString() + "')";
            SqlCommand com = new SqlCommand(addwatch, db);
            com.ExecuteNonQuery();

            com.Dispose();
            Response.Write("<script>alert('Success!')</script>");
            Response.Write("<script>window.location.href='sellerpage.aspx'</script>");
        }
        catch (Exception ex)
        {
            Literal1.Text = ex.Message;
        }
    }

    protected Boolean watchexists()
    {
        try
        {
            String s = "SELECT COUNT(*) FROM tblSellers WHERE model ='" + txtmodel.Text + "' AND brand='" + brand.Text +"' AND sellername='" + Session["seller"].ToString()+"'";

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