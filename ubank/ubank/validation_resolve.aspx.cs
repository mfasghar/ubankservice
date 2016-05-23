using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class validation_resolve : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            String id = Session["id"].ToString();
            // String id = Session["comlaint_id"].ToString();

            databaseDataContext data = new databaseDataContext();

            var complaint = (from u in data.RefComplaints
                             where u.complaint_id.Equals(id)
                             select u
                                 ).FirstOrDefault();

            var user = (from u in data.UserManagers
                        where u.UserID.Equals(complaint.Assign_By.ToString())
                        select u
                ).FirstOrDefault();

            var user1 = (from u in data.UserManagers
                         where u.UserID.Equals(Session["to"].ToString())
                         select u
              ).FirstOrDefault();



            string name = "Ashi Irum";
            subjectname.Text = Session["subject"].ToString();
            Class1 anyfield = new Class1();

            from.Text = anyfield.getAnyFieldFromView(complaint.Assigne_to.ToString(), "OrgEmail");
            emailfor.Text = complaint.Reporters_email.ToString();
            system.Text = Session["system"].ToString();
            user_name.Text = name;
            module.Text = Session["module"].ToString();
            String channel = Session["channel"].ToString();
            String problem = Session["problem"].ToString();
            datee.Text = Session["date"].ToString();




            var chan = (from u in data.Reported_channels
                        where u.Reported_channel_ID.Equals(channel)
                        select u).FirstOrDefault();

            var prob = (from u in data.RefReported_Problems
                        where u.Reported_problem_ID.Equals(problem)
                        select u).FirstOrDefault();

            channelname.Text = chan.Report_description;


            var comp = (from u in data.RefComplaints
                        where u.complaint_id.Equals(id)
                        select u).FirstOrDefault();

            if (comp.Reported_problem_ID.Equals(999))
            {


                //problemname.Text = comp.desription;

            }
            else
            {
                //problemname.Text = prob.Problem_description.ToString();
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string struserid = Session["UserID"].ToString();
            if (struserid.Equals("ashi"))
            {

                Response.Redirect("admin_view_complaints.aspx");

            }
            else
            {
                Response.Redirect("compaint_list.aspx");
            }
        }
    }
}