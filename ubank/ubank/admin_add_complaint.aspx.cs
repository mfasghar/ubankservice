using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class admin_add_complaint : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            lblServerTime.Text = DateTime.Now.ToString("D");

            if (Session["LoginSession"] == null || Session["LoginSession"] == "")
            {
                Response.Redirect("sessexp.aspx", false);
                return;
            }


            Boolean strValue;
            string struserid = Session["UserID"].ToString();
            string strFileName = Path.GetFileName(Request.PhysicalPath); //idrequestaddView.aspx
            Class1 objGlobalASA = new Class1();


            strValue = objGlobalASA.CheckRightsForAll(struserid, strFileName, 1);

            if (strValue != true)
            {

                Session["ErrDes"] = "";
                Session["ErrDes"] = "You don’t have Privileges. Please contact with Web Administrator";
                Response.Redirect("blankpg.aspx");

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {

            if (FileUpload2.HasFile)
                // Call a helper method routine to save the file.
                SaveFile(FileUpload2.PostedFile);

            String subject = combProjectDesc.SelectedItem.Text;

            String assigne = combAssignename.SelectedItem.Value;

             
            String priority = DropDownList3.SelectedItem.Text;
            String location = cmbLocationID.SelectedItem.Text;
            String description = txtRequestDes.Text;
            Decimal Projectcategoryid = System.Convert.ToDecimal(combprojCat.SelectedItem.Value);
            String status = "Open";
            Decimal channel_id = System.Convert.ToDecimal(reported_channel.SelectedItem.Value);
           // Decimal reported_problem = System.Convert.ToDecimal(problem_request.SelectedItem.Value);


            String date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            databaseDataContext data = new databaseDataContext();


            RefComplaint obj = new RefComplaint { date = DateTime.Now, ActivityID = 1, Reported_channel_ID = channel_id, Reported_problem_ID = 11,
                Assign_By = reported_by.Text.ToString(), category = combprojCat.SelectedItem.Text, ProjectCatID = Projectcategoryid,
                desription = description, subject = subject, Assigne_to = assigne, priority = priority,
                location = location, status = status, Reporters_email=reports_email.Text.ToString(), Reporters_number=reporters_number.Text.ToString() };
            data.RefComplaints.InsertOnSubmit(obj);
            data.SubmitChanges();


            decimal id = obj.complaint_id;
            Session["comlaint_id"] = id;


            Session["subject"] = combprojCat.SelectedItem.Text + " category of " + subject + " (" + id + ")";
            Session["date"] = DateTime.Now.ToString();
            Session["to"] = assigne;
            
            Session["channel"] = reported_channel.SelectedItem.Value;
            Session["problem"] = 11;
            Session["system"] = subject;
            Session["module"] = combprojCat.SelectedItem.Text;

            var user = (from u in data.UserManagers
                        where u.UserID.Equals(assigne)
                        select u).FirstOrDefault();
            String to = user.OrgEmail.ToString();

           /* var user1 = (from u in data.UserManagers
                         where u.UserID.Equals(reported_by.Text)
                        select u).FirstOrDefault();*/

            //checking all feilds

            //string cc = user1.OrgEmail.ToString();
            SendEmail(to, "Complaint Issue", "hello hello hello");
        }

        void SaveFile(HttpPostedFile file)
        {
            String filename = Path.GetFileName(FileUpload2.PostedFile.FileName);
            String Extension = Path.GetExtension(FileUpload2.PostedFile.FileName);

            String FPath = Server.MapPath(filename);
            FileUpload2.SaveAs(FPath);


        }

        public void SendEmail(string to, string Subject,  string body)
        {
            String prob = " ";
            String complaint_idd = Session["comlaint_id"].ToString();
            String subject = combProjectDesc.SelectedItem.Text + " issue of " + combprojCat.SelectedItem.Text 
                + " From " + reported_channel.SelectedItem.Text + " ( Your Complaint Id is " + complaint_idd.ToString() + " ).";

            
                 prob = txtRequestDes.Text;
            
           
            MailMessage message = new System.Net.Mail.MailMessage();
            message.To.Add(to);
            //message.CC.Add(cc);
            message.CC.Add("ashi.iram@ubank.com.pk");
            message.Subject = subject;
            message.From = new System.Net.Mail.MailAddress("it.helpdesk@ubank.com.pk");

            databaseDataContext data = new databaseDataContext();
            var user = (from u in data.UserManagers
                        where u.UserID.Equals(combAssignename.SelectedItem.Value)
                        select u
                    ).FirstOrDefault();

            message.Body = "Dear " + user.UserName.ToString() + ", \n\n "
               + txtRequestDes.Text + "\n\nReported By:\n" + reported_by.Text
               + "\n" + reports_email.Text + "\n\n Kindly check and resolve the issue.\n\n Thank you & Regards \n UBank \n\n\n This Email is Auto-Generated by Ubank IT Help Desk.";


           /* message.Body = "Dear " + user.UserName.ToString() + ", \n\n Issue Subject : " + subject + "\n\n Issue Description:-\n\t"
                + txtRequestDes.Text + "\n\n Please Login to resolve complaint." + "\n\n Reported By:\n\t" + reported_by.Text
                + "\n\t" + reports_email.Text + "\n\n Kindly check and resolve the issue.\n\n Thank you & Regards \n UBank IT Help Desk \n\n This Email is Auto-Generated by Ubank IT Help Desk.";
            */

            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient(ConfigurationManager.AppSettings["smtpServer"].ToString());
            smtp.Send(message);

            Response.Redirect("validation.aspx");

            //return true;
        }

       





        protected void reported_channel_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (reported_channel.SelectedItem.Text.Contains("Other"))
            {

                other.Visible = true;
                otherchaneel.Visible = true;
            }
            else
            {

                other.Visible = false;
                otherchaneel.Visible = false;
            }
        }

        protected void txtRequestDes_TextChanged(object sender, EventArgs e)
        {

        }
    }
}