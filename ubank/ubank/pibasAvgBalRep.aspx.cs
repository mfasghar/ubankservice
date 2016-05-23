using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;

namespace ubank
{
    public partial class pibasAvgBalRep : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
 if (IsPostBack)
     
 {
            ReportDocument cryRpt = new ReportDocument();
            TableLogOnInfos crtableLogoninfos = new TableLogOnInfos();
            TableLogOnInfo crtableLogoninfo = new TableLogOnInfo();
            ConnectionInfo crConnectionInfo = new ConnectionInfo();
            Tables CrTables ;

            cryRpt.Load(Server.MapPath("pibasAvgBalRpt.rpt"));

            //crConnectionInfo.ServerName = "SKM"; //"PIBASUAT75";
            //crConnectionInfo.DatabaseName = "SKM"; //"PIBASUAT75";
            //crConnectionInfo.UserID = "system";
            //crConnectionInfo.Password = "oracle";

            crConnectionInfo.LogonProperties.Clear();


            crConnectionInfo.LogonProperties.Add(new NameValuePair2("Connection String", "Data Source=SKM;User ID=system;password=oracle;Unicode=True"));
            crConnectionInfo.LogonProperties.Add(new NameValuePair2("UseDSNProperties", false));

            CrTables = cryRpt.Database.Tables ;
            foreach (CrystalDecisions.CrystalReports.Engine.Table CrTable in CrTables)
            {
                crtableLogoninfo = CrTable.LogOnInfo;
                crtableLogoninfo.ConnectionInfo = crConnectionInfo;
                CrTable.ApplyLogOnInfo(crtableLogoninfo);
            }

            
            CrystalReportViewer1.DataBind();
            CrystalReportViewer1.SelectionFormula = " {MKR1.STAT_YYMM} >= " + txtDateFrom.Text  + "    AND {MKR1.DRCR_FLAG }= 'CR' AND ({MKR1.ACCT_TYPE} IN [" + txtAccTypeList.Text + "])";
            CrystalReportViewer1.Visible = true;
               
 }

       

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

        }

        protected void CrystalReportViewer1_Init(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {

        }
    }
}