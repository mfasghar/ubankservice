using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace ubank
{
    public class ExportExcel
    {

        public static void ExportExcelFile(string fileName, DataTable dataSource)
        {
            System.Web.UI.WebControls.GridView dgExport = null;
            System.Web.HttpContext curContext = System.Web.HttpContext.Current;
            //IO is used to export and return Excel
            System.IO.StringWriter strWriter = null;
            System.Web.UI.HtmlTextWriter htmlWriter = null;

            if (dataSource != null)
            {
                //Set encoding and attachment format                
                curContext.Response.Clear();
                curContext.Response.Buffer = true;
                //System.Web.HttpUtility.UrlEncode(FileName, System.Text.Encoding.UTF8) 

                //Note: The above code line is used to avoid unreadable code to appearing in file.

                curContext.Response.AddHeader("content-disposition", "attachment; filename=" + System.Web.HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8) + ".xls");
                curContext.Response.ContentType = "application/vnd.ms-excel";
                //Avoid unreadable code to appearing in contents exported.
                curContext.Response.Write("<meta http-equiv=Content-Type content=text/html;charset=UTF-8>");
                //Export to Excel
                strWriter = new System.IO.StringWriter();
                htmlWriter = new System.Web.UI.HtmlTextWriter(strWriter);
                //Redefine one GridView without paging to solve the problem that there is paging in daData.
                dgExport = new System.Web.UI.WebControls.GridView();
                dgExport.DataSource = dataSource;
                dgExport.AllowPaging = false;
                dgExport.DataBind();
                //Download to server.
                dgExport.RenderControl(htmlWriter);
                curContext.Response.Write(strWriter.ToString());
                curContext.Response.End();
            }
        }

    }
}





   
