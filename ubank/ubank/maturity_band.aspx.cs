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
 

    public partial class maturity_band : System.Web.UI.Page
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
            Response.AddHeader("content-disposition", "attachment;filename=Maturity_band.xls");
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
            SQLQuery = @"select BRANCH_CODE
                    , listagg(month1 ,'') within group(order by month1) Month1
                    , listagg(month2 ,'') within group(order by month2) Month2
                    , listagg(month3 ,'') within group(order by month3) Month3
                    , listagg(month4 ,'') within group(order by month4) Month4
                    , listagg(month5 ,'') within group(order by month5) Month5
                    , listagg(month6 ,'') within group(order by month6) Month6
                    , listagg(month7 ,'') within group(order by month7) Month7
                    , listagg(month8 ,'') within group(order by month8) Month8
                    , listagg(month9 ,'') within group(order by month9) Month9
                    , listagg(month10,'') within group(order by month10)Month10 
                    from (
                    SELECT   BRANCH_CODE,date_due,
                               DECODE ( date_due , 1, principal ||','||count ) month1,
                               DECODE ( date_due , 2, principal ||','||count ) month2,
                               DECODE ( date_due , 3, principal ||','||count ) month3,
                               DECODE ( date_due , 4, principal ||','||count ) month4,
                               DECODE ( date_due , 5, principal ||','||count ) month5,
                               DECODE ( date_due , 6, principal ||','||count ) month6,
                               DECODE ( date_due , 7, principal ||','||count ) month7,
                               DECODE ( date_due , 8, principal ||','||count ) month8,
                               DECODE ( date_due , 9, principal ||','||count ) month9,
                               DECODE ( date_due , 10,principal ||','||count ) month10
                    from (
                    select principal ,BRANCH_CODE,date_due,count,row_number() OVER ( partition by BRANCH_CODE  order by rownum) rn from(
                    SELECT sum(INST_AMOUNT) principal ,BRANCH_CODE, '1' date_due ,count(*) count
                               FROM  lmf.LMFLOANSCHEDULEINSTALLMENTS WHERE to_char(DATE_DUE ,'mm-yyyy')=to_char(sysdate,'mm-yyyy') 
                    group by BRANCH_CODE, to_char(DATE_DUE,'mm-yyyy')

                    union 
                    SELECT sum(INST_AMOUNT) principal ,BRANCH_CODE, '2' date_due,count(*) count FROM   lmf.LMFLOANSCHEDULEINSTALLMENTS 
                    WHERE to_char(DATE_DUE ,'mm-yyyy')=to_char(sysdate+30,'mm-yyyy') 
                    group by BRANCH_CODE,to_char(DATE_DUE,'mm-yyyy')
                    union 
                    SELECT sum(INST_AMOUNT) principal ,BRANCH_CODE, '3' date_due,count(*) count FROM   lmf.LMFLOANSCHEDULEINSTALLMENTS 
                    WHERE to_char(DATE_DUE ,'mm-yyyy')=to_char(sysdate+60,'mm-yyyy') 
                    group by BRANCH_CODE,to_char(DATE_DUE,'mm-yyyy')
                    union
                    SELECT sum(INST_AMOUNT) principal ,BRANCH_CODE, '4' date_due,count(*) count FROM   lmf.LMFLOANSCHEDULEINSTALLMENTS 
                    WHERE to_char(DATE_DUE ,'mm-yyyy')=to_char(sysdate+90,'mm-yyyy') 
                    group by BRANCH_CODE,to_char(DATE_DUE,'mm-yyyy')
                    union
                    SELECT sum(INST_AMOUNT) principal ,BRANCH_CODE, '5' date_due,count(*) count FROM   lmf.LMFLOANSCHEDULEINSTALLMENTS 
                    WHERE to_char(DATE_DUE ,'mm-yyyy')=to_char(sysdate+120,'mm-yyyy') 
                    group by BRANCH_CODE,to_char(DATE_DUE,'mm-yyyy')
                    union
                    SELECT sum(INST_AMOUNT) principal ,BRANCH_CODE, '6' date_due,count(*) count FROM   lmf.LMFLOANSCHEDULEINSTALLMENTS 
                    WHERE to_char(DATE_DUE ,'mm-yyyy')=to_char(sysdate+150,'mm-yyyy') 
                    group by BRANCH_CODE,to_char(DATE_DUE,'mm-yyyy')
                    union
                    SELECT sum(INST_AMOUNT) principal ,BRANCH_CODE,'7' date_due,count(*) count FROM   lmf.LMFLOANSCHEDULEINSTALLMENTS 
                    WHERE to_char(DATE_DUE ,'mm-yyyy')=to_char(sysdate+180,'mm-yyyy') 
                    group by BRANCH_CODE,to_char(DATE_DUE,'mm-yyyy')
                    union
                    SELECT sum(INST_AMOUNT) principal ,BRANCH_CODE, '8' date_due,count(*) count FROM   lmf.LMFLOANSCHEDULEINSTALLMENTS 
                    WHERE to_char(DATE_DUE ,'mm-yyyy')=to_char(sysdate+210,'mm-yyyy') 
                    group by BRANCH_CODE,to_char(DATE_DUE,'mm-yyyy')
                    union
                    SELECT sum(INST_AMOUNT) principal ,BRANCH_CODE, '9' date_due,count(*) count FROM   lmf.LMFLOANSCHEDULEINSTALLMENTS 
                    WHERE to_char(DATE_DUE ,'mm-yyyy')=to_char(sysdate+240,'mm-yyyy') 
                    group by BRANCH_CODE,to_char(DATE_DUE,'mm-yyyy')
                    union
                    SELECT sum(INST_AMOUNT) principal ,BRANCH_CODE,'10' date_due,count(*) count FROM   lmf.LMFLOANSCHEDULEINSTALLMENTS 
                    WHERE to_char(DATE_DUE ,'mm-yyyy')=to_char(sysdate+270,'mm-yyyy') 
                    group by BRANCH_CODE,to_char(DATE_DUE,'mm-yyyy')

                    )level1))level2  GROUP BY BRANCH_CODE";

            DataTable dt = ConnectionsPIBAS.GetFromDBPIBAS(SQLQuery, Convert.ToInt64(DropDownList1.SelectedItem.Value));

            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}