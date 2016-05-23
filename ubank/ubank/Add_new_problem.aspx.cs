using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class Add_new_problem : System.Web.UI.Page
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

        

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            String description = problem_title.Text.ToString();
            Decimal p_id = System.Convert.ToDecimal(moudle.SelectedItem.Value);

            databaseDataContext data = new databaseDataContext();
            RefReported_Problem obj = new RefReported_Problem { Problem_description = description, ProjectCatID = p_id };
            data.RefReported_Problems.InsertOnSubmit(obj);
            data.SubmitChanges();

            problem_title.Text = "";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            String description = problem_title.Text.ToString();
            Decimal p_id = System.Convert.ToDecimal(moudle.SelectedItem.Value);

            databaseDataContext data = new databaseDataContext();
            RefReported_Problem obj = new RefReported_Problem { Problem_description = description, ProjectCatID = p_id };
            data.RefReported_Problems.InsertOnSubmit(obj);
            data.SubmitChanges();

            problem_title.Text = "";
        }

        protected void LinkButton1_Click21(object sender, EventArgs e)
        {
            String description = problem_title.Text.ToString();
            Decimal p_id = System.Convert.ToDecimal(moudle.SelectedItem.Value);

            databaseDataContext data = new databaseDataContext();
            RefReported_Problem obj = new RefReported_Problem { Problem_description = description, ProjectCatID = p_id };
            data.RefReported_Problems.InsertOnSubmit(obj);
            data.SubmitChanges();

            problem_title.Text = "";
        }

        
      

      

      
    }
}