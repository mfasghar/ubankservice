using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Security;
using System.Net;
using System.Net.Sockets;
using System.Drawing;
using System.Diagnostics;

namespace ubank
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {







            Page.Header.DataBind();    
            string CheckSession = string.Empty;
            string ComputerName = null;
            string host;
            string ClientIP = null;
            string ClientHostName = null;
            string frstAddress = null;
            if (Session["LoginSession"] == null)
            {
                Label1.Text = "Login :: Guest Account";
                Label1.ForeColor = Color.DarkRed;
                //Exit Sub
            }
            else
            {
                Label1.Text = "Login :: " + (string)Session["LoginSession"].ToString();
                Label1.ForeColor = Color.Blue;
            }


            ComputerName = Dns.GetHostName();
            // Then using host name, get the IP address list..
            IPHostEntry ipEntry = Dns.GetHostByName(ComputerName);
            //Get the IP address
            IPAddress[] addr = ipEntry.AddressList;

            for (int i = 0; i < addr.Length; i++)
            {
                ClientIP += " ( " + i + ") " + addr[i].ToString();
            }

            string IPAddressClient = ""; 
            IPHostEntry hostAsif;
            hostAsif = Dns.GetHostEntry(Dns.GetHostName());
            foreach (IPAddress ip in hostAsif.AddressList)
            {
                if (ip.AddressFamily.ToString() == "InterNetwork")
                {
                    IPAddressClient = ip.ToString();
                }
            }




            //Request.Browser.Browser.ToString() computer name
            //addr[0].ToString()
            //System.Net.Dns.GetHostByName(Environment.MachineName).AddressList[0].ToString()
            lblComputerName.Text = System.Web.HttpContext.Current.User.Identity.Name.ToString() + " - " + ComputerName + " - " + IPAddressClient; ; //Page.User.Identity.Name;//GetCurrentUserWindowsLogin()  + HttpContext.Current.User.Identity; // +Request.ServerVariables["HTTP_X_FORWARDED_FOR"].ToString();//+ Request.ServerVariables["HTTP_CLIENT_IP"].ToString() ;


            if (IsPostBack)
            {




                //ClientHostName
                //if (Session["LoginSession"] == null || Session["LoginSession"] == "")
                //{
                //    Label1.Text = "Login :: Guest Account";
                //    Label1.ForeColor = Color.DarkRed; 
                //    //Exit Sub
                //}
                //else
                //{
                //    Label1.Text = "Login :: " + (string)Session["LoginSession"].ToString();
                //    Label1.ForeColor = Color.Blue;


                //}

                //CheckSession = Session["LoginSession"].ToString();
                ////If IsNumeric(Session.Item("LoginSession")) Or Session.Item("LoginSession") = "" Then
                //if (CheckSession == null || CheckSession == "")
                //{
                //    Label1.Text = "Login :: Guest Account";
                //    Label1.ForeColor = Color.DarkRed;
                //}
                //else
                //{
                //    Label1.Text = "Login :: " + Session["LoginSession"].ToString();
                //    Label1.ForeColor = Color.Blue;
                //    //Exit Sub
                //}

                SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());

                try
                {
                    if (Conn.State == ConnectionState.Closed)
                    {
                        Conn.Open();
                    }
                    string exp = null;
                    exp = Request.Browser.Browser;



                    HttpBrowserCapabilities bc = HttpContext.Current.Request.Browser;

                    //string UserAgent = HttpContext.Current.Request.UserAgent;

                    //    IPAddress = HttpContext.Current.Request.UserHostAddress,
                    //    Browser = bc.Browser + " " + bc.Version,
                    //    DateStamp = DateTime.Now,
                    //    PageViewed = HttpContext.Current.Request.Url.AbsolutePath,
                    //    NodeId = UmbracoHelper.GetCurrentNodeID(),
                    //    IsMobileDevice = IsMobileDevice(UserAgent),
                    //    Platform = bc.Platform



                    //Request.ServerVariables("HTTP_CLIENT_IP")
                    SqlCommand cmdInsertRec = new SqlCommand("INSERT INTO WebAccessStatus ( LoginAtWeb,WorkstationName, IP, WebAccessDate, ClientBrowser,WindowsLogin,OSNameAndVer) VALUES     ('" + Label1.Text + "','" + ComputerName + "','" + ClientIP + "','" + DateTime.Now.ToString() + "','" + Request.Browser.Browser.ToString() + "','" + Environment.UserName + "','" + bc.Platform + "')", Conn);
                    cmdInsertRec.ExecuteNonQuery();
                    cmdInsertRec.Dispose();

                    if (Conn.State == ConnectionState.Open)
                    {
                        Conn.Close();
                    }
                    cmdInsertRec.Dispose();

                }

                catch (Exception ex)
                {
                    if (Conn.State == ConnectionState.Open)
                    {
                        Conn.Close();
                    }
                }
            }




        }


        SqlConnection SqlConnection1 = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());


        //        protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
        //        {



        //        }

        public string DBConnection(string strUserName, string strPassword)
        {
            string functionReturnValue = null;
            string strUserNameglob = null;
            string intStatus = null;


            try
            {
                if (SqlConnection1.State == ConnectionState.Closed)
                {
                    SqlConnection1.Open();
                }


                Class1 objGlobalASA = new Class1();
                SqlCommand MyCmd = new SqlCommand("SELECT * FROM UserManager where userid ='" + strUserName + "' and password = '" + strPassword.ToString() + "'", SqlConnection1);
                SqlDataAdapter MyAdp = new SqlDataAdapter(MyCmd);
                DataSet MyDS = new DataSet();


                MyAdp.Fill(MyDS);

                if (MyDS.Tables[0].Rows.Count > 0)
                {


                    if (MyDS.Tables[0].Rows[0]["UserID"].ToString() == strUserName)
                    {

                    }
                    else
                    {
                        intStatus = "101";
                        lblMessage.Text = "Invalid Userid";

                    }


                    if (Convert.ToString(objGlobalASA.CheckUserIDRights(strUserName, "Password")) == strPassword.ToString())
                    {

                    }
                    else
                    {
                        intStatus = "100";
                        lblMessage.Text = "Invalid password";


                    }



                    if (MyDS.Tables[0].Rows[0]["userid"].ToString() == strUserName.ToString() && strPassword.ToString() == objGlobalASA.CheckUserIDRights(strUserName, "Password").ToString())
                    {

                        if ((MyDS.Tables[0].Rows[0]["UserName"].ToString().Length) > 0)
                        {
                            strUserNameglob = MyDS.Tables[0].Rows[0]["UserName"].ToString();
                        }
                        else
                        {
                            strUserNameglob = MyDS.Tables[0].Rows[0]["userid"].ToString();
                        }

                        Session["LoginSession"] = strUserNameglob;
                        Session["UserID"] = strUserName;
                        Session["DivisionID"] = MyDS.Tables[0].Rows[0]["DivisionID"].ToString();
                        Session["LevelID"] = MyDS.Tables[0].Rows[0]["LevelID"].ToString();
                        Session["OrgID"] = MyDS.Tables[0].Rows[0]["OrgID"].ToString();
                        intStatus = "111";
                        functionReturnValue = "111";

                        if (Session["LoginSession"] == null || Session["LoginSession"] == "")
                        {
                            Label1.Text = "Login :: Guest Account";
                            Label1.ForeColor = Color.DarkRed;
                            //Exit Sub
                        }
                        else
                        {
                            Label1.Text = "Login :: " + (string)Session["LoginSession"].ToString();
                            Label1.ForeColor = Color.Blue;


                        }
                    }

                }
                else
                {
                    //000 = Record Not Found
                    intStatus = "000";
                }

                if (SqlConnection1.State == ConnectionState.Open)
                {
                    SqlConnection1.Close();
                }


            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error Connecting to Database!   .... " + ex.Message;

                if (SqlConnection1.State == ConnectionState.Open)
                {
                    SqlConnection1.Close();
                }

            }

            if (SqlConnection1.State == ConnectionState.Open)
            {
                SqlConnection1.Close();
            }
            return functionReturnValue;

        }

        public void setTitle(string truee)
        {
            this.logout.Visible = false;
        }

        protected void cmdSubmit_Click(object sender, ImageClickEventArgs e)
        {
            {
                Session["LoginSession"] = string.Empty;
                Session["UserID"] = string.Empty;
                string tempUserID = null;
                string tempUserpass = null;
                Class1 objGloble = new Class1();

                tempUserID = this.txtUserName.Text;
                tempUserpass = this.txtPassword.Text;

                txtPassword.Text = "";
                txtUserName.Text = "";


                if (Page.IsValid)
                {
                    //   ||||| Meaning the Control Validation was successful!
                    //   |||||   Connect to Database for User Validation |||||

                    if (SqlConnection1.State == ConnectionState.Closed)
                    {
                        SqlConnection1.Open();
                    }


                    if (tempUserID != objGloble.CheckUserIDRights(tempUserID, "UserID"))
                    {
                        lblMessage.Text = "User not found in database ";
                        Session["ErrDes"] = "User not found in database ";
                        Response.Redirect("blankpg.aspx");
                        return;
                    }

                    if (objGloble.CheckUserIDRights(tempUserID, "UserBlocked") == "Nothing" | objGloble.CheckUserIDRights(tempUserID, "UserBlocked") == "True")
                    {
                        lblMessage.Text = "Please contact with your WEB Administrator Your Account has been blocked";
                        Session["ErrDes"] = "Please contact with your Administrator your account has been blocked";
                        Response.Redirect("blankpg.aspx");
                        return;
                    }

                    if (objGloble.CheckUserIDRights(tempUserID, "AccountDisabled") == "Nothing" | objGloble.CheckUserIDRights(tempUserID, "AccountDisabled") == "True")
                    {
                        lblMessage.Text = "Please contact with your Administrator your account has been Disabled";
                        Session["ErrDes"] = "Please contact with your Administrator your account has been Disabled";
                        Response.Redirect("blankpg.aspx");
                        return;
                    }


                    //objGlobalASA.CheckUserIDRights(Trim(lblUserID.Text), "Password"))



                    if (DBConnection(tempUserID, tempUserpass) == "111")
                    {

                        txtPassword.Text = "";
                        txtUserName.Text = "";

                        //cookies
                        Response.Cookies.Add(new HttpCookie("DMSUserName", tempUserID));
                        Response.Cookies["DMSUserName"].Expires = DateTime.Now.Date.AddDays(2);

                        //FormsAuthentication.RedirectFromLoginPage(tempUserID, false);
                        //   |||||   defaultk8.aspx Page!

                        Response.Redirect("main2.aspx", false);

                    }
                    else
                    {
                        //   |||||   Credentials are Invalid
                        //   |||||   Increment the LoginCount (attempts)
                        Session["LoginCount"] = Convert.ToInt32(Session["LoginCount"]) + 1;
                        // ||||| Determine the Number of Tries

                        if (Convert.ToInt16(Session["LoginCount"]) >= 3)
                        {
                            string intValue = null;
                            intValue = objGloble.CheckUserIDRightsForIT(tempUserID, "Admin");

                            if (intValue == "False")
                            {
                                objGloble.BlockUser(tempUserID);
                                Session["ErrDes"] = "Account is blocked, You are not authorized to login at SME-DMS, please contact with Administrator ";
                                Response.Redirect("blankpg.aspx");
                                Session.Abandon();
                            }

                        }

                        Session["ErrDes"] = "Invalid Login!";
                        Response.Redirect("blankpg.aspx");
                        lblMessage.Text = "Invalid Login!";



                    }
                }

            }


        }

        public string GetCurrentUserWindowsLogin()
        {

            string windowsLogin = Page.User.Identity.Name;
            //Normally if the domain is present you get a string like DOMAINNAME\username, remove the domain
            int hasDomain = windowsLogin.IndexOf(@"\");
            if (hasDomain > 0)
            {
                windowsLogin = windowsLogin.Remove(0, hasDomain + 1);
            } //end if 
            return windowsLogin;
        } //end GetCurrentUserWindowsLogin
    }
}
