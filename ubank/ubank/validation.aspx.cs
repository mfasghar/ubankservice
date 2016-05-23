using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class validation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string struserid = Session["UserID"].ToString();
           

            String subject = Session["subject"].ToString();
            String To = Session["to"].ToString();
            String date = Session["date"].ToString();
            String channel = Session["channel"].ToString();
            String problem = Session["problem"].ToString();
            String system21 = Session["system"].ToString();
            String subsystem = Session["module"].ToString();

            String email_for = "muhammad.mohsin@ubank.com.pk";
           databaseDataContext data = new databaseDataContext();
           var complaint1 = (from u in data.RefComplaints
                            where u.complaint_id.Equals(Session["comlaint_id"].ToString())
                            select u).FirstOrDefault();

          /* var user = (from u in data.UserManagers
                       where u.UserID.Equals(complaint1.Assign_By)
                       select u
                       ).FirstOrDefault();*/

            var user1 = (from u in data.UserManagers
                       where u.UserID.Equals(To)
                       select u
                       ).FirstOrDefault();

            //email_for = user1.OrgEmail;
            complaint.Text = "Dear " + complaint1.Assign_By+ ",";
            
            malsent.Text = "Your Complaint  " + Session["comlaint_id"].ToString() + "  is registered now and Email is also sent to User " + complaint1.Assigne_to.ToString() + " .";
            
            from.Text = complaint1.Reporters_email;
            datee.Text = date;
            emailfor.Text = "it.helpdesk@ubank.com.pk";
            subjectname.Text = subject;
            channelname.Text = channel;
            problemname.Text = problem;
            system.Text = system21;
            module.Text = subsystem;
            user_name.Text = complaint1.Assign_By;
        }

       

       
    }
}