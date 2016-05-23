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
    public partial class repPOvsGLFRM : System.Web.UI.Page
    {
        repPOvsGLRPT rd = new repPOvsGLRPT();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (IsPostBack == false)
            //{
            //    txtDateFrom.Text = DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy");
            //    txtDateTo.Text = DateTime.Now.AddDays(-1).ToString("dd-MMM-yyyy"); //DateTime.Now.ToString("dd-MMM-yyyy");
            //    // CrystalReportViewer1.Zoom(Convert.ToInt16(ConfigurationManager.AppSettings["ReportZoom"]));

            //}

            String ConnStr = "SERVER=" + ConfigurationManager.AppSettings["PIBASServer"] + ";USER ID=" + ConfigurationManager.AppSettings["PIBASUser"] + "; PWD =" + ConfigurationManager.AppSettings["PIBASpwd"];

            OracleConnection myConnection = new OracleConnection(ConnStr);

//            String Query1 = @"SELECT   SUBSTR ('000' || BRAN_CODE, -4, 4) AS BRAN_CODE,(select bran.NME  from lmf.LMFBRANCHES bran where to_number( bran.BRANCH_CODE) = to_number( SUBSTR ('000' || BRAN_CODE, -4, 4)) and rownum < 2 ) naME, " +
//"            SUBSTR ('000' || R.PYNG_ACCT_BRAN, -4) " +
//"         || R.PYNG_ACCT_BASC " +
//"         || '0' " +
//"         || R.PYNG_ACCT_SFIX " +
//"            PO_GL, " +
//"         ACCOUNTNAME AS GL_DESC, " +
//"         COUNT (*) PO_COUNT, " +
//"         SUM (DRFT_AMNT) PO_BALANCE, " +
//"         TO_NUMBER (MAX (AVAILABLEBALANCE)) GL_BALANCE, " +
//"         TO_NUMBER (MAX (AVAILABLEBALANCE)) - SUM (DRFT_AMNT) AS PO_GL_DIFF " +
//"    FROM PLS.MR R " +
//"         INNER JOIN pls.ACCOUNTBALANCES P " +
//"            ON    SUBSTR ('000' || R.PYNG_ACCT_BRAN, -4) " +
//"               || R.PYNG_ACCT_BASC " +
//"               || '0' " +
//"               || R.PYNG_ACCT_SFIX = P.ACCOUNTNUMBER " +
//"   WHERE ENCASHMENT_FLAG = 0 AND DRFT_AMNT <> 0 AND DOCM_STAT = 1 " +
//"GROUP BY BRAN_CODE, " +
//"            SUBSTR ('000' || R.PYNG_ACCT_BRAN, -4) " +
//"         || R.PYNG_ACCT_BASC " +
//"         || '0' " +
//"         || R.PYNG_ACCT_SFIX, " +
//"         ACCOUNTNAME " +
//"ORDER BY 1 ";

            String Query1 = @"SELECT SUBSTR ('000' || BRAN_CODE, -4, 4) AS BRAN_CODE, " +
"         BN.BRANCHNAME AS naME, " +
"            SUBSTR ('000' || R.PYNG_ACCT_BRAN, -4) " +
"         || R.PYNG_ACCT_BASC " +
"         || '0' " +
"         || R.PYNG_ACCT_SFIX " +
"            PO_GL, " +
"         ACCOUNTNAME AS GL_DESC, " +
"         COUNT (*) PO_COUNT, " +
"         SUM (DRFT_AMNT) PO_BALANCE, " +
"         MAX (AVAILABLEBALANCE) GL_BALANCE, " +
"         (MAX (AVAILABLEBALANCE) - SUM (DRFT_AMNT)) " +
"            AS PO_GL_DIFF " +
"    FROM PLS.MR R " +
"         INNER JOIN pls.ACCOUNTBALANCES P " +
"            ON    SUBSTR ('000' || R.PYNG_ACCT_BRAN, -4) " +
"               || R.PYNG_ACCT_BASC " +
"               || '0' " +
"               || R.PYNG_ACCT_SFIX = P.ACCOUNTNUMBER " +
"         LEFT OUTER JOIN AML.SAMLBRANCHES BN " +
"            ON R.BRAN_CODE = SUBSTR ('000' || BN.BRANCHCODE, -4, 4) " +
"   WHERE ENCASHMENT_FLAG = 0 AND DRFT_AMNT <> 0 AND DOCM_STAT IN (1, 4, 6) " +
"GROUP BY BRAN_CODE, " +
"         BN.BRANCHNAME, " +
"            SUBSTR ('000' || R.PYNG_ACCT_BRAN, -4) " +
"         || R.PYNG_ACCT_BASC " +
"         || '0' " +
"         || R.PYNG_ACCT_SFIX, " +
"         ACCOUNTNAME " +
"ORDER BY 1";

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