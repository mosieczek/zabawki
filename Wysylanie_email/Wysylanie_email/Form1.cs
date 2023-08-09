using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;
using System.Net.Mail;
using System.Web;

namespace Wysylanie_email
{
    public partial class Form1 : Form
    {
        public string adrFrom = "xyz@gmail.com"; //adres wysyłającego
        public string adrTo = "abc@gmail.com"; //adres odbiorcy
        public string subjectTxt = "testowy temat"; //temat wiadomości
        public string smtpServ = "smtp.gmail.com"; //smtp serwer
        public string username = "xyz@gmail.com"; //login do email
        public string passwrd = "pswrd123123"; //hasło do email
        public string mailbody = "Testowa treść wiadomości";

        public Form1()
        {
            InitializeComponent();
            receiverBox.Text = adrTo;
            subjectBox.Text = subjectTxt;
            contentBox.Text = mailbody;
        }

        private void receiverBox_TextChanged(object sender, EventArgs e)
        {
            adrTo = receiverBox.Text;
        }

        private void subjectBox_TextChanged(object sender, EventArgs e)
        {
            subjectTxt = subjectBox.Text;
        }

        private void contentBox_TextChanged(object sender, EventArgs e)
        {
            mailbody = contentBox.Text;
        }

        private void sendButton_Click(object sender, EventArgs e)
        {
            MailMessage message = new MailMessage(adrFrom, adrTo);  
            
            message.Subject = subjectTxt;
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient(smtpServ, 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential(username, passwrd);
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
            } 
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
