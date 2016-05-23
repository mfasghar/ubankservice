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
    public partial class requeststatusonname : System.Web.UI.Page
    {

        private SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
        ReportDocument rptDoc = new ReportDocument();
        string selectFormula = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            rptDoc.Load(Server.MapPath("printuserrequest.rpt"));

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

            if (ListBox1.SelectedValue != "") 
            {
                

                CrystalReportViewer1.Visible = true;
                selectFormula = "{vAppReportOnTID.AppID} =" + ListBox1.SelectedValue + "";
                CrystalReportViewer1.DataBind();
                CrystalReportViewer1.ReportSource = rptDoc;
                CrystalReportViewer1.SelectionFormula = selectFormula;
                CrystalReportViewer1.RefreshReport();
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}