using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ubank.Manager;

namespace ubank
{
    public partial class recovery : System.Web.UI.Page
    {

        String from = "";
        String to = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
            

            }
        }

        protected void load_Click(object sender, EventArgs e)
        {
            from = Convert.ToDateTime(from_date.Text).ToString("dd-MMM-yyyy");
            to = Convert.ToDateTime(to_date.Text).ToString("dd-MMM-yyyy");

            String SQLQuery = "";
            SQLQuery = @"select abc.BRANCH_CODE,abc.LOAN_CODE, abc.LOAN_PRODUCT_CODE, to_number(listagg(abc.PRINCIPLE,',') within group (order by PRINCIPLE))  PRINCIPLE1,to_number(listagg(abc.markup,',') within group (order by markup))  markup1  ,abc.DATE_CLOSED,abc.DATE_LAST_REP,abc.DATE_LAST_DISBURSED,abc.DATE_EXPIRY,abc.status,decode(bi.GENDER,1,'M',2,'F')GENDER from(
                        SELECT  l1.BORROWER_CODE, L1.BRANCH_CODE, L1.LOAN_CODE, L1.LOAN_PRODUCT_CODE,to_char(sum(G1.TRAN_AMNT))  PRINCIPLE, '' markup,
                        L1.DATE_CLOSED,DATE_LAST_REP,l1.DATE_LAST_DISBURSED,L1.DATE_EXPIRY, decode(l1.base_status,5,'open',6,'close') status FROM  PLS.MG G1 
                        inner join lmf.LMFLOANS L1
                         ON L1.BRANCH_CODE=G1.BRAN_CODE AND G1.ACCT_BASC = L1.ACCT_CUST_BASC AND G1.ACCT_SFIX = L1.ACCT_CUST_SFIX
                         WHERE g1.TRAN_DATE between '01 Dec 2014' and '01 Jan 2015'  and G1.NARR_LIN2='LMF Repayment'   
                        and l1.base_status in(5,6) and l1.DATE_LAST_DISBURSED >'01 may 2013'
                         --and g1.tran_code=641 and L1.LOAN_PRODUCT_CODE in(158)
                        group by l1.BORROWER_CODE,L1.BRANCH_CODE, L1.LOAN_CODE, L1.LOAN_PRODUCT_CODE,L1.DATE_CLOSED,l1.DATE_LAST_DISBURSED,
                         decode(l1.base_status,5,'open',6,'close'),L1.DATE_EXPIRY,DATE_LAST_REP
                        union
                        SELECT l1.BORROWER_CODE,L1.BRANCH_CODE, L1.LOAN_CODE, L1.LOAN_PRODUCT_CODE,''  PRINCIPLE,to_char( sum(G2.TRAN_AMNT)) markup,
                        L1.DATE_CLOSED,DATE_LAST_REP,l1.DATE_LAST_DISBURSED,DATE_EXPIRY , decode(l1.base_status,5,'open',6,'close') status  FROM  PLS.MG G2 
                        inner join lmf.LMFLOANS L1
                        ON L1.BRANCH_CODE=G2.BRAN_CODE AND G2.ACCT_BASC = L1.ACCT_CUST_BASC AND G2.ACCT_SFIX = L1.ACCT_INT_NOM_SFIX
                         WHERE G2.TRAN_DATE
                         between '01 Dec 2014' and '01 Jan 2015' and G2.NARR_LIN2='LMF Repayment'    and l1.base_status in(5,6)
                        and l1.DATE_LAST_DISBURSED >'01 may 2013'
                         --and g1.tran_code=641 and L1.LOAN_PRODUCT_CODE in(158)
                        group by l1.BORROWER_CODE,L1.BRANCH_CODE, L1.LOAN_CODE, L1.LOAN_PRODUCT_CODE,L1.DATE_CLOSED,
                        l1.DATE_LAST_DISBURSED,DATE_LAST_REP,DATE_EXPIRY, decode(l1.base_status,5,'open',6,'close')
                        ) abc

                        inner join pls.BRMBUSINESSENTITIES bi 
                        on abc.BORROWER_CODE=bi.BRM_CODE
                        group by abc.BRANCH_CODE,abc.LOAN_CODE, abc.LOAN_PRODUCT_CODE,abc.DATE_CLOSED,
                        abc.DATE_LAST_REP,abc.DATE_LAST_DISBURSED,abc.DATE_EXPIRY,abc.status,decode(bi.GENDER,1,'M',2,'F')
                        ";

            

            DataTable dt = ConnectionsPIBAS.GetFromDBPIBAS(SQLQuery,Convert.ToInt64( DropDownList1.SelectedValue));

            GridView1.DataSource = dt;
            GridView1.DataBind();

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
            Response.AddHeader("content-disposition", "attachment;filename=Recovery.xls");
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

       
    }
}