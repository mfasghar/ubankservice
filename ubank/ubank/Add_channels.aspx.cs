using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class Add_channels : System.Web.UI.Page
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

        

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            databaseDataContext data = new databaseDataContext();

            Reported_channel obj = new Reported_channel { Report_description = channel_name.Text.ToString() };
            data.Reported_channels.InsertOnSubmit(obj);
            data.SubmitChanges();

            channel_name.Text = "";
        }

      

     

        
    }
}