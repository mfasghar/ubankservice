using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using CrystalDecisions.Shared;
using CrystalDecisions.CrystalReports.Engine;
using System.IO;
namespace ubank
{
    public partial class rep_DepositSummary : System.Web.UI.Page
    {
        CrystalReport1 rd = new CrystalReport1();
            
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack == false)
            {
                txtDateFrom.Text = DateTime.Now.AddDays(-3).ToString("dd-MMM-yyyy");
                txtDateTo.Text = DateTime.Now.ToString("dd-MMM-yyyy");
                CrystalReportViewer1.Zoom(Convert.ToInt16(ConfigurationManager.AppSettings["ReportZoom"]));

            }

             //conne.ServerName = ConfigurationManager.AppSettings["ServerName"];
             //   conne.DatabaseName = ConfigurationManager.AppSettings["DatabaseName"];
             //   conne.UserID = ConfigurationManager.AppSettings["UserID"];
             //   conne.Password = "Ubank@321";//ConfigurationManager.AppSettings["Password"];


                
                ConnectionInfo conne = new ConnectionInfo();


                conne.ServerName = ConfigurationManager.AppSettings["ServerName"].ToString();
                conne.DatabaseName = ConfigurationManager.AppSettings["DatabaseName"].ToString();
                conne.UserID = ConfigurationManager.AppSettings["UserID"].ToString();
                conne.Password = ConfigurationManager.AppSettings["Password"].ToString();


                TableLogOnInfo tablelogs = new TableLogOnInfo();

                Database db=rd.Database;
                Tables tbls=db.Tables;

                foreach(CrystalDecisions.CrystalReports.Engine.Table tab in tbls)
                {
                tablelogs = tab.LogOnInfo;
                tablelogs.ConnectionInfo = conne;
                tab.ApplyLogOnInfo(tablelogs);
                tab.Location = ConfigurationManager.AppSettings["DatabaseName"] + ".dbo." + tab.Name; //most important line whole report is depend on this line
                }

                CrystalReportViewer1.ReportSource = rd;
                
                CrystalReportViewer1.SelectionFormula = "{Rep_SummaryOfDeposit.TranDate} >= cdate('" + txtDateFrom.Text + "') and {Rep_SummaryOfDeposit.TranDate} <=cdate('" + txtDateTo.Text + "')";            
                CrystalReportViewer1.RefreshReport();
            }

            
        

        protected void Button1_Click(object sender, EventArgs e)
        {
           

        //    //CrystalReportViewer1.SelectionFormula = "{Rep_SummaryOfDeposit.TranDate} >=cdate('" + txtDateFrom.Text + "') and {Rep_SummaryOfDeposit.TranDate}  <=cdate('" + txtDateTo.Text + "')"; 
          CrystalReportViewer1.RefreshReport(); 


        }

        protected override void OnUnload(EventArgs e)
        {
            base.OnUnload(e);



            rd.Close();
            rd.Dispose();
            GC.Collect();
            // your code
        }

     
    }
}