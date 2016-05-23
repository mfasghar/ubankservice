using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ubank
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // string Name = Request.QueryString["id"];

            String id= Session["id"].ToString();

            id_label.Text = id;

        }
    }
}
