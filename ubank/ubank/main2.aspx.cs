using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Sockets;
namespace ubank
{
    public partial class main2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginSession"] == null || Session["LoginSession"] == "")
            {
                Response.Redirect("sessexp.aspx", false);
                return;
            }

            string ComputerName = null;
            string host;
            string ClientIP = null;
            string ClientHostName = null;

            ComputerName = Dns.GetHostName();
            // Then using host name, get the IP address list..
            IPHostEntry ipEntry = Dns.GetHostByName(ComputerName);
            //Get the IP address
            IPAddress[] addr = ipEntry.AddressList;
            
            for (int i = 0; i < addr.Length; i++)
            {
                ClientIP += " ( " + i + ") " + addr[i].ToString();
            }

            //lblComputerName.Text = System.Web.HttpContext.Current.User.Identity.Name.ToString() + " - " + addr[0].ToString() + " - " + ComputerName + " - " + Request.Browser.Browser.ToString() + " - " + Environment.UserDomainName + "\\" + Environment.UserName; //Page.User.Identity.Name;//GetCurrentUserWindowsLogin()  + HttpContext.Current.User.Identity; // +Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();//+ Request.ServerVariables["HTTP_CLIENT_IP"].ToString() ;

             
            Label3.Text = "Dear " + Session["LoginSession"].ToString() + " you are currently logged on to Intranet Website ";
            lblComputerIP.Text = "Computer IPs  = [" + ClientIP + "]";
            lblComputerName.Text = "Computer Name = [" + ComputerName + "]";
            lblDomainLogin.Text = "Domain & Login = [" + Environment.UserDomainName + "\\" + Environment.UserName +"]";

        }

       

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("idrequestaddView.aspx");
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {
            Session.Abandon();
            Label label111 = (Label)Page.Master.FindControl("Label1");
            Response.Redirect("Logoffpg.aspx");
        }

  
    }
}