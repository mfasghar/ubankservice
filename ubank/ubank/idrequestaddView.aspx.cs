using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Net.Mail;

namespace ubank
{
    public  partial class idrequestaddView : System.Web.UI.Page
    {
        Int64 newTID;
        string strmessage;
        protected void Page_Load(object sender, EventArgs e)
        {
            
          if(Session["LoginSession"] == null || Session["LoginSession"] == "")
            {
                Response.Redirect("sessexp.aspx", false);
                return;
            }
            
            Boolean strValue;
            string struserid = Session["UserID"].ToString();
            string strFileName = Path.GetFileName(Request.PhysicalPath); //idrequestaddView.aspx
            Class1 objGlobalASA = new Class1();


            strValue = objGlobalASA.CheckRightsForAll(struserid, strFileName, 1);

            if(strValue != true) 
            {

                Session["ErrDes"] = "";
                Session["ErrDes"] = "You don’t have Privileges. Please contact with Web Administrator";
                Response.Redirect("blankpg.aspx");

            }

            
            TextBox appdateexbox = (TextBox)FormView1.FindControl("AppDateTextBox");
            appdateexbox.Text = DateTime.Today.ToString("dd-MMM-yyyy");
         
        }

        protected void SQLDBItemInserted(object sender, SqlDataSourceStatusEventArgs e)
        {


            newTID = Convert.ToInt64(e.Command.Parameters["@AppId"].Value);

        }
        protected void ItemInserted(Object sender, FormViewInsertedEventArgs e)
        {
            
            if (e.Exception == null)
            {

                if (e.AffectedRows == 1)
                {
                    /*  UserRequestTypeIDTextBox
                        Subject Request for <> 
                        It is an auto generated email to inform you that request for <> has been generated, you are requested to click on following ling to approve/reject the request.
                        http://172.24.1.74:8080/
                        Regards,
                     *  
                     */

                    Class1 forEamilList = new Class1();
                    
                    string strRequestType = ((DropDownList)((FormView)sender).FindControl("UserRequestTypeIDTextBox")).SelectedItem.Text;
 
                    string emailbody;
                    emailbody = "This is an auto generated email, to inform you that request for " + strRequestType + " has been submitted with TID " + newTID + ",\n"; 
                    emailbody += "you are requested to click on following link to approve/reject the request.";
                    emailbody += "\n\nhttp://172.24.1.74:8080/";
                    emailbody += "\n\n\nRegards";

                    Boolean IsEmailSent ;
                    Class1 forsendemail = new Class1();
                    IsEmailSent = forsendemail.SendEmail(ConfigurationManager.AppSettings["FromEmailAddress"], forEamilList.getEmailAgainst(newTID), "", "["  + newTID + "]" + " Request for " + strRequestType, emailbody);

                    strmessage = "Record inserted successfully. Application Tracking ID is " + Convert.ToString(newTID) + " :: " + (IsEmailSent ? "Email has been sent" : "");
                    lblMessageLabel.ForeColor = System.Drawing.Color.Green;
                    lblMessageLabel.Text = strmessage;
                }
                else
                {

                    strmessage = "An error occurred during the save operation.";
                    lblMessageLabel.ForeColor = System.Drawing.Color.Red;
                    lblMessageLabel.Text = strmessage;
                    e.KeepInInsertMode = true;
                }
            }
            else
            {
                lblMessageLabel.ForeColor = System.Drawing.Color.Green;
                strmessage = "Error: Sorry can’t save the information. " + e.Exception.Message; //e.Values[0].ToString() +   e.Exception.Message;
                lblMessageLabel.Text = strmessage;
                // Use the ExceptionHandled property to indicate that the 
                // exception has already been handled.
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
        }

        protected void FormView1_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }


        protected void frmAsset_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            e.Values["SystemRoleID"] = ((DropDownList)((FormView)sender).FindControl("cmbSystemRoleID")).SelectedValue;
        }

        protected void InsertCancelButton_Click(object sender, EventArgs e)
        {
            lblMessageLabel.ForeColor = System.Drawing.Color.Red;
            lblMessageLabel.Text = "";
        }

        protected void UserRequestTypeIDTextBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList lUserRequestTypeIDTextBox =  (DropDownList)FormView1.FindControl("UserRequestTypeIDTextBox");
            Class1 cs = new Class1();
            RequiredFieldValidator RequiredFieldValidator9 = (RequiredFieldValidator)FormView1.FindControl("RequiredFieldValidator9");
            RequiredFieldValidator RequiredFieldValidator10 = (RequiredFieldValidator)FormView1.FindControl("RequiredFieldValidator10");

