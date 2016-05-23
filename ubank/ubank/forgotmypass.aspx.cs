using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ubank
{
    public partial class forgotmypass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

                lblError.Text = "";

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (UserIDTextBox.Text.Length <= 0)
            {

                return;
            }
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());


            if (Conn.State == ConnectionState.Closed)
            {
                Conn.Open();
            }


            SqlDataAdapter Da = new SqlDataAdapter("SELECT UserID, UserName, Password  FROM dbo.UserManager WHERE (UserID = '" + UserIDTextBox.Text + "')", Conn);
            DataSet Ds = new DataSet();
            Da.Fill(Ds);

            if (Ds.Tables[0].Rows.Count <= 0)
            {
                lblError.ForeColor = System.Drawing.Color.Red;
                lblError.Text = "Invalid Login ID does not exist";
                return;

            }

            
            Class1 getemailAddress = new Class1();
            Class1 forEamilList = new Class1();
            
            string toEmailAddress = getemailAddress.getAnyFieldFromView(UserIDTextBox.Text, "OrgEmail");
            
            Boolean IsEmailSent;
            Class1 forsendemail = new Class1();
            string strSubject = "Forgot Password";
            string emailbody;

            emailbody = "Dear " + Ds.Tables[0].Rows[0].ItemArray[1].ToString() + ",\n\n\r";
            emailbody += "Your login information is as under: \n\n\r";
            emailbody += "Login ID: " + Ds.Tables[0].Rows[0].ItemArray[0].ToString() + "\n";
            emailbody += "Password: " + Ds.Tables[0].Rows[0].ItemArray[2].ToString() + "\n\n\r";
            emailbody += "Note: You may change your password by using the 'Change Password' option, which is available after you login to the system. \n\n\r";
            emailbody += "Regards, \n\n\n\r";
            emailbody += "Note: This is an auto generated email. Please do not reply to this email.";

            IsEmailSent = forsendemail.SendEmail(ConfigurationManager.AppSettings["FromEmailAddress"], toEmailAddress, "" , "[" + strSubject + "]" , emailbody);
            if (IsEmailSent)
            {
                lblError.ForeColor = System.Drawing.Color.Green;
                lblError.Text = "Your password details has been sent to you at " + toEmailAddress + ".";
            }
            else
            {
                lblError.ForeColor = System.Drawing.Color.Red ;
                lblError.Text = "Sorry! Can not generate email to send you detail about your passowrd at " + toEmailAddress + ".";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            UserIDTextBox.Text = "";
        }
    }
}