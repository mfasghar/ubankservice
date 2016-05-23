using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;

namespace ubank
{
    public partial class pibas111report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["LoginSession"] == null || Session["LoginSession"] == "")
            {
                Response.Redirect("sessexp.aspx", false);
                return;
            }


            Boolean strValue;
            string struserid = Session["UserID"].ToString();
            string strFileName = Path.GetFileName(Request.PhysicalPath); //idrequestaddView.aspx
            ubank.Class1 objGlobalASA = new Class1();


            strValue = objGlobalASA.CheckRightsForAll(struserid, strFileName, 1);

            if (strValue != true)
            {

                Session["ErrDes"] = "";
                Session["ErrDes"] = "You don’t have Privileges. Please contact with Web Administrator";
                Response.Redirect("blankpg.aspx");

            }


            if (!IsPostBack)
            {
                DateTime date = DateTime.Today;
                if (date.DayOfWeek.Equals(DayOfWeek.Monday))
                {

                    TextBox1.Text = date.AddDays(-3).ToString("D");
                    TextBox2.Text = date.AddDays(-2).ToString("D");
                }
                else if (date.DayOfWeek.Equals(DayOfWeek.Tuesday))
                {
                    TextBox1.Text = date.AddDays(-3).ToString("D");
                    TextBox2.Text = date.AddDays(-1).ToString("D");
                }
                else
                {

                    TextBox1.Text = date.AddDays(-2).ToString("D");
                    TextBox2.Text = date.AddDays(-1).ToString("D");
                }
                //   loadAllData();
                //    loadData();
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }
        protected void ExportToExcel_Click(object sender, ImageClickEventArgs e)
        {
            if (GridView1.Rows.Count <= 0)
            {
                return;
            }
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=LMFRePayment_" + DateTime.Now + ".xls");
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



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            loadData();

        }
        public void loadData()
        {
            string consString = ConfigurationManager.ConnectionStrings["strConn"].ConnectionString;
            SqlConnection con = new SqlConnection(consString);
            string fromDate = TextBox1.Text;
            fromDate = Convert.ToDateTime(fromDate).ToString("dd/MMM/yyyy hh:mm:ss tt");
            string toDate = TextBox2.Text;
            toDate = Convert.ToDateTime(toDate).ToString("dd/MMM/yyyy hh:mm:ss tt");
            // HttpContext.Current.Response.Write(fromDate +" and "+ toDate);
            string branchCode = txtBranchCode.Text;
            string roCode = txtRoCode.Text;
            string query = "";
            if (String.IsNullOrEmpty(branchCode) && String.IsNullOrEmpty(roCode))
            {
                query = "SELECT * FROM [umbldms].[dbo].[vw_lmfrepayment] WHERE [DateDue] BETWEEN '" + fromDate.ToString() + "' AND '" + toDate.ToString() + "' Order BY BranchCode, RoCode";
            }
            else if (String.IsNullOrEmpty(roCode))
            {
                query = "SELECT * FROM [umbldms].[dbo].[vw_lmfrepayment] WHERE [BranchCode]=" + branchCode + " AND [DateDue] BETWEEN '" + fromDate.ToString() + "' AND '" + toDate.ToString() + "' Order BY BranchCode, RoCode";
            }
            else if (String.IsNullOrEmpty(branchCode))
            {
                query = "SELECT * FROM [umbldms].[dbo].[vw_lmfrepayment] WHERE [RoCode]=" + roCode + " AND [DateDue] BETWEEN '" + fromDate.ToString() + "' AND '" + toDate.ToString() + "' Order BY BranchCode, RoCode";
            }
            else
            {
                query = "SELECT * FROM [umbldms].[dbo].[vw_lmfrepayment] WHERE [RoCode]=" + roCode + " AND [BranchCode]=" + branchCode + " AND [DateDue] BETWEEN '" + fromDate.ToString() + "' AND '" + toDate.ToString() + "' Order BY BranchCode, RoCode";
            }
           // HttpContext.Current.Response.Write(query);
            SqlDataAdapter Adp = new SqlDataAdapter(query, con);
            //SqlDataAdapter Adp = new SqlDataAdapter("SELECT * FROM [umbldms].[dbo].[vw_lmfrepayment]", con);

            // SqlDataAdapter Adp = new SqlDataAdapter("SELECT TOP 20 [BranchCode] ,[LoanCode] ,[CellNo],[CNIC],[RoName],[RoCode],[BorrowerCode],[PC] ,[DisbAmnt],[InstAmnt] ,[DateDue],[InstPrincipal] ,[InstMKPNormal] ,[InstMKPGP] ,[PaidPrincipal] ,[PaidMKPNormal] ,[PaidMKPGP] ,[DatePaid],[OutsidePrinciple],[OutsideMKPNormal],[OutsideMKPGP],[DPD] ,[DueAmount] FROM [umbldms].[dbo].[vw_lmfrepayment]", con);
            DataTable Dt = new DataTable();
            Adp.Fill(Dt);
            GridView1.DataSource = Dt;
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0)
            {
                litmsg.Text = "<p style='color:red;'>No Record Found!</p>";
                ExportToExcel.Visible = false;
            }
            else
            {
                litmsg.Text = "<p><b>" + GridView1.Rows.Count + "</b> Records found.</p>";
                ExportToExcel.Visible = true;
            }

            //  HttpContext.Current.Response.Write(GridView1.Rows.Count + " Records found");
            //GridView1.DataSource = Dt;
            //GridView1.DataBind();
            //ExportToExcel.Visible = true;

        }
        protected void OnPageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            //GridView1.PageIndex = e.NewPageIndex;
            //GridView1.DataBind();
        }
        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string from = TextBox1.Text.ToString();
            string to = TextBox2.Text.ToString();

            DateTime fromdate = Convert.ToDateTime(from);
            DateTime todate = Convert.ToDateTime(to);

            if (todate <= fromdate)
            {

                Label5.Visible = true;

            }
            else
            {
                Label5.Visible = false;
            }
        }
        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            string from = TextBox1.Text.ToString();
            string to = TextBox2.Text.ToString();

            DateTime fromdate = Convert.ToDateTime(from);
            DateTime todate = Convert.ToDateTime(to);

            if (todate >= DateTime.Today || todate <= fromdate)
            {

                Label5.Visible = true;
                DateTime dat = DateTime.Today;
                dat = dat.AddDays(-1);
                TextBox2.Text = dat.ToString("D");

            }
            else
            {
                Label5.Visible = false;
            }


            DateTime date = DateTime.Today;




            //Label3.Visible = false;

            //GridView1.DataSource = null;
            //GridView1.DataBind();
        }
    }
}