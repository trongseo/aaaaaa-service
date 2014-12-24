using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
      //  Authenticate();

        Response.Redirect("Ainfo.aspx");
    }
    static void Authenticate()
    {
        //create the mail message
        MailMessage mail = new MailMessage();

        //set the addresses
        mail.From = new MailAddress("info@easywash.vn");
        mail.To.Add("trongtayninh@gmail.com");

        //set the content
        mail.Subject = "This is an email";
        mail.Body = "this is the body content of the email.";

        //send the message
        SmtpClient smtp = new SmtpClient("127.0.0.1");

        //to authenticate we set the username and password properites on the SmtpClient
        smtp.Credentials = new NetworkCredential("info@easywash.vn", "zaq123!@#");
        smtp.Send(mail);

    }
}