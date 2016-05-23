using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class admin_view_complaints : System.Web.UI.Page
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String idd = GridView1.SelectedRow.Cells[0].Text;

            Session["id"] = idd;
            String id = Session["id"].ToString();
            if (Session["id"] != null)
            {

                Response.Redirect("Activity_detail.aspx");
            }
        }


        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            String idd = GridView3.SelectedRow.Cells[0].Text;

            Session["id"] = idd;
            String id = Session["id"].ToString();
            if (Session["id"] != null)
            {

                Response.Redirect("activity_detail_close.aspx");
            }
        }


    }
}