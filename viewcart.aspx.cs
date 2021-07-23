using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class viewcart : System.Web.UI.Page
{
    SqlConnection db;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["member"]==null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            db = new SqlConnection(ConfigurationManager.ConnectionStrings["WatchMen"].ConnectionString);
            db.Open();
            if (cartempty())
            {
                Response.Write("<script>alert('Cannot preview cart! Your cart is empty')</script>");
                Response.Write("<script>window.location.href='product.aspx'</script>");
            }
            else {
            
            load_cart();
            }
        }
    }

    protected Boolean cartempty()
    {
        Boolean cart = false;
        try
        {
            String check = "SELECT COUNT(*) FROM Carts WHERE username='" + Session["member"] + "' AND paymentstatus='cart' ";
            SqlCommand com = new SqlCommand(check,db);
            int x = Convert.ToInt32(com.ExecuteScalar().ToString());

            if (x == 0)
            {
                cart = true;
            }
            else
            {
                cart = false;
            }
            
        }
        catch(Exception ex)
        {
            Response.Write(ex.Message);
           
        }
        return cart;
    }
    protected void load_cart()
    {
        try
        {
            
            SqlDataSource1.SelectCommand = "SELECT Carts.watchid,Carts.paymentstatus,tblSellers.brand, tblSellers.model, tblSellers.price, tblSellers.description, tblSellers.quantity, tblSellers.photo, tblSellers.sellername FROM Carts,tblSellers WHERE Carts.username='" + Session["member"].ToString() + "' AND Carts.paymentstatus='cart' AND Carts.watchid=tblSellers.Id";
            Repeater1.DataSourceID = "SqlDataSource1";
            Repeater1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        try
        {
            String del="DELETE FROM Carts WHERE username='" + Session["member"] +"'";
            SqlCommand com = new SqlCommand(del, db);

            if (com.ExecuteNonQuery()>0) {
                Response.Write("<script>alert('Cart empty!')</script>");
                Response.Write("<script>window.location.href='product.aspx'</script>");
            }

        }
        catch(Exception ex)
        {
            Response.Write(ex.Message);
        }
    }

    protected void btnPay_Click(object sender, EventArgs e)
    {
        try
        {
            String update="UPDATE Carts SET paymentstatus='paid',paypalid='" + txtemail.Text +"',date='" + DateTime.Now.ToString("dd/MM/yyyy")+"' WHERE username='" + Session["member"] +"'";
            SqlCommand com = new SqlCommand(update,db);
            if (com.ExecuteNonQuery()>0)
            {
                Response.Write("<script>alert('Processing your payment')</script>");
                Response.Write("<script>alert('Done.Thanks!')</script></script>");
                Response.Write("<script>window.location.href='product.aspx'</script>");
            }
        }
        catch(Exception ex)
        {
            Response.Redirect(ex.Message);
        }
    }
}