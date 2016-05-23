using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class sercurity_complaint_detail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            String id = Session["id"].ToString();
            decimal dec = System.Convert.ToDecimal(id);
            int actvity_id = System.Convert.ToInt16(activity.SelectedItem.Value);
            string des = TextBox1.Text;
            string time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");


            databaseDataContext data = new databaseDataContext();


            RefActivityDetail obj = new RefActivityDetail
            {


                complaint_id = dec,
                ActivityID = actvity_id,
                Activity_description = des,
                Activity_time = System.Convert.ToDateTime(time),
                Activity_performed_by = "Mohsin"

            };
            data.RefActivityDetails.InsertOnSubmit(obj);

            RefComplaint obj11 = data.RefComplaints.Single(c => c.complaint_id.Equals(dec));



            if (actvity_id.Equals(2) || actvity_id.Equals(10) || actvity_id.Equals(12))
            {

                obj11.status = "Close";
            }
            else
            {
                obj11.status = "Open";
            }






            obj11.ActivityID = actvity_id;
            //obj11.Assigne_to = assinge_to.SelectedItem.Text;
            data.SubmitChanges();
            Response.Redirect("validation_resolve.aspx");
        }

       
    }
}