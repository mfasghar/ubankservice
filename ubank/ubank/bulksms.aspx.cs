using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ubank.net.ufonegsm.esb;
using System.Data.SqlClient;
using ubank;
namespace WebApplication1

{
    public partial class bulkSMS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //lblServerTime.Text = DateTime.Now.ToString("D");

            if (Session["LoginSession"] == null || Session["LoginSession"] == "")
            {
                Response.Redirect("sessexp.aspx", false);
                return;
            }


            Boolean strValue;
            string struserid = Session["UserID"].ToString();
            string strFileName = Path.GetFileName(Request.PhysicalPath); //idrequestaddView.aspx
            ubank.Class1 objGlobalASA = new Class1();


            strValue = objGlobalASA.CheckRightsForAll(struserid, strFileName, 16);

            if (strValue != true)
            {

                Session["ErrDes"] = "";
                Session["ErrDes"] = "You don’t have Privileges. Please contact with Web Administrator";
                Response.Redirect("blankpg.aspx");

            }

        }

        public static String Sendsms(string Msisdn, string body)
        {
            try
            {
                SMS_SEND abc = new SMS_SEND();
                string outresult = "";
                //  Msisdn = Msisdn.Replace("92","0").Replace("+","");
                //  abc.ConnectionGroupName = "my con";
                System.Net.ServicePointManager.ServerCertificateValidationCallback = delegate { return true; };
                string result = abc.SendSms("3737", Msisdn, body, "UBANK_SMS", "ufone@2288", out outresult);
                return result;

            }
            catch (Exception ex)
            {
                return ex.ToString();

            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string query;
            query = "";
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["strConn"].ToString());
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            if (con.State == ConnectionState.Closed) { con.Open();  }

           
            DataTable dt = new DataTable();
            dt.Clear();
            dt.Columns.Add("Msisdn");
            dt.Columns.Add("Message");
            dt.Columns.Add("Status");
            if (FileUpload1.HasFile && Path.GetExtension(FileUpload1.FileName) == ".csv" || Path.GetExtension(FileUpload1.FileName) == ".xlsx")
            {
                //Label1.Text = "done" + Path.GetFileName(FileUpload1.FileName);
                StreamReader csvreader = new StreamReader(FileUpload1.PostedFile.InputStream);

                while (!csvreader.EndOfStream)
                {
                    
                    var line = csvreader.ReadLine();
                    String[] values = line.Split(',');
                    // Label1.Text += values[0];
                    // Label1.Text += values[1];

                    String result = Sendsms(values[0], values[1]);
                    //   Label1.Text += result+"\n";
                    values[1].Replace("'", " ");
                    values[1].Replace(",", " ");
                    values[1].Replace(";", " ");
                    DataRow _ravi = dt.NewRow();
                    _ravi["Msisdn"] = values[0];
                    _ravi["Message"] = values[1];
                    _ravi["Status"] = result;
                    int s ;
                    if (int.TryParse(result, out s))
                    {
                        // The string was a valid integer => use result here
                    }
                    else
                    {
                        result = "3";
                    }
                    
                    if (result == "0")
                    {
                        _ravi["Status"] = "Send";
                    }
                    if (result == "2")
                    {
                        _ravi["Status"] = "Wrong Msisdn";
                    }
                    if (result == "3")
                    {
                        _ravi["Status"] = "Authentication Problem";
                    }
                    dt.Rows.Add(_ravi);

                    query = "INSERT INTO SMSLog( UserId, Message, Msisdn, SMSDateTime, StatusID)  VALUES  ( '" + Session["UserID"].ToString() + "','" + values[1] + "','" + values[0] + "','" + DateTime.Now.ToString() + "'," + result + ")";
                   cmd.CommandText = query;
                    cmd.CommandType = CommandType.Text;
                    cmd.ExecuteNonQuery();
                }

                GridView1.DataSource = dt;
                GridView1.DataBind();


            }
            else
            {
                Label1.Text = "You did not specify a file to upload.";
            }
        }

    }
}
