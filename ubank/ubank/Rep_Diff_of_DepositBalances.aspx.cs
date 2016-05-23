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
    public partial class Rep_Diff_of_DepositBalances : System.Web.UI.Page
    {
        RptDepositposition rd = new RptDepositposition();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack == false)
            {
                txtDateFrom.Text = DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy");
                txtDateTo.Text = DateTime.Now.AddDays(-1).ToString("dd-MMM-yyyy"); //DateTime.Now.ToString("dd-MMM-yyyy");
               // CrystalReportViewer1.Zoom(Convert.ToInt16(ConfigurationManager.AppSettings["ReportZoom"]));

            }

            String ConnStr = "SERVER=pibas;USER ID=system;PWD=cbcboraclesystem";

            OracleConnection myConnection = new OracleConnection(ConnStr);

            String Query1 = @"SELECT PROD_TYPE, " +
"         DAT_START, " +
"         DAT_END, " +
"         SUM (STARTBAL) STARTBAL, " +
"         SUM (CLOSEBAL) CLOSEBAL, " +
"         SUM (TOTAL_CR) TOTAL_In, " +
"         SUM (TOTAL_DR) TOTAL_Out, " +
"         SUM (NET_DRCR) NET_InOut " +
"    FROM (  SELECT S.BRANCH, " +
"                   S.ACCOUNTNUMBER, " +
"                   S.ACCOUNTNAME, " +
"                   A.AType_CODE, " +
"                   A.AT_CAT_DESC PROD_TYPE, " +
"                   TO_CHAR (MAX (S.DAT_CREAT), 'DD-MON-YYYY') DAT_START, " +
"                   TO_CHAR (MAX (E.DAT_CREAT), 'DD-MON-YYYY') DAT_END, " +
"                   MAX (S.OPENINGBALANCE) STARTBAL, " +
"                   MAX (E.OPENINGBALANCE) CLOSEBAL, " +
"                   MAX (E.OPENINGBALANCE) - MAX (S.OPENINGBALANCE) InOut_Flow, " +
"                   TO_CHAR (NVL (MAX (D.TRAN_DATE), '01-JAN-1900'),'DD-MON-YYYY') as DAT_TRAN, " +
"                   NVL(SUM (CASE WHEN Tran_Code > 500 THEN Tran_Amnt ELSE 0 END),0) AS Total_CR, " +
"                   NVL(SUM (CASE WHEN Tran_Code > 500 THEN 0 ELSE -Tran_Amnt END),0) AS Total_DR, " +
"                   NVL (SUM (CASE WHEN Tran_Code > 500 THEN Tran_Amnt ELSE -Tran_Amnt END),0) AS NET_DRCR " +
"              FROM SYSTEM.T_ACCOUNTBALANCES S " +
"                   INNER JOIN SYSTEM.T_ACCOUNTBALANCES E " +
"                      ON S.ACCOUNTNUMBER = E.ACCOUNTNUMBER " +
"                   INNER JOIN " +
"                   SYSTEM.t_AccType A " +
"                      ON     A.ATYPE_GL = SUBSTR (S.ACCOUNTNUMBER, 5, 7)  " +
"                         AND A.AT_CAT_CODE IN (1, 2, 3) " +
"                   LEFT OUTER JOIN " +
"                   PLS.mg D " +
"                      ON     TO_CHAR (SUBSTR ('000' || D.BRAN_CODE, -4, 4) || SUBSTR ('0000000' || D.ACCT_BASC, -7, 7) " +
"                                || SUBSTR ('000' || D.ACCT_SFIX, -4, 4)) = " +
"                                S.ACCOUNTNUMBER " +
"                         AND D.TRAN_DATE > '" + txtDateFrom.Text + "' " +
"                         AND D.TRAN_DATE <= '" + txtDateTo.Text + "' " +
"             WHERE S.DAT_CREAT = '" + txtDateFrom.Text + "' AND E.DAT_CREAT = '" + txtDateTo.Text + "' " +
"          GROUP BY S.BRANCH, " +
"                   S.ACCOUNTNUMBER, " +
"                   S.ACCOUNTNAME, " +
"                   A.AType_CODE, " +
"                   AT_CAT_DESC, " +
"                      SUBSTR ('000' || D.BRAN_CODE, -4, 4) " +
"                   || SUBSTR ('0000000' || D.ACCT_BASC, -7, 7) " +
"                   || SUBSTR ('000' || D.ACCT_SFIX, -4, 4)) " +
"GROUP BY PROD_TYPE, DAT_START, DAT_END " +
"ORDER BY PROD_TYPE, DAT_START " ;




            OracleDataAdapter adapter = new OracleDataAdapter(Query1, ConnStr);

            DataSet Ds = new DataSet();

            adapter.Fill(Ds, "DataTable1");

           
            rd.SetDataSource(Ds);
                       
            rd.SetDatabaseLogon("system", "cbcboraclesystem");

            rd.Refresh();

            CrystalReportViewer1.ReportSource = rd;
                        
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }
    }
}