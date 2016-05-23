using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ubank.Manager;
using System.Data;

namespace ubank
{
    public partial class glpostinginfo1 : System.Web.UI.Page
    {
        decimal sumFooterValueGrid1 = 0;
        decimal sumFooterValueGrid2 = 0;
        decimal CountFooterValueGrid1 = 0;
        decimal CountFooterValueGrid2 = 0;
        decimal DiffinSybaseAndPIBASAmount = 0;
        decimal DiffinSybaseAndPIBASCount = 0;
        decimal negativeAmount= 0;
        decimal positiveAmount= 0 ;
        decimal lblNeg1 = 0;
        decimal lblPPos1 = 0; 
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                txtFromDate.Text = DateTime.Today.ToString("dd-MMM-yyyy");
            } 
//            SqlDataSource1.ConnectionString = ubank.co
            string SQLQuery;
            string SQLQueryForPIBAS;
            //SQLQuery = "SELECT xvz.* , 'Posted' AS status ,NVL(tbl.PIBAS_GL_WITH_LOCATION,0) AS PibasGL FROM (SELECT GL_CODE_DESCRIPTION,ID_GL_CODE , MAX(ID_GL_HISTORY) RefrenceNO,SUM(AMOUNT) Amount FROM (SELECT gl.GL_CODE_DESCRIPTION,gl.ID_GL_CODE,glh.ID_GL_HISTORY ID_GL_HISTORY, CASE WHEN glh.DC_FLAG='D' THEN glh.AMOUNT*-1 ELSE glh.AMOUNT  END AMOUNT, glh.DC_FLAG FROM pbxhbl.GENERAL_LEDGER gl INNER JOIN pbxhbl.GL_HISTORY glh ON glh.GL_CODE=gl.ID_GL_CODE WHERE to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') >=      trunc(to_date('" + txtFromDate.Text + "')-1)||'04.00.00.00 AM' AND to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') < trunc(to_date('" + txtFromDate.Text + "'))||'04.00.00.00 AM' GROUP BY GL_CODE_DESCRIPTION, ID_GL_CODE, DC_FLAG ) xvz INNER JOIN cmsuser.TBLGLINFO tbl ON tbl.SYBASEGLACCOUNT=xvz.ID_GL_CODE WHERE xvz.REFRENCENO IN (SELECT substr(RETRIEVALREFERENCENUMBER,1,8) FROM pls.BBTRANSACTIONS@pibas WHERE To_date(TRANSACTIONDATE,'yyyy-mm-dd') = to_date('" + txtFromDate.Text + "') AND (FROMACCOUNTNUMBERFA='900091402010586' OR TOACCOUNTNUMBERTA='900091402010586')  ) UNION ALL SELECT xvz.* , 'Not Posted' AS status, NVL(tbl.PIBAS_GL_WITH_LOCATION,0) AS PibasGL FROM (SELECT GL_CODE_DESCRIPTION, ID_GL_CODE , MAX(ID_GL_HISTORY) RefrenceNO, SUM(AMOUNT) Amount FROM (SELECT gl.GL_CODE_DESCRIPTION, gl.ID_GL_CODE, glh.ID_GL_HISTORY ID_GL_HISTORY, CASE WHEN glh.DC_FLAG='D' THEN glh.AMOUNT*-1 ELSE glh.AMOUNT END AMOUNT, glh.DC_FLAG FROM pbxhbl.GENERAL_LEDGER gl INNER JOIN pbxhbl.GL_HISTORY glh ON glh.GL_CODE=gl.ID_GL_CODE WHERE to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') >= trunc(to_date('" + txtFromDate.Text + "')-1)||'04.00.00.00 AM' AND to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') < trunc(to_date('" + txtFromDate.Text + "'))||'04.00.00.00 AM') GROUP BY GL_CODE_DESCRIPTION, ID_GL_CODE, DC_FLAG ) xvz LEFT JOIN cmsuser.TBLGLINFO tbl ON tbl.SYBASEGLACCOUNT=xvz.ID_GL_CODE WHERE xvz.REFRENCENO NOT IN (SELECT substr(RETRIEVALREFERENCENUMBER,1,8) FROM pls.BBTRANSACTIONS@pibas WHERE To_date(TRANSACTIONDATE,'yyyy-mm-dd') = to_date('" + txtFromDate.Text + "') AND (FROMACCOUNTNUMBERFA='900091402010586' OR TOACCOUNTNUMBERTA='900091402010586'))"; 

