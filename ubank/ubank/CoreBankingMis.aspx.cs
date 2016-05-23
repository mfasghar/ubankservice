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
using System.Data.OracleClient;
using System.Web.UI.DataVisualization.Charting;
using System.Data.SqlClient;

namespace ubank
{
    public partial class CoreBankingMis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String ConnStr = "SERVER=" + ConfigurationManager.AppSettings["PIBASServer"] + ";USER ID=" + ConfigurationManager.AppSettings["PIBASUser"] + "; PWD =" + ConfigurationManager.AppSettings["PIBASpwd"];
            OracleConnection myConnection = new OracleConnection(ConnStr);

            String strQuery = @"SELECT MA38.FTD_TYPE, " +
                      " FTD_TYPE_DESC, " +
         "nvl(T_ACTIVE_NOC,0) as T_ACTIVE_NOC , " +
        " nvl( TOTAL_FACEVALUE,0) as TOTAL_FACEVALUE , " +
        " nvl( LAST_WORKDAY_NOAC,0) as LAST_WORKDAY_NOAC , " +
         " nvl(LAST_WORKDAY_FACEVALUE,0) as LAST_WORKDAY_FACEVALUE , " +
         " nvl(LAST_WORKDAY_MTRNOC,0) as LAST_WORKDAY_MTRNOC , " +
         " nvl(LAST_WORKDAY_FACEVALE,0) as LAST_WORKDAY_FACEVALE " +
    "    FROM PLS.MA38 " +
     "     LEFT OUTER JOIN " +
      "    (  SELECT FTD_TYPE, " +
       "             SUM (T_Active_NOC) T_ACTIVE_NOC, " +
        "            SUM (Total_FaceValue) TOTAL_FACEVALUE, " +
         "           SUM (Last_workday_NOAC) LAST_WORKDAY_NOAC, " +
          "          SUM (Last_workday_Facevalue) LAST_WORKDAY_FACEVALUE, " +
           "         SUM (Last_WorkDay_MtrNoc) LAST_WORKDAY_MTRNOC, " +
            "        SUM (Last_WorkDay_FaceVale) LAST_WORKDAY_FACEVALE, " +
             "       (  SELECT FTD_TYPE_DESC " +
              "           FROM PLS.MA38 B " +
               "         WHERE B.FTD_TYPE = XYZ.FTD_TYPE " +
                "     GROUP BY FTD_TYPE_DESC) " +
                 "      DESC1 " +
              " FROM (  SELECT FTD_TYPE, " +
               "               COUNT (*) T_ACTIVE_NOC, " +
                "              SUM (DEAL_AMNT) TOTAL_FACEVALUE, " +
                 "             0 LAST_WORKDAY_NOAC, " +
                  "            0 LAST_WORKDAY_FACEVALUE, " +
                   "           0 LAST_WORKDAY_MTRNOC, " +
                    "          0 LAST_WORKDAY_FACEVALE " +
                     "    FROM PLS.MH A " +
                      "  WHERE     FTD_TYPE IN (29, 30, 31) " +
                       "       AND STRT_DATE <= '31-jan-2016' " +
                        "      AND DEAL_RVSL_INDC <> 1 " +
                         "     AND DEAL_STAT = 0 " +
                      "GROUP BY FTD_TYPE " +
                    " UNION ALL " +
                     "  SELECT FTD_TYPE, " +
                      "        0 T_ACTIVE_NOC, " +
                       "       0 TOTAL_FACEVALUE, " +
                        "      COUNT (*) LAST_WORKDAY_NOAC, " +
                         "     SUM (DEAL_AMNT) LAST_WORKDAY_FACEVALUE, " +
                          "    0 LAST_WORKDAY_MTRNOC, " +
                           "   0 LAST_WORKDAY_FACEVALE " +
                         "FROM PLS.MH A " +
                        "WHERE     FTD_TYPE IN (29, 30, 31) " +
                         "     AND STRT_DATE = '31-jan-2016' " +
                          "    AND DEAL_RVSL_INDC <> 1 " +
                           "   AND DEAL_STAT = 0 " +
                    " GROUP BY FTD_TYPE " +
                     "UNION ALL " +
                      " SELECT FTD_TYPE, " +
                       "       0 T_ACTIVE_NOC, " +
                        "      0 TOTAL_FACEVALUE, " +
                         "     COUNT (*) LAST_WORKDAY_NOAC, " +
                          "    SUM (DEAL_AMNT) LAST_WORKDAY_FACEVALUE," +
                           "   COUNT (*) LAST_WORKDAY_MTRNOC," +
                            "  SUM (DEAL_AMNT) LAST_WORKDAY_FACEVALE" +
                        " FROM PLS.MH A" +
                       " WHERE     FTD_TYPE IN (29, 30, 31)" +
                        "      AND STRT_DATE = '31-jan-2016'" +
                         "     AND DEAL_STAT = 1" +
                          " GROUP BY FTD_TYPE) XYZ" +
           " GROUP BY FTD_TYPE) ABC" +
             " ON (MA38.FTD_TYPE = ABC.FTD_TYPE)" +
             " WHERE MA38.FTD_TYPE IN (31, 30, 29) and MA38.BRAN_CODE = 510" +
                         " ORDER BY MA38.FTD_TYPE"; 


