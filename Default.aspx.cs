using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Text;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        load_image();
    }

    protected void load_image() {

        DirectoryInfo dir;
        StringBuilder sb = new StringBuilder();
        FileInfo[] files;

        //use this in offline mode
        dir = new DirectoryInfo(Server.MapPath("/images/watches/"));

        //this line below is when you upload in the server (remove the slash)
        //dir = new DirectoryInfo(Server.MapPath("/CO5027/images/watches/"));
        files = dir.GetFiles();
        products.Text = dir.ToString();
        sb.Append("<ul class='bxslider'>");
        foreach (FileInfo f in files)
          
        {
            String path = f.Name.ToString();
            //this line below is when you upload in the server (remove the slash)
            // sb.Append("<li><img src='/CO5027/images/watches/" + path + "'alt='" + path + "'/>");
            //this line below is for offline mode (add a slash when you upload)
            sb.Append("<li><img src='/images/watches/" + path + "'alt='" + path + "'/>");
            sb.Append("<h2>Title:" + path+ "</h2>");
            sb.Append("<h3>Price:</h3>");
            sb.Append("</li>");
            
        }
        sb.Append("</ul>");
        products.Text = sb.ToString();

    }
}