using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class ViewComplaints : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["LoginSession"] == null || Session["LoginSession"] == "")
            {
                Response.Redirect("sessexp.aspx", false);
                return;
            }

            Boolean strValue;
            string struserid = Session["UserID"].ToString();
            string strFileName = System.IO.Path.GetFileName(Request.PhysicalPath); //idrequestaddView.aspx
            Class1 objGlobalASA = new Class1();


            strValue = objGlobalASA.CheckRightsForAll(struserid, strFileName, 1);

            if (strValue != true)
            {

                Session["ErrDes"] = "";
                Session["ErrDes"] = "You don’t have Privileges. Please contact with Web Administrator";
                Response.Redirect("blankpg.aspx");

            }








            String id = Session["id"].ToString();
            decimal dec = System.Convert.ToDecimal(id);
            title.Text = id;

            databaseDataContext myDB = new databaseDataContext();



            var user = (from u in myDB.RefComplaints
                        where u.complaint_id.Equals(dec)
                        select u).FirstOrDefault();



            title.Text = user.subject;
            Assinge.Text = user.Assigne_to;
            date.Text = System.Convert.ToString(user.date);
            location.Text = user.location;
            priority.Text = user.priority;
            //description.Text = user.desription;
            category.Text = "internet";
            assinged_by.Text = strValue.ToString();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String id = Session["id"].ToString();
            decimal dec = System.Convert.ToDecimal(id);



            String acitvity_id = activity_name.SelectedItem.Value;

            databaseDataContext up = new databaseDataContext();
            //Get Single course which need to update
            RefComplaint  obj = up.RefComplaints.Single(c => c.complaint_id.Equals(dec));

            //Field which will be update

            int activity_id = System.Convert.ToInt16(activity_name.SelectedItem.Value);

            obj.ActivityID = activity_id;
            
            // executes the appropriate commands to implement the changes to the database
            up.SubmitChanges();

            databaseDataContext up1 = new databaseDataContext();

            RefActivityDetail activity = new RefActivityDetail { complaint_id = dec, ActivityID = activity_id};
            up1.RefActivityDetails.InsertOnSubmit(activity);
            up1.SubmitChanges();

            Response.Redirect("compaint_list.aspx");

        }



    }
}