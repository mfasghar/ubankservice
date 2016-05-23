using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class incident_confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String complaint = Session["comlaint_id"].ToString();
          
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("security_incident.aspx");
        }
    }
}