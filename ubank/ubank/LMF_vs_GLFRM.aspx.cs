using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.IO;
using System.Data;


namespace ubank
{
    public partial class LMF_vs_GLFRM : System.Web.UI.Page
    {
        LMF_vs_GLRPT rd = new LMF_vs_GLRPT();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                txtDateFrom.Text = DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy");
               // txtDateTo.Text = DateTime.Now.AddDays(-1).ToString("dd-MMM-yyyy"); //DateTime.Now.ToString("dd-MMM-yyyy");
                // CrystalReportViewer1.Zoom(Convert.ToInt16(ConfigurationManager.AppSettings["ReportZoom"]));

            }

            String ConnStr = "SERVER=" + ConfigurationManager.AppSettings["PIBASServer"] + ";USER ID=" + ConfigurationManager.AppSettings["PIBASUser"] + "; PWD =" + ConfigurationManager.AppSettings["PIBASpwd"];

            OracleConnection myConnection = new OracleConnection(ConnStr);

            String Query1 = @"/* Formatted on 15/12/2015 10:35:35 AM (QP5 v5.227.12220.39754) */ " + 
"  SELECT '" + txtDateFrom.Text + "' as DAT_CREAT,  T.BRANCH_CODE, " +
"         BN.BRANCHNAME AS Branch_Name, " +
"         LOAN_PRODUCT, " +
"         LOANPROD_NAME AS PRODUCT_NAME, " +
"         LOANPROD_GLBALANCE AS LOAN_GL_BALANCE, " +
"         LOANPROD_BALANCE AS LOAN_ACC_BALANCE, " +
"         LOANPROD_MODULE_BALANCE " +
"            AS LOAN_Module_BALANCE, " +
"         LOANPROD_GLBALANCE - LOANPROD_BALANCE " +
"            AS GL_vs_Acc, " +
"         LOANPROD_BALANCE - LOANPROD_MODULE_BALANCE " +
"            AS Ac_vs_Loan, " +
"         NOOF_LOAN_ACCOUNT - NOOF_LOANS AS Noof_Acc_vs_Loans " +
"    FROM SYSTEM.T_LOANBALANCERECON T " +
"         LEFT OUTER JOIN AML.SAMLBRANCHES BN " +
"            ON T.BRANCH_CODE = SUBSTR ('000' || BN.BRANCHCODE, -4, 4) " +
"   WHERE DAT_CREAT = '13-Dec-2015' " +
"--and (LOANPROD_GLBALANCE - LOANPROD_BALANCE <>0 or  LOANPROD_BALANCE - LOANPROD_MODULE_BALANCE <>0 or NOOF_LOAN_ACCOUNT - NOOF_LOANS <> 0) " +
"ORDER BY 1, 2";

            OracleDataAdapter adapter = new OracleDataAdapter(Query1, ConnStr);
            DataSet Ds = new DataSet();
            adapter.Fill(Ds, "DataTable1");
            rd.SetDataSource(Ds);
            rd.SetDatabaseLogon(ConfigurationManager.AppSettings["UserID"], ConfigurationManager.AppSettings["Password"]);
            CrystalReportViewer1.ReportSource = rd;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}