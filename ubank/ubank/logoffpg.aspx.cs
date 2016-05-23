using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class logoffpg : System.Web.UI.Page
    {
      
        protected void Page_Init()
        { }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Abandon();

        }
           
   
    }
}