            SQLQuery = @"SELECT 
    xvz.* , 
    'Posted' AS status ,  
    NVL(tbl.PIBAS_GL_WITH_LOCATION,0) AS PibasGL  
    FROM 
    (	SELECT 
    		GL_CODE_DESCRIPTION, 
    		ID_GL_CODE , 
    		MAX(ID_GL_HISTORY) RefrenceNO, 
    		SUM(AMOUNT) Amount  
    	FROM 
    		(	SELECT 
    				gl.GL_CODE_DESCRIPTION, 
    				gl.ID_GL_CODE, 
    				glh.ID_GL_HISTORY ID_GL_HISTORY, 
    					CASE  
    						WHEN glh.DC_FLAG='D'  
    						THEN glh.AMOUNT*-1  
    						ELSE glh.AMOUNT  
    					END AMOUNT, 
    					glh.DC_FLAG  
    			FROM 
    				pbxhbl.GENERAL_LEDGER gl  
    				INNER JOIN pbxhbl.GL_HISTORY glh  
    					ON glh.GL_CODE=gl.ID_GL_CODE  
    				WHERE 
    					to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') >=  
    					trunc(to_date('"+ txtFromDate.Text+@"')-1)||'04.00.00.00 AM' AND 
    					to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') <  
    					trunc(to_date('"+ txtFromDate.Text+@"'))||'04.00.00.00 AM' 
    			) 
    		GROUP BY 
    			GL_CODE_DESCRIPTION, 
    			ID_GL_CODE, 
    			DC_FLAG 
    	) 
    	xvz  
    		INNER JOIN cmsuser.TBLGLINFO tbl  
    		ON tbl.SYBASEGLACCOUNT=xvz.ID_GL_CODE 
     WHERE 
    	xvz.REFRENCENO IN (	SELECT 
    							substr(RETRIEVALREFERENCENUMBER,1,8)  
    						FROM 
    							pls.BBTRANSACTIONS@pibas  
    						WHERE 
    							To_date(TRANSACTIONDATE,'yyyy-mm-dd') =  
    							to_date('"+ txtFromDate.Text+@"') AND 
    							(FROMACCOUNTNUMBERFA='900091402010586' OR 
    							TOACCOUNTNUMBERTA='900091402010586') 
    	) 
     UNION 
    	ALL  
     SELECT 
    	xvz.* , 
    	'Not Posted'                     AS status, 
    	NVL(tbl.PIBAS_GL_WITH_LOCATION,0) AS PibasGL  
     FROM 
    	(	SELECT 
    			GL_CODE_DESCRIPTION, 
    			ID_GL_CODE , 
    			MAX(ID_GL_HISTORY) RefrenceNO, 
    			SUM(AMOUNT) Amount  
    		FROM 
    			(	SELECT 
    					gl.GL_CODE_DESCRIPTION, 
    					gl.ID_GL_CODE, 
    					glh.ID_GL_HISTORY ID_GL_HISTORY, 
    					CASE  
    						WHEN glh.DC_FLAG='D'  
    						THEN glh.AMOUNT*-1  
    						ELSE glh.AMOUNT  
    					END AMOUNT, 
    					glh.DC_FLAG  
    				FROM 
    					pbxhbl.GENERAL_LEDGER gl  
    					INNER JOIN pbxhbl.GL_HISTORY glh  
    					ON glh.GL_CODE=gl.ID_GL_CODE  
    				WHERE 
    					to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') >=  
    					trunc(to_date('"+ txtFromDate.Text+@"')-1)||'04.00.00.00 AM' AND 
    					to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') <  
    					trunc(to_date('"+ txtFromDate.Text+@"'))||'04.00.00.00 AM' 
    			) 
    		GROUP BY 
    			GL_CODE_DESCRIPTION, 
    			ID_GL_CODE, 
    			DC_FLAG 
    	) 
    	xvz  
    		LEFT JOIN cmsuser.TBLGLINFO tbl  
    		ON tbl.SYBASEGLACCOUNT=xvz.ID_GL_CODE  
     WHERE 
    	xvz.REFRENCENO NOT IN (	SELECT 
    								substr(RETRIEVALREFERENCENUMBER,1,8)  
    							FROM 
    								pls.BBTRANSACTIONS@pibas  
    							WHERE 
    								To_date(TRANSACTIONDATE,'yyyy-mm-dd') =  
    								to_date('"+ txtFromDate.Text+@"') AND 
    								(FROMACCOUNTNUMBERFA='900091402010586' OR 
    								TOACCOUNTNUMBERTA='900091402010586'))
";


