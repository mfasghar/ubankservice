using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;

namespace ubank
{
    public partial class sybasestatement : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
           

            }
            //SqlDataSource1.DataBind()
             
            FormView1.DataBind();
            
            
           // BEGIN SYSTEM.CUSTSTAT('33145519167', '01-Feb-2014', '05-Feb-2014'); END;
           //  OracleCommand objCmd = new OracleCommand();
        }
    }
}