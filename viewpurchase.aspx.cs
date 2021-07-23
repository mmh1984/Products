using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class viewpurchase : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["member"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            if (Page.IsPostBack == false)
            {
                SqlDataSource2.SelectCommand = "SELECT * FROM Carts WHERE username='" + Session["member"] + "' AND paymentstatus='paid'";
            }
            }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource2.SelectCommand="SELECT * FROM Carts WHERE username='" + Session["member"]+"' AND date='"+ DropDownList1.Text +"' AND paymentstatus='paid'";
        //GridView1.DataBind();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {

        SqlDataSource2.SelectCommand = "SELECT * FROM Carts WHERE username='" + Session["member"] + "' AND paymentstatus='paid'";
    }
}