            DataTable dt = Connections.GetFromDB(SQLQuery);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            
            SQLQueryForPIBAS = "select asx. * from (     SELECT     CASE       WHEN FROMACCOUNTNUMBERFA='900091402010586'      THEN TRANSACTIONAMOUNT       WHEN TOACCOUNTNUMBERTA='900091402010586'       THEN '-'||TRANSACTIONAMOUNT      END Amount,     CASE       WHEN FROMACCOUNTNUMBERFA='900091402010586'       THEN TOACCOUNTNUMBERTA       WHEN TOACCOUNTNUMBERTA='900091402010586'       THEN FROMACCOUNTNUMBERFA      END Pibasaccount      FROM     pls.BBTRANSACTIONS@pibas      WHERE     To_date(TRANSACTIONDATE,'yyyy-mm-dd')  = '" + txtFromDate.Text + "' AND     (FROMACCOUNTNUMBERFA='900091402010586' OR     TOACCOUNTNUMBERTA='900091402010586')     ) asx ";
            //SQLQueryForPIBAS = @"select asx. * from (     SELECT     CASE       WHEN FROMACCOUNTNUMBERFA='900091402010586'      THEN TRANSACTIONAMOUNT       WHEN TOACCOUNTNUMBERTA='900091402010586'       THEN '-'||TRANSACTIONAMOUNT      END Amount,     CASE       WHEN FROMACCOUNTNUMBERFA='900091402010586'       THEN TOACCOUNTNUMBERTA       WHEN TOACCOUNTNUMBERTA='900091402010586'       THEN FROMACCOUNTNUMBERFA      END Pibasaccount      FROM     pls.BBTRANSACTIONS      WHERE     TRANSACTIONDATE  = '" + Convert.ToDateTime(txtFromDate.Text).ToString("yyyyMMdd") + "' AND     (FROMACCOUNTNUMBERFA='900091402010586' OR     TOACCOUNTNUMBERTA='900091402010586')     ) asx ";

//            SQLQueryForPIBAS = @"SELECT ASX.*
//  FROM (SELECT CASE
//                  WHEN FROMACCOUNTNUMBERFA = '900091402010586'
//                  THEN
//                     TRANSACTIONAMOUNT
//                  WHEN TOACCOUNTNUMBERTA = '900091402010586'
//                  THEN
//                     '-' || TRANSACTIONAMOUNT
//               END
//                  AMOUNT,
//               CASE
//                  WHEN FROMACCOUNTNUMBERFA = '900091402010586'
//                  THEN
//                     TOACCOUNTNUMBERTA
//                  WHEN TOACCOUNTNUMBERTA = '900091402010586'
//                  THEN
//                     FROMACCOUNTNUMBERFA
//               END
//                  PIBASACCOUNT
//          FROM PLS.BBTRANSACTIONS
//         WHERE        TRANSACTIONDATE = '" + Convert.ToDateTime(txtFromDate.Text).ToString("yyyyMMdd") + @"'
//                  AND FROMACCOUNTNUMBERFA = '900091402010586'
//               OR TOACCOUNTNUMBERTA = '900091402010586') ASX" ;

//            SqlDataSource2.SelectCommand = SQLQueryForPIBAS;
//            SqlDataSource2.DataBind();
//            GridView2.DataBind();

