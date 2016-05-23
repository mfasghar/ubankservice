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
    public partial class idsecondlevel : System.Web.UI.Page
    {
        Int32 SuperviserLevelID = 0 ;
        Int32 ApplicationID = 0;

       
          
        protected void Page_Load(object sender, EventArgs e)
        {
            
          if(Session["LoginSession"] == null || Session["LoginSession"] == "")
            {
                Response.Redirect("sessexp.aspx", false);
                return;
            }



            Boolean strValue;
            string struserid = Session["UserID"].ToString();
            string strFileName = Path.GetFileName(Request.PhysicalPath); //idrequestaddView.aspx
            Class1 objGlobalASA = new Class1();


            strValue = objGlobalASA.CheckRightsForAll(struserid, strFileName, 1);

            if(strValue != true) 
            {

                Session["ErrDes"] = "";
                Session["ErrDes"] = "You don’t have Privileges. Please contact with Web Administrator";
                Response.Redirect("blankpg.aspx");
                
            }

            if (Page.IsPostBack)
            {


            } 
        }
        
        protected void CheckAndUpdateStatus(object sender, FormViewUpdatedEventArgs e)
        {
            if (e.AffectedRows > 0)
            {
                lblmsg.Text = "Applocation ID number " + Convert.ToInt32(FormView1.DataKey.Value).ToString() + " has been supervised successfully.";
                ListBox1.DataBind();
            }
            Class1 cs = new Class1();
            Int32 intLevelID;
            intLevelID = Convert.ToInt32(cs.getAnyFieldFromView(Session["UserID"].ToString(), "LevelID"));
            //Check the total remaning supervision and check the last supervisor 
            if (cs.checkIsLastSupervisor(Convert.ToInt32(FormView1.DataKey.Value)))
            {

                    SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
                    Conn.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE Application SET AppLevel = 98, IsSupComplete = 1 where AppID =" + Convert.ToInt32(FormView1.DataKey.Value), Conn);
                    cmd.ExecuteNonQuery();
                    lblmsg.ForeColor = System.Drawing.Color.Green;

            }
            
             else 
             {
    
                if (Convert.ToBoolean(cs.checkOneLevelComplete(Convert.ToInt32(FormView1.DataKey.Value), intLevelID)))
                {
                    SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
                    Conn.Open();
                    SqlCommand cmd = new SqlCommand("UPDATE Application SET AppLevel = " + intLevelID + " where AppID =" + Convert.ToInt32(FormView1.DataKey.Value), Conn);
                    cmd.ExecuteNonQuery();
                    lblmsg.ForeColor = System.Drawing.Color.Green;
                
                }
            }
            
        }

     

        protected void FormView1_PreRender(object sender, EventArgs e)
        {
            if (FormView1.CurrentMode == FormViewMode.Edit)
            {
                
            }
        }

        protected void cmdDecline_Click(object sender, EventArgs e)
        {


             if(Session["LoginSession"] == null || Session["LoginSession"] == "")
            {
                Response.Redirect("sessexp.aspx", false);
                return;
            }

            
            Boolean strValue;
            string struserid = Session["UserID"].ToString();
            string strFileName = Path.GetFileName(Request.PhysicalPath); //idrequestaddView.aspx
            Class1 objGlobalASA = new Class1();


            strValue = objGlobalASA.CheckRightsForAll(struserid, strFileName, 15);

            if(strValue != true) 
            {

                Session["ErrDes"] = "";
                Session["ErrDes"] = "You don’t have Privileges. Please contact with Web Administrator";
                Response.Redirect("blankpg.aspx");
                
            }



            Class1 cs = new Class1();
            Int32 intLevelID;

            TextBox reasonofDecline = (TextBox)FormView1.FindControl("txtDeclineReason") as TextBox;

            intLevelID = Convert.ToInt32(cs.getAnyFieldFromView(Session["UserID"].ToString(), "LevelID"));
                SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
                Conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Application SET AppLevel = " + intLevelID + ", IsDecline = 1, DeclineBy='" + Session["UserID"].ToString() + "', DeclineReason='" + reasonofDecline.Text + "' where AppID =" + Convert.ToInt32(FormView1.DataKey.Value), Conn);
                cmd.ExecuteNonQuery();
                lblmsg.Text = "Application ID number " + Convert.ToInt32(FormView1.DataKey.Value).ToString() + " has been Declined successfully.";
                ListBox1.DataBind();

          
        }


     
       
    }
}