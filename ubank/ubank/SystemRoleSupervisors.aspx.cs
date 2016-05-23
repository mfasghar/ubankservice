using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ubank
{
    public partial class SystemRoleSupervisors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            FormView1.ChangeMode(FormViewMode.Insert);
            
           // MessageLabel.Text = "";
            this.btnShowModle_ModalPopupExtender.Show();
        
        }

        
        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            ListBox1.DataBind();
        }

        protected void InsertButton_Click1(object sender, EventArgs e)
        {
            ListBox1.DataBind();
        }

        
    }
}