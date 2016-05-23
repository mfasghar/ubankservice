﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ubank;
using ubank.Manager;

namespace ubank
{
    public partial class default_Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }


        protected void ExportToExcel_Click(object sender, EventArgs e)
        {
             if (GridView1.Rows.Count <= 0)
            {
                return;
            }
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=Default_Update.xls");
            Response.Charset = "";
            Response.ContentType = "application/vnd.ms-excel";
            using (StringWriter sw = new StringWriter())
            {
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                //To Export all pages
                //GridView1.AllowPaging = false;
                // GridView1.BindGrid();

                GridView1.HeaderRow.BackColor = Color.White;
                foreach (TableCell cell in GridView1.HeaderRow.Cells)
                {
                    cell.BackColor = GridView1.HeaderStyle.BackColor;
                }
                foreach (GridViewRow row in GridView1.Rows)
                {
                    row.BackColor = Color.White;
                    foreach (TableCell cell in row.Cells)
                    {
                        if (row.RowIndex % 2 == 0)
                        {
                            cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                        }
                        else
                        {
                            cell.BackColor = GridView1.RowStyle.BackColor;
                        }
                        cell.CssClass = "textmode";
                    }
                }

                GridView1.RenderControl(hw);

                //style to format numbers to string
                string style = @"<style> .textmode { } </style>";
                Response.Write(style);
                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string SQLQuery;
            SQLQuery = @"select '' File1, branch_code, NIC_NEW CNIC,
                    BRANCH_CODE||'0'||LOAN_CODE Account,'' New_Account, 'IN' Account_Type,'' NEw_defual_status, '' Default_date,
                     DUE_PRINCIPAL+dUE_INT_NORMAL+DUE_INT_gp  Default_Amount,

                    'Payment Default' Reson_To_Report
                     from (
                    SELECT distinct  lmfs.DATE_LAST_DISBURSED,bi.BRM_CODE ,bi.BRM_CODE BRAN_CODE , ''  AccountNo, lmfs.DESN SHRT_NAME,bi.FIRST_NAME,bi.MIDDLE_NAME,bi.LAST_NAME--,grn.BRANCH_CODE||'-'|| grn.GUARANTOR_ACCT_BASC GUARANTOR_ACCT
                    ,lmfs.DATE_ADDED, lmfs.BRANCH_CODE,lmfs.LOAN_CODE,lmfs.LOAN_PRODUCT_CODE,lmfp.NME,lmfs.INT_RATE,lmfs.CREDIT_OFFICER,lmfs.DISB_TOTAL_AMOUNT
                    ,bi.NIC_NEW,decode(bi.GENDER,1,'M',2,'F')GENDER,
                    dUE_INT_NORMAL,DUE_INT_gp,
                    lmfs.OUTSTANDING_PRINCIPAL,lmfs.DATE_EXPIRY maturity,lmfs.INT_RATE,
                    lmfs.OUTSTANDING_INT_NORMAL,lmfs.gp,lmfsc.DATE_FIRST_INST,lmfs.DATE_LAST_REP,lmfs.DATE_DUE,lmfs.SUPERVISION1_USER,lmfs.CREDIT_OFFICER,
                    lmfs.PERIOD_MONTH,lmfs.PERIOD_YEAR,bi.FATHER_NAME,bi.DATE_OF_BIRTH
                    ,brmad.LINE1||' ' || brmad.LINE2||''||brmad.line3||' ' ||brmad.line4 address,brmad.line4
                    city,
                    case 
                    when lmfs.PERIOD_YEAR=0 then lmfs.PERIOD_MONTH*30
                    when lmfs.PERIOD_MONTH=0 then 365
                    else lmfs.PERIOD_DAY
                    end days,
                    case 
                    when lmfs.PERIOD_YEAR=0 then lmfs.PERIOD_MONTH
                    when lmfs.PERIOD_MONTH=0 then lmfs.PERIOD_YEAR *12
                    else lmfs.PERIOD_DAY
                    end NoOFInstalment
                    ,lmfs.INT_TYPE,lmfs.DAYS_PAST_DUE,lmfs.DUE_PRINCIPAL
                    ,b2.FIRST_NAME GFname,b2.MIDDLE_NAME gMIDNAMe,b2.LAST_NAME GLastName,b2.nic_new gcnic
                    FROM  pls.BRMBUSINESSENTITIES Bi 
                    --inner join pls.MD md
                    --on md.BRM_CODE=bi.BRM_CODE and md.BRAN_CODE=bi.BRANCH_CODE

                    inner join pls.BRMADDRESSES brmad
                    on 
                    brmad.BRM_CODE=bi.BRM_CODE and brmad.ADDRESS_SEQ=1
                     --and (brmad.ADDRESS_TYPE_CODE='1' or brmad.ADDRESS_TYPE_CODE='2' or brmad.ADDRESS_TYPE_CODE='3')
                    inner join lmf.LMFLOANS lmfs
                    on lmfs.BORROWER_CODE =bi.BRM_CODE and lmfs.BRANCH_CODE=bi.BRANCH_CODE
                    inner join lmf.LMFLOANPRODUCTS lmfp
                    on lmfp.LOAN_PRODUCT_CODE=lmfs.LOAN_PRODUCT_CODE
                    inner join lmf.LMFLOANSCHEDULES lmfSc
                    on lmfsc.LOAN_CODE=lmfs.LOAN_CODE and lmfsc.BRANCH_CODE=lmfs.BRANCH_CODE

                    left join lmf.LMFLOANGUARANTORS grn
                    on grn.LOAN_CODE=lmfs.LOAN_CODE and grn.BRANCH_CODE=lmfs.BRANCH_CODE

                    left join pls.BRMBUSINESSENTITIES b2
                    on b2.BRANCH_CODE=grn.BRANCH_CODE and b2.BRM_CODE=grn.GUARANTOR_ACCT_BASC

                    where lmfs.BASE_STATUS='5'  and DAYS_PAST_DUE > 0

                    order by lmfs.DATE_ADDED asc) 
                    --where BRANCH_CODE||'0'||LOAN_CODE in ('105809')";


            DataTable dt = ConnectionsPIBAS.GetFromDBPIBAS(SQLQuery, Convert.ToInt64(DropDownList1.SelectedItem.Value));

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}