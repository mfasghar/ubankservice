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
    
    public partial class RepDepositSummaryBranchAcctWise : System.Web.UI.Page
    {
        RepDepositSummaryBranchAcctWiserpt rd = new RepDepositSummaryBranchAcctWiserpt();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack == false)
            {
                txtDateFrom.Text = DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy");
                txtDateTo.Text = DateTime.Now.AddDays(-1).ToString("dd-MMM-yyyy"); //DateTime.Now.ToString("dd-MMM-yyyy");
                // CrystalReportViewer1.Zoom(Convert.ToInt16(ConfigurationManager.AppSettings["ReportZoom"]));

            }

            String ConnStr = "SERVER=" + ConfigurationManager.AppSettings["PIBASServer"] + ";USER ID=" + ConfigurationManager.AppSettings["PIBASUser"] + "; PWD =" + ConfigurationManager.AppSettings["PIBASpwd"];

            OracleConnection myConnection = new OracleConnection(ConnStr);

            String Query1 = @"Select PROD_TYPE, DAT_START, DAT_END, AType_DESC, Sum(STARTBAL) STARTBAL, Sum(CLOSEBAL) CLOSEBAL, " +
"Sum(TOTAL_CR) TOTAL_In , Sum(TOTAL_DR) TOTAL_Out, " +
"Sum(NET_DRCR) NET_InOut  " +
"from ( " +
"Select S.BRANCH, S.ACCOUNTNUMBER, S.ACCOUNTNAME, A.AType_DESC, A.AT_CAT_DESC PROD_TYPE, " +
"to_char(Max(S.DAT_CREAT),'DD-MON-YYYY') DAT_START,  " +
"to_char(Max(E.DAT_CREAT),'DD-MON-YYYY') DAT_END, " +
"Max(S.OPENINGBALANCE) STARTBAL, " +
"Max(E.OPENINGBALANCE) CLOSEBAL, " +
"Max(E.OPENINGBALANCE) - Max(S.OPENINGBALANCE) InOut_Flow , " +
"to_char(nvl(Max(D.TRAN_DATE),'01-JAN-1900'),'DD-MON-YYYY')  DAT_TRAN, " +
"nvl(Sum(Case when Tran_Code > 500 then Tran_Amnt Else 0 end),0) as Total_CR , " +
"nvl(Sum(Case when Tran_Code > 500 then 0 Else - Tran_Amnt end),0) as Total_DR , " +
"nvl(Sum(Case when Tran_Code > 500 then Tran_Amnt Else - Tran_Amnt end),0) as NET_DRCR " +
"From system.T_ACCOUNTBALANCES S  " +
"Inner Join system.T_ACCOUNTBALANCES E on S.ACCOUNTNUMBER=E.ACCOUNTNUMBER " +
"Inner Join System.t_AccType A on A.ATYPE_GL = SUBSTR (S.ACCOUNTNUMBER, 5, 7) and A.AT_CAT_CODE in (1,2,3) " +
"Left outer join PLS.mg D on to_char(substr('000'||D.BRAN_CODE,-4,4)||substr('0000000'||D.ACCT_BASC,-7,7)||substr('000'||D.ACCT_SFIX,-4,4) )=S.ACCOUNTNUMBER  " +
"and D.TRAN_DATE > '" + txtDateFrom.Text  +"' and D.TRAN_DATE <= '"  + txtDateTo.Text + "' " +
"Where S.DAT_CREAT ='" + txtDateFrom.Text + "' and E.DAT_CREAT ='" + txtDateTo.Text + "'  " +
"Group by S.BRANCH, S.ACCOUNTNUMBER, S.ACCOUNTNAME, A.AType_DESC,AT_CAT_DESC, " +
"substr('000'||D.BRAN_CODE,-4,4)||substr('0000000'||D.ACCT_BASC,-7,7)||substr('000'||D.ACCT_SFIX,-4,4) " +
") Group by PROD_TYPE, DAT_START, DAT_END, AType_DESC  Order by PROD_TYPE, DAT_START";

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