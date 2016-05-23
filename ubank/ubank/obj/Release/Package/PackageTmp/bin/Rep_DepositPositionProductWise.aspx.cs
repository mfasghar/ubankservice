using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;

namespace ubank
{
    public partial class Rep_DepositPositionProductWise1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Rep_DepositPositionProductWiserpt rd = new Rep_DepositPositionProductWiserpt();

            ConnectionInfo conne = new ConnectionInfo();


            conne.ServerName = ConfigurationManager.AppSettings["ServerName"].ToString();
            conne.DatabaseName = ConfigurationManager.AppSettings["DatabaseName"].ToString();
            conne.UserID = ConfigurationManager.AppSettings["UserID"].ToString();
            conne.Password = ConfigurationManager.AppSettings["Password"].ToString();


            TableLogOnInfo tablelogs = new TableLogOnInfo();

            Database db = rd.Database;
            Tables tbls = db.Tables;

            foreach (CrystalDecisions.CrystalReports.Engine.Table tab in tbls)
            {
                tablelogs = tab.LogOnInfo;
                tablelogs.ConnectionInfo = conne;
                tab.ApplyLogOnInfo(tablelogs);
                tab.Location = ConfigurationManager.AppSettings["DatabaseName"] + ".dbo." + tab.Name; //most important line whole report is depend on this line
            }

            CrystalReportViewer1.ReportSource = rd;
            CrystalReportViewer1.Zoom(Convert.ToInt16(ConfigurationManager.AppSettings["ReportZoom"]));
            CrystalReportViewer1.SelectionFormula = "{REP_BRANCH_BALANCES.ACCT_TYPE} in  [115, 116, 137, 136, 138] and {REP_BRANCH_BALANCES.TRANDATE} = cdate('" + txtAsOnDate.Text + "')";
            CrystalReportViewer1.RefreshReport();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}