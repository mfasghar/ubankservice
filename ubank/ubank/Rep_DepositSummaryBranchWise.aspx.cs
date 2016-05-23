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
    public partial class Rep_DepositSummaryBranchWise : System.Web.UI.Page
    {
        Rep_DepositSummaryBranchWiserpt rd = new Rep_DepositSummaryBranchWiserpt();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack == false)
            {
                txtDateFrom.Text = DateTime.Now.AddDays(-2).ToString("dd-MMM-yyyy");
                txtDateTo.Text = DateTime.Now.AddDays(-1).ToString("dd-MMM-yyyy"); //DateTime.Now.ToString("dd-MMM-yyyy");
                // CrystalReportViewer1.Zoom(Convert.ToInt16(ConfigurationManager.AppSettings["ReportZoom"]));

            }

            String ConnStr = "SERVER=" + ConfigurationManager.AppSettings["PIBASServer"] + ";USER ID=" + ConfigurationManager.AppSettings["PIBASUser"] + "; PWD =" +  ConfigurationManager.AppSettings["PIBASpwd"] ;

            OracleConnection myConnection = new OracleConnection(ConnStr);

            String Query1 = @"Select S.BRANCH, BN.BRANCHNAME, S.ACCOUNTNUMBER, S.ACCOUNTNAME, A.AType_CODE, A.AT_CAT_DESC PROD_TYPE, " +
                            "Max(S.DAT_CREAT) DAT_START,  " +
                            "Max(E.DAT_CREAT) DAT_END, " +
                            "nvl(to_Number(Max(S.OPENINGBALANCE)),0) STARTBAL, " +
                            "nvl(To_Number(Max(E.OPENINGBALANCE)),0) CLOSEBAL, " +
                            " " +
                            "to_char(nvl(Max(D.TRAN_DATE),'01-JAN-1900'),'DD-MON-YYYY')  DAT_TRAN, " +
                            "nvl(Sum(Case when Tran_Code > 500 then Tran_Amnt Else 0 end),0) as Total_CR , " +
                            "nvl(Sum(Case when Tran_Code > 500 then 0 Else - Tran_Amnt end),0) as Total_DR , " +
                            "nvl(Sum(Case when Tran_Code > 500 then Tran_Amnt Else - Tran_Amnt end),0) as NET_DRCR " +
                            "From system.T_ACCOUNTBALANCES S  " +
                            "Inner Join system.T_ACCOUNTBALANCES E on S.ACCOUNTNUMBER=E.ACCOUNTNUMBER " +
                            "Left outer Join AML.SAMLBRANCHES BN on S.BRANCH=substr('000'||BN.BRANCHCODE,-4,4)  " +
                            "Inner Join System.t_AccType A on A.ATYPE_GL = SUBSTR (S.ACCOUNTNUMBER, 5, 7) and A.AT_CAT_CODE in (1,2,3) " +
                            "Left outer join PLS.mg D on to_char(substr('000'||D.BRAN_CODE,-4,4)||substr('0000000'||D.ACCT_BASC,-7,7)||substr('000'||D.ACCT_SFIX,-4,4) )=S.ACCOUNTNUMBER  " +
                            "and D.TRAN_DATE > '" + txtDateFrom.Text + "' and D.TRAN_DATE <= '" + txtDateTo.Text + "' " +
                            "Where S.DAT_CREAT ='" + txtDateFrom.Text + "' and E.DAT_CREAT ='" + txtDateTo.Text + "'  " +
                            "Group by S.BRANCH, BN.BRANCHNAME,S.ACCOUNTNUMBER, S.ACCOUNTNAME, A.AType_CODE,AT_CAT_DESC, " +
                            "D.TRAN_DATE, substr('000'||D.BRAN_CODE,-4,4)||substr('0000000'||D.ACCT_BASC,-7,7)||substr('000'||D.ACCT_SFIX,-4,4) " +
                            "Order by S.BRANCH, AT_CAT_DESC,S.ACCOUNTNUMBER,D.TRAN_DATE";

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

        protected void CrystalReportViewer1_Init(object sender, EventArgs e)
        {

        }
    }
}