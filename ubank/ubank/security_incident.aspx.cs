using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class security_incident : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblServerTime.Text = DateTime.Now.ToString("D");


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String subject = combProjectDesc.SelectedItem.Text;

            String assinge_by = "Anonymous"; 
            String priority = DropDownList3.SelectedItem.Text;
            String location = cmbLocationID.SelectedItem.Text;
            String description = txtRequestDes.Text;
            Decimal Projectcategoryid = System.Convert.ToDecimal(combprojCat.SelectedItem.Value);
            String status = "Open";
            Decimal emp_idd = System.Convert.ToDecimal(emp_iddd.Text);
           

            databaseDataContext data = new databaseDataContext();

             RefComplaint obj = new RefComplaint { date = DateTime.Now, ActivityID = 1, Reported_channel_ID = '1', 
                 Assign_By = assinge_by, category = combprojCat.SelectedItem.Text, ProjectCatID = Projectcategoryid,
                                                   desription = description,
                                                   subject = subject,
                                                   Assigne_to = "mohsin",
                                                   priority = priority,
                                                   location = location,
                                                   status = status,
                                                   emp_id= emp_idd,
                                                   emp_designation=designation.Text,
                                                   emp_name=name.Text
                                                   
                                

             };


            

            data.RefComplaints.InsertOnSubmit(obj);
            data.SubmitChanges();
            decimal id = obj.complaint_id;
            Session["comlaint_id"] = id;

      /*      decimal id = obj.complaint_id;
            Session["comlaint_id"] = id;

           // Session["UserID"] = name.Text;
            Session["subject"] = combprojCat.SelectedItem.Text + " category of " + subject + " (" + id + ")";
            Session["date"] = DateTime.Now.ToString();
            Session["to"] = "Mr.Mohsin";
            Session["channel"] = "U Microfinance Bank";
            Session["problem"] = combprojCat.SelectedItem.Text;
            Session["system"] = subject;
            Session["module"] = combprojCat.SelectedItem.Text;*/

            Response.Redirect("incident_confirmation.aspx");
        }

  
      
    }
}