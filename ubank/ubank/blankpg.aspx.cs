using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class blankpg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            IblErrorMsg.Text = Session["ErrDes"].ToString();
            
        }
    }
}