            if (Convert.ToBoolean(cs.AnyFieldFromFormType(Convert.ToInt32(lUserRequestTypeIDTextBox.SelectedValue), "IsLimitsRequired")))
            {
               
                RequiredFieldValidator9.ValidationGroup = "InsertApp";
                RequiredFieldValidator10.ValidationGroup = "InsertApp";
                EnableLimits();

            }
            else
            {
                RequiredFieldValidator9.ValidationGroup = "";
                RequiredFieldValidator10.ValidationGroup = "";
                DisableLimits();
            }
            
          
        }
               
        public void EnableLimits ()
        {
            TextBox UserLimitsDrTextBox = (TextBox)FormView1.FindControl("UserLimitsDrTextBox");
            TextBox UserLimitCrTextBox = (TextBox)FormView1.FindControl("UserLimitCrTextBox");
            TextBox UserSupLimitDrTextBox = (TextBox)FormView1.FindControl("UserSupLimitDrTextBox");
            TextBox UserSupLimitCrTextBox = (TextBox)FormView1.FindControl("UserSupLimitCrTextBox");

            TextBox IBATranLimitDrTextBox = (TextBox)FormView1.FindControl("IBATranLimitDrTextBox");
            TextBox IBATranLimitCrTextBox = (TextBox)FormView1.FindControl("IBATranLimitCrTextBox");
            TextBox IBATranSupLimitDrTextBox = (TextBox)FormView1.FindControl("IBATranSupLimitDrTextBox");
            TextBox IBATranSupLimitCrTextBox = (TextBox)FormView1.FindControl("IBATranSupLimitCrTextBox");

            TextBox ODLimitTextBox = (TextBox)FormView1.FindControl("ODLimitTextBox");

            UserLimitsDrTextBox.Enabled = true;
            UserLimitCrTextBox.Enabled = true;
            UserSupLimitDrTextBox.Enabled = true;
            UserSupLimitCrTextBox.Enabled = true;

            IBATranLimitDrTextBox.Enabled = true;
            IBATranLimitCrTextBox.Enabled = true;
            IBATranSupLimitDrTextBox.Enabled = true;
            IBATranSupLimitCrTextBox.Enabled = true;
            ODLimitTextBox.Enabled = true;

        }
        public void DisableLimits()
        {
            TextBox UserLimitsDrTextBox = (TextBox)FormView1.FindControl("UserLimitsDrTextBox");
            TextBox UserLimitCrTextBox = (TextBox)FormView1.FindControl("UserLimitCrTextBox");
            TextBox UserSupLimitDrTextBox = (TextBox)FormView1.FindControl("UserSupLimitDrTextBox");
            TextBox UserSupLimitCrTextBox = (TextBox)FormView1.FindControl("UserSupLimitCrTextBox");

            TextBox IBATranLimitDrTextBox = (TextBox)FormView1.FindControl("IBATranLimitDrTextBox");
            TextBox IBATranLimitCrTextBox = (TextBox)FormView1.FindControl("IBATranLimitCrTextBox");
            TextBox IBATranSupLimitDrTextBox = (TextBox)FormView1.FindControl("IBATranSupLimitDrTextBox");
            TextBox IBATranSupLimitCrTextBox = (TextBox)FormView1.FindControl("IBATranSupLimitCrTextBox");

            TextBox ODLimitTextBox = (TextBox)FormView1.FindControl("ODLimitTextBox");

            UserLimitsDrTextBox.Enabled = false;
            UserLimitCrTextBox.Enabled = false;
            UserSupLimitDrTextBox.Enabled = false;
            UserSupLimitCrTextBox.Enabled = false;

            IBATranLimitDrTextBox.Enabled = false;
            IBATranLimitCrTextBox.Enabled = false;
            IBATranSupLimitDrTextBox.Enabled = false;
            IBATranSupLimitCrTextBox.Enabled = false;
            ODLimitTextBox.Enabled = false;
        }

        public void SendEmail(string to, string Subject, string from , string body)
        {
            MailMessage message = new System.Net.Mail.MailMessage();
            message.To.Add("salman.malik@ubank.com.pk");
            message.Subject = "Test eamil subject";
            message.From = new System.Net.Mail.MailAddress("salman.khalil@ubank.com.pk");
            message.Body = "This is the message body";
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient(ConfigurationManager.AppSettings["smtpServer"].ToString());
             smtp.Send(message);
             //return true;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            SendEmail("", "", "", "");

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {

        }

       
    }
}