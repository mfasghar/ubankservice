using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ubank.Manager;
using System.Data;
using System.IO;
using System.Drawing;
using System.Configuration;

namespace ubank
{
    public partial class sybasereversals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string SQLQuery;

            if (!IsPostBack)
            {
                TextBox1.Text =  DateTime.Today.ToString("dd-MMM-yyyy");
            }

            SQLQuery = @"SELECT * FROM pbxhbl.REVERSAL_STATUS rs
            inner join cmsuser.VIEW_TRANSACTION_REPORT vr on rs.ID_TXN=vr.TID
            inner join cmsuser.VIEW_TRANSACTION_REPORT vrr on rs.ID_REVERSED_TXN=vrr.TID
            WHERE ID_REVERSED_TXN   in (
            SELECT ID_TXN FROM pbxhbl.HBL_TRANSACTIONS hbl
            WHERE hbl.ID_USE_CASE = 9174 and hbl.DAT_CREATION > '" + TextBox1.Text +   @"'
            )";

            DataTable dt = Connections.GetFromDB(SQLQuery);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

           
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }

        protected void ExportToExcel_Click(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count <= 0 ) 
            {
            return;
            }
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.xls");
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