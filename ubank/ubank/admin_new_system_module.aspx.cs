using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace ubank
{
    public partial class admin_new_system_module : System.Web.UI.Page
    {
        databaseDataContext Data;
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

        protected void add_system_Click(object sender, EventArgs e)
        {
            string SystemText = system.Text.ToString();

            

             Data = new databaseDataContext();
            RefProject refpro = new RefProject { 
            ProjectDes=SystemText
            };
            Data.RefProjects.InsertOnSubmit(refpro);
            Data.SubmitChanges();
            system.Text = " ";
            Response.Redirect("admin_new_system_module.aspx");
           
        }

        protected void add_module_Click(object sender, EventArgs e)
        {
            Decimal DropDown_Text = System.Convert.ToDecimal(DropDownList1.SelectedValue) ;
            string Module_text = module.Text.ToString();
            Data = new databaseDataContext();
            RefProjectCateg refcat = new RefProjectCateg { 
            ProjectID=DropDown_Text,
            ProjectCatDesc=Module_text
            };
            Data.RefProjectCategs.InsertOnSubmit(refcat);
            Data.SubmitChanges();
            module.Text = " ";
            Response.Redirect("admin_new_system_module.aspx");
        }

        protected void add_system0_Click(object sender, EventArgs e)
        {
            string userid = DropDownList4.SelectedValue;
            string categoreyid = DropDownList3.SelectedValue;

            databaseDataContext data = new databaseDataContext();
            
            sirGroup group = new sirGroup {
            
            UserID = userid,
            ProjectCatID  = Convert.ToDecimal( categoreyid)
            };
        
            data.sirGroups.InsertOnSubmit(group);
            data.SubmitChanges();
            Response.Redirect("admin_new_system_module.aspx");
        }
    }
}