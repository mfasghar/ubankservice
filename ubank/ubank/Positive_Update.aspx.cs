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
    public partial class Positive_Update : System.Web.UI.Page
    {
        String last = "";
    

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

        protected void load_Click(object sender, EventArgs e)
        {
            last = Convert.ToDateTime(from_date.Text).ToString("dd-MMM-yyyy");
       

            string SQLQuery = "";
            SQLQuery = @"select BRANCH_CODE, file1, NIC , CNIC,
 Account, NEW_ACount,  Account_Type,
case when Account_Status=5
then 'open'
else 'close' end Account_Status1 ,     Status_Date,DISB_TOTAL_AMOUNT,

maturity, Term, 
--to_Number(nvl(TRAN_AMNT,'0'))+to_number(nvl(Tran_MarkUp,'0')) 
 sum(Last_Payment) Last_Payment1 ,
 Outstanding_Balance,
 Over_Due_Balance,

 Payment_Status, Association_Type, Group_Id,
 NIC1,
 CNIC1,
 First_Name1 ,
 Middle_Name1, Last_Name1,
 Birth_Name1,
 Association from(


select distinct BRANCH_CODE,'' file1,'' NIC ,NIC_NEW CNIC,
BRANCH_CODE||'0'||LOAN_CODE Account,'' NEW_ACount, 'IN' Account_Type,
BASE_STATUS Account_Status ,    
'' Status_Date,DISB_TOTAL_AMOUNT,

maturity,'INT' Term, 
--to_Number(nvl(TRAN_AMNT,'0'))+to_number(nvl(Tran_MarkUp,'0')) 
AmntNorm Last_Payment,
OUTSTANDING_PRINCIPAL Outstanding_Balance,
DUE_PRINCIPAL+dUE_INT_NORMAL+DUE_INT_gp Over_Due_Balance,
case 
when  DAYS_PAST_DUE='0'
then 'ok'
when DAYS_PAST_DUE >0 and DAYS_PAST_DUE <30
 then 'X'
when DAYS_PAST_DUE >30 and DAYS_PAST_DUE<60
then '30+'
when DAYS_PAST_DUE >60 and DAYS_PAST_DUE <89
 then '60+'
when DAYS_PAST_DUE >90 and DAYS_PAST_DUE<119
then '90+'
when DAYS_PAST_DUE >120 and DAYS_PAST_DUE <149
 then '120+'
when DAYS_PAST_DUE >150 and DAYS_PAST_DUE<179
then '150+'
when DAYS_PAST_DUE >180
 then '180+'
 end 
 Payment_Status,
'PRN' Association_Type,'' Group_Id,
gcnic NIC1,
gcnic CNIC1,
GFname First_Name1 ,
gMIDNAMe Middle_Name1,
GLastName Last_Name1,
'' Birth_Name1,
'' Association--,untildue, date_due--,TRAN_AMNT,abas,asfic,tdate
 from(
SELECT distinct  lmfs.DATE_LAST_DISBURSED, '' AmntNorm,lmfs.BASE_STATUS,--,md.TRAN_AMNT,md1.TRAN_AMNT Tran_MarkUp,ACCT_INT_NOM_SFIX,md.BRAN_CODE,md.ACCT_BASC abas,md.ACCT_SFIX asfic,md.TRAN_DATE tdate,

DECODE(lmfs.DAYS_PAST_DUE,'0',0,lmfs.DUE_PRINCIPAL  +lmfs.DUE_INT_BEFORE_DUE+lmfs.dUE_INT_NORMAL+lmfs.DUE_INT_AFTER_DUE+lmfs.DUE_INT_gp+lmfs.OUTSTANDING_OTHERS  ) OVERDUEAMOUNT,
--DECODE(DAYS_PAST_DUE,'0', date_due - date_current ,0) untildue,
bi.BRM_CODE ,dUE_INT_NORMAL,
DUE_INT_gp,
bi.BRM_CODE BRAN_CODE , ''  AccountNo,'' SHRT_NAME,bi.FIRST_NAME,bi.MIDDLE_NAME,bi.LAST_NAME--,grn.BRANCH_CODE||'-'|| grn.GUARANTOR_ACCT_BASC GUARANTOR_ACCT
,lmfs.DATE_ADDED, lmfs.BRANCH_CODE,lmfs.LOAN_CODE,lmfs.LOAN_PRODUCT_CODE,lmfp.NME,lmfs.INT_RATE,lmfs.CREDIT_OFFICER,lmfs.DISB_TOTAL_AMOUNT
,bi.NIC_NEW,decode(bi.GENDER,1,'Male',2,'Female')GENDER,
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


inner join pls.BRMADDRESSES brmad
on 
brmad.BRM_CODE=bi.BRM_CODE and brmad.ADDRESS_SEQ=1
 --and (brmad.ADDRESS_TYPE_CODE='1' or brmad.ADDRESS_TYPE_CODE='2' or brmad.ADDRESS_TYPE_CODE='3')
inner join lmf.LMFLOANS lmfs
on lmfs.BORROWER_CODE =bi.BRM_CODE and lmfs.BRANCH_CODE=bi.BRANCH_CODE


--inner  join lmf.LMFLOANREPAYMENTS lmfr
--on lmfr.BRANCH_CODE= lmfs.BRANCH_CODE and lmfr.LOAN_CODE=lmfs.LOAN_CODE and lmfr.DATE_VALUE =(select max(lmfr1.DATE_VALUE) from lmf.LMFLOANREPAYMENTS lmfr1 where lmfr1.BRANCH_CODE= lmfr.BRANCH_CODE and lmfr1.LOAN_CODE=lmfr.LOAN_CODE  )  -->'1-may-2014'
--left join pls.mg md
--on md.bran_code=lmfs.BRANCH_CODE and lmfs.ACCT_CHG_NOM_BASC=md.ACCT_BASC and md.ACCT_SFIX= lmfs.ACCT_CUST_SFIX and to_char(md.tran_date,'mm/yyyy')=to_char(sysdate-40,'mm/yyyy') and md.NARR_LIN2='LMF Repayment'

--left join pls.mg md1
--on md1.bran_code=lmfs.BRANCH_CODE and lmfs.ACCT_CHG_NOM_BASC=md1.ACCT_BASC and md1.ACCT_SFIX= lmfs.ACCT_INT_NOM_SFIX and to_char(md1.tran_date,'mm/yyyy')=to_char(sysdate-40,'mm/yyyy') and md.NARR_LIN2='LMF Repayment'

inner join lmf.LMFLOANPRODUCTS lmfp
on lmfp.LOAN_PRODUCT_CODE=lmfs.LOAN_PRODUCT_CODE
inner join lmf.LMFLOANSCHEDULES lmfSc
on lmfsc.LOAN_CODE=lmfs.LOAN_CODE and lmfsc.BRANCH_CODE=lmfs.BRANCH_CODE

left join lmf.LMFLOANGUARANTORS grn
on grn.LOAN_CODE=lmfs.LOAN_CODE and grn.BRANCH_CODE=lmfs.BRANCH_CODE

--1jan 2014 

left join pls.BRMBUSINESSENTITIES b2
on b2.BRANCH_CODE=grn.BRANCH_CODE and b2.BRM_CODE=grn.GUARANTOR_ACCT_BASC

where lmfs.BASE_STATUS in('5','6') and lmfs.DATE_LAST_DISBURSED<'"+last+@"' and ( lmfs.DATE_CLOSED > '01-SEP-2013' OR lmfs.DATE_CLOSED IS NULL)-- and lmfs.DATE_ADDED between '01-May-2014' and '01-Jun-2014'

order by lmfs.DATE_ADDED asc)

union

select distinct BRANCH_CODE,'' file1,'' NIC ,NIC_NEW CNIC,
BRANCH_CODE||'0'||LOAN_CODE Account,'' NEW_ACount, 'IN' Account_Type,
BASE_STATUS Account_Status ,    
'' Status_Date,DISB_TOTAL_AMOUNT,

maturity,'INT' Term, 
--to_Number(nvl(TRAN_AMNT,'0'))+to_number(nvl(Tran_MarkUp,'0')) 
AmntNorm Last_Payment,
OUTSTANDING_PRINCIPAL Outstanding_Balance,
DUE_PRINCIPAL+dUE_INT_NORMAL+DUE_INT_gp Over_Due_Balance,
case 
when  DAYS_PAST_DUE='0'
then 'ok'
when DAYS_PAST_DUE >0 and DAYS_PAST_DUE <30
 then 'X'
when DAYS_PAST_DUE >30 and DAYS_PAST_DUE<60
then '30+'
when DAYS_PAST_DUE >60 and DAYS_PAST_DUE <89
 then '60+'
when DAYS_PAST_DUE >90 and DAYS_PAST_DUE<119
then '90+'
when DAYS_PAST_DUE >120 and DAYS_PAST_DUE <149
 then '120+'
when DAYS_PAST_DUE >150 and DAYS_PAST_DUE<179
then '150+'
when DAYS_PAST_DUE >180
 then '180+'
 end 
 Payment_Status,
'PRN' Association_Type,'' Group_Id,
gcnic NIC,
gcnic CNIC,
GFname First_Name ,
gMIDNAMe Middle_Name,
GLastName Last_Name,
'' Birth_Name,
'' Association--,untildue, date_due--,TRAN_AMNT,abas,asfic,tdate
 from(
SELECT distinct  lmfs.DATE_LAST_DISBURSED, to_char(lmfr.AMOUNT+lmfr.INT_NORMAL) AmntNorm,lmfs.BASE_STATUS,--,md.TRAN_AMNT,md1.TRAN_AMNT Tran_MarkUp,ACCT_INT_NOM_SFIX,md.BRAN_CODE,md.ACCT_BASC abas,md.ACCT_SFIX asfic,md.TRAN_DATE tdate,

DECODE(lmfs.DAYS_PAST_DUE,'0',0,lmfs.DUE_PRINCIPAL  +lmfs.DUE_INT_BEFORE_DUE+lmfs.dUE_INT_NORMAL+lmfs.DUE_INT_AFTER_DUE+lmfs.DUE_INT_gp+lmfs.OUTSTANDING_OTHERS  ) OVERDUEAMOUNT,
--DECODE(DAYS_PAST_DUE,'0', date_due - date_current ,0) untildue,
bi.BRM_CODE ,dUE_INT_NORMAL,
DUE_INT_gp,
bi.BRM_CODE BRAN_CODE , ''  AccountNo,'' SHRT_NAME,bi.FIRST_NAME,bi.MIDDLE_NAME,bi.LAST_NAME--,grn.BRANCH_CODE||'-'|| grn.GUARANTOR_ACCT_BASC GUARANTOR_ACCT
,lmfs.DATE_ADDED, lmfs.BRANCH_CODE,lmfs.LOAN_CODE,lmfs.LOAN_PRODUCT_CODE,lmfp.NME,lmfs.INT_RATE,lmfs.CREDIT_OFFICER,lmfs.DISB_TOTAL_AMOUNT
,bi.NIC_NEW,decode(bi.GENDER,1,'Male',2,'Female')GENDER,
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


inner join pls.BRMADDRESSES brmad
on 
brmad.BRM_CODE=bi.BRM_CODE and brmad.ADDRESS_SEQ=1
 --and (brmad.ADDRESS_TYPE_CODE='1' or brmad.ADDRESS_TYPE_CODE='2' or brmad.ADDRESS_TYPE_CODE='3')
inner join lmf.LMFLOANS lmfs
on lmfs.BORROWER_CODE =bi.BRM_CODE and lmfs.BRANCH_CODE=bi.BRANCH_CODE


inner  join lmf.LMFLOANREPAYMENTS lmfr
on lmfr.BRANCH_CODE= lmfs.BRANCH_CODE and lmfr.LOAN_CODE=lmfs.LOAN_CODE and lmfr.DATE_VALUE =(select max(lmfr1.DATE_VALUE) from lmf.LMFLOANREPAYMENTS lmfr1 where lmfr1.BRANCH_CODE= lmfr.BRANCH_CODE and lmfr1.LOAN_CODE=lmfr.LOAN_CODE  )  -->'1-may-2014'
--left join pls.mg md
--on md.bran_code=lmfs.BRANCH_CODE and lmfs.ACCT_CHG_NOM_BASC=md.ACCT_BASC and md.ACCT_SFIX= lmfs.ACCT_CUST_SFIX and to_char(md.tran_date,'mm/yyyy')=to_char(sysdate-40,'mm/yyyy') and md.NARR_LIN2='LMF Repayment'

--left join pls.mg md1
--on md1.bran_code=lmfs.BRANCH_CODE and lmfs.ACCT_CHG_NOM_BASC=md1.ACCT_BASC and md1.ACCT_SFIX= lmfs.ACCT_INT_NOM_SFIX and to_char(md1.tran_date,'mm/yyyy')=to_char(sysdate-40,'mm/yyyy') and md.NARR_LIN2='LMF Repayment'

inner join lmf.LMFLOANPRODUCTS lmfp
on lmfp.LOAN_PRODUCT_CODE=lmfs.LOAN_PRODUCT_CODE
inner join lmf.LMFLOANSCHEDULES lmfSc
on lmfsc.LOAN_CODE=lmfs.LOAN_CODE and lmfsc.BRANCH_CODE=lmfs.BRANCH_CODE

left join lmf.LMFLOANGUARANTORS grn
on grn.LOAN_CODE=lmfs.LOAN_CODE and grn.BRANCH_CODE=lmfs.BRANCH_CODE

--1jan 2014 

left join pls.BRMBUSINESSENTITIES b2
on b2.BRANCH_CODE=grn.BRANCH_CODE and b2.BRM_CODE=grn.GUARANTOR_ACCT_BASC

where lmfs.BASE_STATUS in('5','6') and lmfs.DATE_LAST_DISBURSED<'"+last+@"' and ( lmfs.DATE_CLOSED > '01-SEP-2013' OR lmfs.DATE_CLOSED IS NULL)
order by lmfs.DATE_ADDED asc))xyz
group by
BRANCH_CODE, file1, NIC , CNIC,
 Account, NEW_ACount,  Account_Type,
 Account_Status ,     Status_Date,DISB_TOTAL_AMOUNT,

maturity, Term, 
--to_Number(nvl(TRAN_AMNT,'0'))+to_number(nvl(Tran_MarkUp,'0')) 

 Outstanding_Balance,
 Over_Due_Balance,

 Payment_Status, Association_Type, Group_Id,
 NIC1,
 CNIC1,
 First_Name1 ,
 Middle_Name1, Last_Name1,
 Birth_Name1,
 Association 
";
            DataTable dt = ConnectionsPIBAS.GetFromDBPIBAS(SQLQuery,Convert.ToInt64(DropDownList1.SelectedItem.Value));

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
    }
}