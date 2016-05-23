using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


namespace ubank
{
    public partial class glpostinginfo : System.Web.UI.Page
    {
        decimal sumFooterValueDr = 0;
        decimal sumFooterValueCr = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

           // ExportExcel.ExportExcelFile("TransactionDetail", dt);
            GridView1.FooterRow.Visible = true;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           //SELECT * FROM ( SELECT PLS.BBTRANSACTIONS.TOACCOUNTNUMBERTA PibasAccount, SUM(PLS.BBTRANSACTIONS.TRANSACTIONAMOUNT) Amount FROM PLS.BBTRANSACTIONS@pibas WHERE NARRATION LIKE 'Sybase%' AND To_date(TRANSACTIONDATE,'yyyy-mm-dd')  = '19-Jan-2015' GROUP BY PLS.BBTRANSACTIONS.TOACCOUNTNUMBERTA ) asx ,( SELECT GL_CODE_DESCRIPTION,ID_GL_CODE,MAX(ID_GL_HISTORY) RefrenceNO, SUM(AMOUNT) Amount FROM (SELECT gl.GL_CODE_DESCRIPTION,gl.ID_GL_CODE,glh.ID_GL_HISTORY ID_GL_HISTORY, CASE WHEN glh.DC_FLAG='D' THEN glh.AMOUNT*-1 ELSE glh.AMOUNT END AMOUNT,glh.DC_FLAG FROM pbxhbl.GENERAL_LEDGER gl INNER JOIN pbxhbl.GL_HISTORY glh ON glh.GL_CODE=gl.ID_GL_CODE WHERE to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') >= trunc(to_date(@DateParam)-1)||'04.00.00.00 AM' AND to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') < trunc(to_date(@DateParam))||'04.00.00.00 AM' AND glh.DC_FLAG='C' ) GROUP BY GL_CODE_DESCRIPTION,ID_GL_CODE,DC_FLAG ) asx2, cmsuser.TBLGLINFO gl WHERE asx2.ID_GL_CODE = gl.SYBASEGLACCOUNT AND asx.PibasAccount = gl.PIBAS_GL_WITH_LOCATION
            //SqlDataSource3.SelectCommand = @"SELECT * FROM ( SELECT PLS.BBTRANSACTIONS.TOACCOUNTNUMBERTA PibasAccount, SUM(PLS.BBTRANSACTIONS.TRANSACTIONAMOUNT) PIBASAmount FROM PLS.BBTRANSACTIONS@pibas WHERE NARRATION LIKE 'Sybase%' AND To_date(TRANSACTIONDATE,'yyyy-mm-dd')  = '" + txtTranDateFrom.Text + "' GROUP BY PLS.BBTRANSACTIONS.TOACCOUNTNUMBERTA ) asx ,( SELECT GL_CODE_DESCRIPTION,ID_GL_CODE,MAX(ID_GL_HISTORY) RefrenceNO, SUM(AMOUNT) Amount FROM (SELECT gl.GL_CODE_DESCRIPTION,gl.ID_GL_CODE,glh.ID_GL_HISTORY ID_GL_HISTORY, CASE WHEN glh.DC_FLAG='D' THEN glh.AMOUNT*-1 ELSE glh.AMOUNT END AMOUNT,glh.DC_FLAG FROM pbxhbl.GENERAL_LEDGER gl INNER JOIN pbxhbl.GL_HISTORY glh ON glh.GL_CODE=gl.ID_GL_CODE WHERE to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') >= trunc(to_date('" + txtTranDateFrom.Text + "')-1)||'04.00.00.00 AM' AND to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') < trunc(to_date('" + txtTranDateFrom.Text + "'))||'04.00.00.00 AM' AND glh.DC_FLAG='C' ) GROUP BY GL_CODE_DESCRIPTION,ID_GL_CODE,DC_FLAG ) asx2, cmsuser.TBLGLINFO gl WHERE asx2.ID_GL_CODE = gl.SYBASEGLACCOUNT AND asx.PibasAccount = gl.PIBAS_GL_WITH_LOCATION";
            //SqlDataSource3.DataBind();
            //GridView2.DataBind();

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
        {
               
            string TransAmount = ((Label)e.Row.FindControl("Label1")).Text;
         decimal totalvalue = Convert.ToDecimal(TransAmount);
         if (totalvalue < 0)
         {
             sumFooterValueDr += totalvalue;
         }
         else
         {
             sumFooterValueCr += totalvalue;
         }

        }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lbl = (Label)e.Row.FindControl("lblTotalDr");
                lbl.Text = "Total Dr. Tran = "  + sumFooterValueDr.ToString();

                Label lbl1 = (Label)e.Row.FindControl("lblTotalCr");
                lbl1.Text = "Total Cr. Tran = " + sumFooterValueCr.ToString();

                Label lbl2 = (Label)e.Row.FindControl("lblTotalDiff");
                lbl2.Text = "Difference = " + Convert.ToString(sumFooterValueCr + sumFooterValueDr);

            }
        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                string TransAmount = ((Label)e.Row.FindControl("Label2")).Text;
                decimal totalvalue = Convert.ToDecimal(TransAmount);
                if (totalvalue < 0)
                {
                    sumFooterValueDr += totalvalue;
                }
                else
                {
                    sumFooterValueCr += totalvalue;
                }

            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                Label lbl = (Label)e.Row.FindControl("lblTotalDr1");
                lbl.Text = "Total Dr. Tran = " + sumFooterValueDr.ToString();

                Label lbl1 = (Label)e.Row.FindControl("lblTotalCr1");
                lbl1.Text = "Total Cr. Tran = " + sumFooterValueCr.ToString();

                Label lbl2 = (Label)e.Row.FindControl("lblTotalDiff1");
                lbl2.Text = "Difference = " + Convert.ToString(sumFooterValueCr + sumFooterValueDr);

            }
        }
    }
}