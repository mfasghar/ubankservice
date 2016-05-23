using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace ubank
{
    public partial class refroledef : System.Web.UI.Page
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

        protected void InsertedRec(object sender, FormViewInsertedEventArgs e)
        {
            ListBox1.DataBind();
        }
        protected void DeleteRec(object sender, FormViewDeletedEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                ListBox1.DataBind();

            }
        }
    }

}