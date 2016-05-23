using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Net;
using System.Net.Mail;

namespace ubank
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            lvTweets.DataBind();

        }

         protected string FormatSummary(string summary)
    {
        const string SummaryHeader = "News : ";

        //Remove the leading "ScottOnWriting: "
        if( summary.StartsWith(SummaryHeader)) 
        {
            return  summary.Substring(SummaryHeader.Length);
        }
        return summary;
             
        }

        protected string FormatPubDate(DateTime pubDate) 
        {
            return pubDate.ToString("MMM d");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Class1 abc = new Class1();
           Class1 forEamilList = new Class1();
          string toemailadd = Convert.ToString( forEamilList.getEmailAgainst(97));


           string strRequestType = "New ID Creation";

           string emailbody;
           emailbody = "This is an auto generated email to inform you that request for " + strRequestType + " has been generated with TID " + 97 + ",\n";
           emailbody += "you are requested to click on following ling to approve/reject the request.";
           emailbody += "\n\nhttp://172.24.1.74:8080/";
           emailbody += "\n\n\nRegards";

           Boolean IsEmailSent;
           Class1 forsendemail = new Class1();
           IsEmailSent = forsendemail.SendEmail(System.Configuration.ConfigurationManager.AppSettings["FromEmailAddress"], toemailadd, "", "Request for " + strRequestType, emailbody);
           Response.Write(IsEmailSent);

        }

       

        
    }
}