            OracleDataAdapter adapter = new OracleDataAdapter(strQuery, ConnStr);
            DataSet Ds = new DataSet();
            SqlDataSource1.SelectCommand = strQuery;
            GridView1.DataSource = SqlDataSource1;
            SqlDataSource1.DataBind();
            GridView1.DataBind();


//current Products 
            string strquery1 = "select max (AccountName) as AccountName  , ACCT_TYPE ,max(ACCT_TYPE_DESC)as ACCT_TYPE_DESC , sum(counts) as counts , " +
                            "   sum(FaceValue) as FaceValue,  sum( Active_count) as Active_count , sum(Active_sum) as Active_sum " +
                             "   from (select 'Current Account'as AccountName , md.ACCT_TYPE as ACCT_TYPE ,ma.ACCT_TYPE_DESC as ACCT_TYPE_DESC, " +
                             "   count(md.ACCT_TYPE) as counts  , sum(md.LDGR_BALN) as FaceValue , 0 as Active_count , 0 as Active_sum " +
                             "   from pls.md md " +
                             "   left outer join pls.ma5 ma on md.ACCT_TYPE = ma.ACCT_TYPE and ma.BRAN_CODE = 510 " +
                             "   where md.ACCT_TYPE in (115,116,120) " +
                             "   group by md.ACCT_TYPE , ma.ACCT_TYPE_DESC " +
                             "   union  " +
                             "   select 'Current Account' as AccountName ,  ACCT_TYPE ,'A' as ACCT_TYPE_DESC , 0 as counts , " +
                             "   0 as FaceValue,  count(*) as Active_count , sum(LDGR_BALN) as Active_sum " +
                             "   from pls.md  where  md.ACCT_CLSD_DATE is  null  and md.ACCT_TYPE in (115,116,120) group by ACCT_TYPE " +
                             "   )xyz " +
                             "   group by ACCT_TYPE "; 
                            

            SqlDataSource2.SelectCommand = strquery1;
            GridView2.DataSource = SqlDataSource2;
            SqlDataSource2.DataBind();
            GridView2.DataBind();

// Saving Products

            string strquery2 = "select max (AccountName) as AccountName  , ACCT_TYPE ,max(ACCT_TYPE_DESC)as ACCT_TYPE_DESC , sum(counts) as counts , " +
                            "   sum(FaceValue) as FaceValue,  sum( Active_count) as Active_count , sum(Active_sum) as Active_sum " +
                             "   from (select 'Saving Account'as AccountName , md.ACCT_TYPE as ACCT_TYPE ,ma.ACCT_TYPE_DESC as ACCT_TYPE_DESC, " +
                             "   count(md.ACCT_TYPE) as counts  , sum(md.LDGR_BALN) as FaceValue , 0 as Active_count , 0 as Active_sum " +
                             "   from pls.md md " +
                             "   left outer join pls.ma5 ma on md.ACCT_TYPE = ma.ACCT_TYPE and ma.BRAN_CODE = 510 " +
                             "   where md.ACCT_TYPE in (136,137,139) " +
                             "   group by md.ACCT_TYPE , ma.ACCT_TYPE_DESC " +
                             "   union  " +
                             "   select 'Saving Account' as AccountName ,  ACCT_TYPE ,'A' as ACCT_TYPE_DESC , 0 as counts , " +
                             "   0 as FaceValue,  count(*) as Active_count , sum(LDGR_BALN) as Active_sum " +
                             "   from pls.md  where  md.ACCT_CLSD_DATE is  null  and md.ACCT_TYPE in (136,137,139) group by ACCT_TYPE " +
                             "   )xyz " +
                             "   group by ACCT_TYPE ";

            

            SqlDataSource3.SelectCommand = strquery2;
            GridView3.DataSource = SqlDataSource3;
            SqlDataSource3.DataBind();
            GridView3.DataBind();
            
//            SqlConnection OC= new SqlConnection(ConnStr);
//            if (OC.State == ConnectionState.Closed) { OC.Open(); }
            
//           SqlCommand ocOM = new SqlCommand(strQuery,OC );
//            SqlDataReader ORR = ocOM.ExecuteReader();

//            Chart1.DataBindTable(ORR, "FTD_TYPE_DESC");
         

//            //DataTable dt = (DataTable)SqlDataSource1;
//          //  Chart1.DataSource = SqlDataSource1;
//          //  Chart1.DataSourceID = "FTD_TYPE_DESC";
           
////Chart1.DataSource = SqlDataSource1;

//          //  Chart1.DataBindTable(dataSource: "SqlDataSource1", xField: "FTD_TYPE");
//            // Chart1.Write();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

       
    }
}