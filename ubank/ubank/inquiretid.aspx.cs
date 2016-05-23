using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace ubank
{
    public partial class inquiretid : System.Web.UI.Page
    {
        private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
        ReportDocument rptDoc = new ReportDocument();
        string selectFormula = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            rptDoc.Load(Server.MapPath("printuserrequest.rpt"));
            //rptDoc.Load(Server.MapPath("~/printuserrequest.rpt"));

            //if (!IsPostBack)
           // {
                ConnectionInfo connInfo = new ConnectionInfo();

                connInfo.ServerName = "172.24.1.74";

                connInfo.DatabaseName = "umbldms";

                connInfo.UserID = "sa";

                connInfo.Password = "Ubank@321";


                foreach (CrystalDecisions.CrystalReports.Engine.Table tbl in rptDoc.Database.Tables)
                {

                    TableLogOnInfo repTblLogonInfo = tbl.LogOnInfo;

                    repTblLogonInfo.ConnectionInfo = connInfo;

                    tbl.ApplyLogOnInfo(repTblLogonInfo);

                }

                CrystalReportViewer1.Visible = true;
                selectFormula = "{vAppReportOnTID.AppID} =" + TextBox1.Text + "";
                CrystalReportViewer1.DataBind();
                CrystalReportViewer1.ReportSource = rptDoc;
                CrystalReportViewer1.SelectionFormula = selectFormula;
                CrystalReportViewer1.RefreshReport();
           // }


                
            

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}