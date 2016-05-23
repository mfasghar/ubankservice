using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class activity_final : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string struserid = Session["UserID"].ToString();
            head.Text = "Dear" + struserid + " ,";

            String id = Session["id"].ToString();
            decimal dec = System.Convert.ToDecimal(id);

            body.Text = "Your responce against complaint ID " + dec + " is registered.";

        }
    }
}