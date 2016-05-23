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

namespace ubank
{
    public partial class addeditdeleteuser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["LoginSession"] == null || Session["LoginSession"] == "")
            {
                Response.Redirect("sessexp.aspx", false);
                return;
            }


            string strValue;
            string struserid = Session["UserID"].ToString();
            string strFileName = Path.GetFileName(Request.PhysicalPath); //idrequestaddView.aspx
            Class1 objGlobalASA = new Class1();


            strValue = objGlobalASA.CheckUserIDRights(struserid, "Admin");

            if (strValue != "True")
            {

                Session["ErrDes"] = "";
                Session["ErrDes"] = "You don’t have Administrator Privileges. Please contact with Web Administrator";
                Response.Redirect("blankpg.aspx");

            }
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
           
       }

        protected void FormView2_PageIndexChanging(object sender, FormViewPageEventArgs e)
        {

        }

  
      
    }
}