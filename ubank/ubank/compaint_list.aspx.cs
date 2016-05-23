using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{

     
    public partial class compaint_list : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


           
            //string struserid = Session["UserID"].ToString();
            //session.Text=Session["UserID"].ToString();
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