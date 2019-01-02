using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Net;
using System.Net.Mail;

public partial class contact : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    private void IniText()
    {
        txtnm.Text = "";
        txtemail.Text = "";
        txtsubject.Text = "";
        txtmsg.Text = "";
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        //Send Mail Coding
        try
        {
            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress(txtemail.Text);
            // Sender e-mail address..Text);
            // Recipient e-mail address.
            Msg.To.Add("nitailtd@gmail.com");
            Msg.Subject = txtsubject.Text;
            Msg.Body = "Name :" + txtnm.Text + " <br><br> Email ID : " + txtemail.Text + "<br><br> Subject : " + txtsubject.Text + "<br><br> Message :" + txtmsg.Text;
            Msg.IsBodyHtml = true;
            // your remote SMTP server IP.
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("nitailtd@gmail.com", "rasika1980");
            smtp.EnableSsl = true;
            smtp.Send(Msg);
            //Response.Write("Mail Send Successfully...");
        }
        catch (Exception ex)
        {
            Console.WriteLine("{0} Exception caught.", ex);
            Response.Write("<script>alert('Please fill the Details Or Check Your Internet Connection...')</script>");
        }
        IniText();  
    }
}