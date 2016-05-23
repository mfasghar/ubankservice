using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ubank.net.ufonegsm.esb;
using System.Data.SqlClient;
using ubank;

namespace ubank
{
    public partial class logs1 : System.Web.UI.Page
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
            ubank.Class1 objGlobalASA = new Class1();


            strValue = objGlobalASA.CheckRightsForAll(struserid, strFileName, 17);

            if (strValue != true)
            {

                Session["ErrDes"] = "";
                Session["ErrDes"] = "You don’t have Privileges. Please contact with Web Administrator";
                Response.Redirect("blankpg.aspx");

            }
        }
    }
}