            DataTable dt1 = Connections.GetFromDB(SQLQueryForPIBAS);
            GridView2.DataSource = dt1;
            GridView2.DataBind();
             

            if ((sumFooterValueGrid1 - sumFooterValueGrid2) != 0)
            {
                lblDiffInfo.ForeColor = System.Drawing.Color.Red;
                lblDiffInfo.Text = "There is some difference in Sybase GL entrines and PIBAS GL entries";

            }
            else
            {
                if (GridView2.Rows.Count <= 0)
                {
                    lblDiffInfo.ForeColor = System.Drawing.Color.Red;
                    lblDiffInfo.Text = "There is some difference in Sybase GL entrines and PIBAS GL entries";

                }
                else
                {
                    lblDiffInfo.ForeColor = System.Drawing.Color.Green;
                    lblDiffInfo.Text = "Successfully posted GL entries from Sybase to PIBAS....";
                }
            }


          
        }  


        protected void LinkButton1_Click(object sender, EventArgs e)
        {
           
        }


        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                string TransAmount = ((Label)e.Row.FindControl("Label4")).Text;
                decimal totalvalue = Convert.ToDecimal(TransAmount);
                
                    sumFooterValueGrid1 += totalvalue;
                    CountFooterValueGrid1 += 1;
                if (Convert.ToDecimal(TransAmount) < 0) 
                {
                    lblNeg1 += Convert.ToDecimal(TransAmount);
                } else 
                {
                
                }
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lbl = (Label)e.Row.FindControl("lblDiff");
                Label lblNeg11 =  (Label)e.Row.FindControl("lblNeg1");

                if (sumFooterValueGrid1 == 0)
                {
                    lbl.Text = "There is no Difference  " + sumFooterValueGrid1.ToString();
                }
                else lbl.Text = "Difference is " + sumFooterValueGrid1.ToString();

                Label lbl1 = (Label)e.Row.FindControl("lblCount");
                lbl1.Text = "Total Transactions are " + CountFooterValueGrid1.ToString();
                lblNeg11.Text = "Dr. =" + Convert.ToString(lblNeg1);
                
            }
        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                string TransAmount = ((Label)e.Row.FindControl("Label2")).Text;
                decimal totalvalue = Convert.ToDecimal(TransAmount);
                if (Convert.ToDecimal(TransAmount) < 0) {
                    negativeAmount +=Convert.ToDecimal(TransAmount);
                } else 
                    {
                    positiveAmount +=Convert.ToDecimal(TransAmount);
                    }
                sumFooterValueGrid2 += totalvalue;
                CountFooterValueGrid2 += 1;

            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lbl = (Label)e.Row.FindControl("lblDiffAmount");
                Label lblNeg = (Label)e.Row.FindControl("lblNeg");
                //Label lblNeg = (Label)e.Row.FindControl("lblNeg");

                if (sumFooterValueGrid2 == 0)
                {
                    lbl.Text = "There is no Difference  " + sumFooterValueGrid2.ToString();
                }
                else lbl.Text = "Difference is " + sumFooterValueGrid2.ToString();
                lblNeg.Text ="Dr. =" + Convert.ToString( negativeAmount);
                Label lbl1 = (Label)e.Row.FindControl("lblCount2");
                lbl1.Text = "Total Transactions are " + CountFooterValueGrid1.ToString();


            }
        }
    }
}