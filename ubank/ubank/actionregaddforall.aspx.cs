using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Configuration;

namespace ubank
{
    public partial class actionregaddforall : System.Web.UI.Page
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


            if (FileUpload1.HasFile)
                // Call a helper method routine to save the file.
                SaveFile(FileUpload1.PostedFile);


            String subject = combProjectDesc.SelectedItem.Text;
           
                String assigne = combAssignename.SelectedItem.Text;
            
          
            String priority = DropDownList3.SelectedItem.Text;
            String location = cmbLocationID.SelectedItem.Text;
            String description = txtRequestDes.Text;
            Decimal Projectcategoryid = System.Convert.ToDecimal(combprojCat.SelectedItem.Value);
            String status = "Open";
            Decimal channel_id = System.Convert.ToDecimal(reported_channel.SelectedItem.Value);
            Decimal reported_problem = System.Convert.ToDecimal(problem_request.SelectedItem.Value);


            String date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            databaseDataContext data = new databaseDataContext();


            RefComplaint obj = new RefComplaint { date = DateTime.Now, ActivityID = 1, Reported_channel_ID = channel_id, Reported_problem_ID = reported_problem, Assign_By = Session["UserID"].ToString(), category = combprojCat.SelectedItem.Text, ProjectCatID = Projectcategoryid, desription = description, subject = subject, Assigne_to = assigne, priority = priority, location = location, status = status };
            data.RefComplaints.InsertOnSubmit(obj);
            data.SubmitChanges();


            decimal id = obj.complaint_id;
            Session["comlaint_id"] = id;

            

            Session["subject"] = combprojCat.SelectedItem.Text + " category of " + subject + " (" + id + ")";
            Session["date"] = DateTime.Now.ToString();
            Session["to"] = assigne;
            Session["channel"] = reported_channel.SelectedItem.Text;
            Session["problem"] = problem_request.SelectedItem.Text;
            Session["system"] = subject;
            Session["module"] = combprojCat.SelectedItem.Text;

            var user = (from u in data.UserManagers
                        where u.UserID.Equals(assigne)
                        select u).FirstOrDefault();
            String to = user.OrgEmail.ToString();

            string struserid = Session["UserID"].ToString();


            var user1 = (from u in data.UserManagers
                        where u.UserID.Equals(struserid)
                        select u).FirstOrDefault();

            String from = user1.OrgEmail.ToString();
           
            //checking all feilds

          
                SendEmail(to, "Complaint Issue", from, "hello hello hello");
            
            

          




          



        }


       
            public void SendEmail(string to, string Subject, string from , string body)
              {
                    string struserid = Session["UserID"].ToString();
                    String complaint_idd = Session["comlaint_id"].ToString();
           String subject = combProjectDesc.SelectedItem.Text + " issue of " +  combprojCat.SelectedItem.Text + " From " + reported_channel.SelectedItem.Text + " ( Your Complaint Id is" + complaint_idd.ToString() + " )." ;

           databaseDataContext data = new databaseDataContext();
           var user = (from u in data.UserManagers
                       where u.UserID.Equals(combAssignename.SelectedItem.Text)
                       select u
                       ).FirstOrDefault();

           var user1 = (from u in data.UserManagers
                        where u.UserID.Equals(struserid)
                        select u
                  ).FirstOrDefault();


            MailMessage message = new System.Net.Mail.MailMessage();
            message.To.Add(to);
            message.CC.Add(from);
            message.CC.Add("ashi.iram@ubank.com.pk");
            message.Subject = subject;
            message.From = new System.Net.Mail.MailAddress("webportal@ubank.com.pk");

            message.Body = "Dear " + user.UserName + ", \n\n The issue of " + combprojCat.SelectedItem.Text + " module of " + combProjectDesc.SelectedItem.Text + " raised by channel " + reported_channel.SelectedItem.Text + " .\n"
                            + user1.UserName + " has forwarded complaint " + problem_request.SelectedItem.Text + " is pending at your End, Mr/Ms " + combAssignename.SelectedItem.Text + ".Kindly check and resolve the issue.\n\n Thank you & Regards \n UBank \n\n\n This Email is Auto-Generated by Ubank Support Incident Record Portal."
                            + "\n Following are the steps to view the pending tasks that are posted in your account " + "\n1.  Open website http://localhost:2045/Default.aspx \n 2.  Logon to the website \n 3.  Under Live System tab Hover on Help desk support -> support incident tracking \n 4.  To Resolve complaints click on Add Complaint \n 5. To Add new complaint Click on View Complaint \n\n If you don’t have rights, please contact Web administrator";

                           

            
            System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient(ConfigurationSettings.AppSettings["smtpServer"].ToString());
             smtp.Send(message);

             Response.Redirect("validation.aspx");

             //return true;
              }

            protected void problem_request_SelectedIndexChanged(object sender, EventArgs e)
            {

                if (problem_request.SelectedItem.Text.Equals("Other"))
                {


                    txtRequestDes.Visible = true;

                }
                else {

                    txtRequestDes.Visible = false;
                
                }



            }

           

           

            protected void reported_channel_SelectedIndexChanged(object sender, EventArgs e)
            {
                if (reported_channel.SelectedItem.Text.Contains("Other"))
                {

                    other.Visible = true;
                    otherchaneel.Visible = true;
                }
                else {

                    other.Visible = false;
                    otherchaneel.Visible = false;
                }
            }

           

            void SaveFile(HttpPostedFile file)
            {
                String filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
                String Extension = Path.GetExtension(FileUpload1.PostedFile.FileName);

                String FPath = Server.MapPath(filename);
                FileUpload1.SaveAs(FPath);


            }
          
            
            

           


  }

 

    

      
       
        
    }
