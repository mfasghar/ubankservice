using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
namespace ubank
{
    public partial class chgpas : System.Web.UI.Page
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

        protected void cmdChangePassword_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            //if (CompareValidator1.IsValid)
            //{ return; }
            SqlDataAdapter da = new SqlDataAdapter("SELECT OrgID, UserID, Password FROM UserManager where OrgID = " + Session["OrgID"] + "and UserID ='" + Session["UserID"].ToString() + "' and Password='" + txtOldPass.Text + "'", ConfigurationManager.ConnectionStrings["strConn"].ConnectionString);
            DataSet ds = new DataSet();
            da.Fill(ds, "UserManager");

            if (ds.Tables[0].Rows.Count > 0)
            {

                SqlDataSource1.Update();
                emptyField();
                lblMsg.Text = "Password has been changed successfully";


            }
            else if (ds.Tables[0].Rows.Count <= 0)
            {
                lblMsg.Text = "Old password is not correct";

            }
        }

        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            emptyField();
            lblMsg.Text = "";
        }
        protected void emptyField()
        {

            txtNewPass.Text = "";
            txtOldPass.Text = "";
            txtConNewPass.Text = "";



        }
    }
}