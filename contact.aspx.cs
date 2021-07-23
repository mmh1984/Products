using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;


public partial class contact_us : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            SmtpClient mailserver = new SmtpClient();
            mailserver.Host = "smtp.gmail.com";
            mailserver.Port = 587;
            mailserver.EnableSsl = true;

            System.Net.NetworkCredential userdetails = new System.Net.NetworkCredential();
            userdetails.UserName = "watchmenbrunei@gmail.com";
            userdetails.Password = "Edwin2016";

            mailserver.Credentials = userdetails;

            MailMessage feedback = new MailMessage(txtEmail.Text, "watchmenbrunei@gmail.com");

            feedback.Subject = "Subject: " + txtSubject.Text;
            feedback.Body += txtComments.Text;
            feedback.Body += "\n \n Message from: " + txtName.Text + "\n";
            feedback.Body += "\n \nemail: " + txtEmail.Text;

            mailserver.Send(feedback);
            Label1.Text=("You email was successfully sent!");
            clear_input();

        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }

    }

    protected  void clear_input()
    {
        txtComments.Text = "";
        txtEmail.Text = "";
        txtSubject.Text = "";
        txtName.Text = "";


    }

    protected void txtEmail_TextChanged(object sender, EventArgs e)
    {

    }
}
