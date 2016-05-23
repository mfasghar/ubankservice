using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

namespace ubank
{
    public class Class1
    {
        public string CheckUserIDRights(string strUserID, string strFields)
        {
            
           
            string functionReturnValue = null;
            SqlConnection Conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["strConn"].ToString());
            try
            {
                if (Conn.State == ConnectionState.Closed)
                {
                    Conn.Open();
                }

                //Dim MyCmd As New SqlCommand("SELECT * FROM UserManager where userid ='" & strUserID & "' ", Conn)
                SqlCommand MyCmd = new SqlCommand("SELECT * FROM UserManager where userid ='" + strUserID + "'", Conn);
                SqlDataAdapter MyAdp = new SqlDataAdapter(MyCmd);
                DataSet MyDS = new DataSet();
                MyAdp.Fill(MyDS);

                if (MyDS.Tables[0].Rows.Count > 0)
                {

                    if (MyDS.Tables[0].Rows[0].IsNull(strFields))
                    {

                        functionReturnValue = (MyDS.Tables[0].Rows[0].IsNull(strFields) ? "Nothing" : MyDS.Tables[0].Rows[0][strFields].ToString());
                    }
                    else
                    {
                        functionReturnValue = ((Convert.ToString(MyDS.Tables[0].Rows[0][strFields.ToString()]) == null) ? "Nothing" : Convert.ToString(MyDS.Tables[0].Rows[0][strFields.ToString()]));
                    }
                }
            }
            catch (Exception e)
            {
                functionReturnValue = e.Message;
                if (Conn.State == ConnectionState.Open)
                {
                    Conn.Close();
                }
            }
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
            }
            return functionReturnValue;

        }

        public string CheckUserIDRightsForIT(string strUserID, string strFields)
        {
            string functionReturnValue = null;
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
            //Dim intStatus As String
            string strQuery = null;

            try
            {
                if (Conn.State == ConnectionState.Closed)
                {
                    Conn.Open();
                }

                //Dim MyCmd As New SqlCommand("SELECT * FROM UserManager where userid ='" & strUserID & "' ", Conn)
                strQuery = "";
                strQuery = " SELECT     UserManager.UserID, UserManager.UserName, UserManager.Password, UserManager.Description, UserManager.Admin, UserManager.Employee_id,  UserManager.RoleId, UserManager.RoleOveride, UserManager.PasswordExpireDate, UserManager.PasswordExpire, UserManager.LoginTimeFrom,   UserManager.LoginTimeTo, UserManager.AccountDisabled, UserManager.LeaveSpecialApproval, UserManager.IdentiyHRAndMIS, UserManager.PhoneNo, UserManager.UserBlocked, UserManager.OfficeID, UserManager.Password1, UserManager.LocationID, RefLocation.LocationDes, UserManager.OrgEmail, UserManager.OtherEmialAddress, UserManager.MgrEmailaddress, UserManager.SendEmail,CCEmail,   tbl_Offices.OfficeID, tbl_Offices.Officename, tbl_Offices.Address, tbl_Offices.Phone, tbl_Offices.PIBASOfficeCode,RefLocation.PersonA, RefLocation.PersonAEmail,   tbl_Offices.PIBASOfficeDes  FROM         UserManager INNER JOIN tbl_Offices ON UserManager.OfficeID = tbl_Offices.OfficeID INNER JOIN  RefLocation ON UserManager.LocationID = RefLocation.LocationID  Where UserManager.userid ='" + strUserID + "'";

                SqlCommand MyCmd = new SqlCommand(strQuery, Conn);
                SqlDataAdapter MyAdp = new SqlDataAdapter(MyCmd);
                DataSet MyDS = new DataSet();
                MyAdp.Fill(MyDS);


                if (MyDS.Tables[0].Rows.Count > 0)
                {
                    if (MyDS.Tables[0].Rows[0].IsNull(strFields.ToString()))
                    {

                        functionReturnValue = (MyDS.Tables[0].Rows[0].IsNull(strFields.ToString()) ? "Nothing" : MyDS.Tables[0].Rows[0][strFields.ToString()]).ToString();
                    }
                    else
                    {
                        functionReturnValue = ((Convert.ToString(MyDS.Tables[0].Rows[0][strFields.ToString()]) == null) ? "Nothing" : Convert.ToString(MyDS.Tables[0].Rows[0][strFields.ToString()]));
                    }
                }

            }
            catch (Exception e)
            {
                functionReturnValue = strFields.ToString() + " Error:-" + e.Message;
                if (Conn.State == ConnectionState.Open)
                {
                    Conn.Close();
                }
            }
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
            }
            return functionReturnValue;
        }

        public void BlockUser(string userid)
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
            if (Conn.State == ConnectionState.Closed)
            {
                Conn.Open();
            }

            SqlCommand cmdUpdateRec = new SqlCommand("UPDATE  UserManager SET  UserBlocked  = 1 WHERE (UserID = '" + userid.Trim().ToString() + "' )", Conn);
            cmdUpdateRec.ExecuteNonQuery();

            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
            }
        }
        public string UnBlockUser(string userid)
        {
            string functionReturnValue = null;
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
            try
            {
                if (Conn.State == ConnectionState.Closed)
                {
                    Conn.Open();
                }
                SqlCommand cmdUpdateRec = new SqlCommand("UPDATE  UserManager SET  UserBlocked  = 0 WHERE (UserID = '" + userid.Trim().ToString()+ "' )", Conn);
                cmdUpdateRec.ExecuteNonQuery();
                functionReturnValue = "Un-Blocked Successfuly";
            }
            catch (Exception e)
            {
                functionReturnValue = e.Message.ToString();
                if (Conn.State == ConnectionState.Open)
                {
                    Conn.Close();
                }
            }
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
            }
            return functionReturnValue;
        }


        public string getAnyFieldFromView(string strUserID, string strFields)
        {
            string  functionReturnValue = null;
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());

            // Dim intStatus As String

            try
            {
                if (Conn.State == ConnectionState.Closed)
                {
                    Conn.Open();
                }

                //Dim MyCmd As New SqlCommand("SELECT * FROM UserManager where userid ='" & strUserID & "' ", Conn)

                SqlCommand MyCmd = new SqlCommand("SELECT     *  FROM         UserManager INNER JOIN   RefLocation ON UserManager.LocationID = RefLocation.LocationID where userid ='" + strUserID + "'", Conn);
                SqlDataAdapter MyAdp = new SqlDataAdapter(MyCmd);
                DataSet MyDS = new DataSet();
                MyAdp.Fill(MyDS);

                if (MyDS.Tables[0].Rows.Count > 0)
                {
                    //if (Convert.ToString(MyDS.Tables[0].Rows[0][strFields.ToString()]).Length > 0 )
                    //{
                        functionReturnValue = MyDS.Tables[0].Rows[0].IsNull(strFields.ToString()) ? "Nothing" : MyDS.Tables[0].Rows[0][strFields].ToString();
                    //}
                    //else
                    //{
                    //    functionReturnValue = ((Convert.ToString(MyDS.Tables[0].Rows[0][strFields.ToString()]) == null) ? "Nothing" : Convert.ToString(MyDS.Tables[0].Rows[0][strFields.ToString()]));
                    //}
                }
            }
            catch (Exception e)
            {
                functionReturnValue = e.Message;
                if (Conn.State == ConnectionState.Open)
                {
                    Conn.Close();
                }
            }
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
            }
            return functionReturnValue;

        }

        public bool checkOneLevelComplete(Int32 AppNum, Int32 LevelID)
        {
            string  strQuery = null;
            strQuery = "SELECT     COUNT(AppID) AS TotalUnsupervised FROM ListoFpendingApps WHERE     (AppID =" + AppNum + ") AND (LevelID =" + LevelID + ") AND (IsSupervised = 0)";
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
            if (Conn.State == ConnectionState.Closed)
            {
                Conn.Open();
            }

            SqlCommand MyCmd = new SqlCommand(strQuery, Conn);
            SqlDataAdapter MyAdp = new SqlDataAdapter(MyCmd);
            DataSet MyDS = new DataSet();
            MyAdp.Fill(MyDS);
            if (Convert.ToInt32(MyDS.Tables[0].Rows[0][0]) > 0)
            { 
                return  false ;

            }else
            {
                return  true;
            }

        }
        public bool CheckRightsForAll(string UserId, string FormName, Int16 RightID)
        {
            bool functionReturnValue = false;
            string strQuery = null;
            strQuery = " SELECT  UserManager.UserID, UserManager.UserName, FormRights.FormName, FormRights.RightID, RefRights.RightDes, FormRights.Granted FROM   UserManager INNER JOIN  FormRights ON UserManager.UserID = FormRights.UserID INNER JOIN  FormNames ON FormRights.FormName = FormNames.FormName AND FormRights.RightID = FormNames.RightID INNER JOIN  RefRights ON FormNames.RightID = RefRights.RightID  WHERE     (UserManager.UserID = '" + UserId.Trim().ToString() + "') AND (FormRights.FormName = '" + FormName.Trim().ToString() + "') AND (FormRights.RightID = " + RightID + ")";

            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
            //Dim intStatus As String
            if (Conn.State == ConnectionState.Closed)
            {
                Conn.Open();
            }
            //Dim MyCmd As New SqlCommand("SELECT * FROM UserManager where userid ='" & strUserID & "' ", Conn)
            SqlCommand MyCmd = new SqlCommand(strQuery, Conn);
            SqlDataAdapter MyAdp = new SqlDataAdapter(MyCmd);
            DataSet MyDS = new DataSet();
            MyAdp.Fill(MyDS);

            if (MyDS.Tables[0].Rows.Count > 0)
            {
                if (MyDS.Tables[0].Rows[0].IsNull("Granted"))
                {
                    functionReturnValue =(Convert.ToString(MyDS.Tables[0].Rows[0]["Granted"])==null) ? false :Convert.ToBoolean(MyDS.Tables[0].Rows[0]["Granted"]);
                }
                else
                {
                    functionReturnValue = ((Convert.ToString(MyDS.Tables[0].Rows[0]["Granted"]) == null) ? false : Convert.ToBoolean(MyDS.Tables[0].Rows[0]["Granted"]));
                }
            }
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
            }
            return functionReturnValue;
        }

        public bool checkIsLastSupervisor(Int32 AppNum)
        {
            string strQuery = null;
            strQuery = "SELECT TotalUnsupervised FROM  vAppUnSupCount WHERE (AppID =" + AppNum + ")";
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
            if (Conn.State == ConnectionState.Closed)
            {
                Conn.Open();
            }

            SqlCommand MyCmd = new SqlCommand(strQuery, Conn);
            SqlDataAdapter MyAdp = new SqlDataAdapter(MyCmd);
            DataSet MyDS = new DataSet();
            MyAdp.Fill(MyDS);
                if (MyDS.Tables[0].Rows.Count == 0)
                {
                    return true;
                }
            
                else {return false;}

        }

        public string AnyFieldFromFormType(Int32 FormTypeID, string strFields)
        {
            string functionReturnValue = null;
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());

            // Dim intStatus As String

            try
            {
                if (Conn.State == ConnectionState.Closed)
                {
                    Conn.Open();
                }

                
                SqlCommand MyCmd = new SqlCommand("SELECT  UserRequestTypeID, UserRequestType, IsUserRequestTypeActive, IsLimitsRequired, IsUserNameRequired  FROM RefUserRequestType where UserRequestTypeID =" + FormTypeID , Conn);
                SqlDataAdapter MyAdp = new SqlDataAdapter(MyCmd);
                DataSet MyDS = new DataSet();
                MyAdp.Fill(MyDS);

                if (MyDS.Tables[0].Rows.Count > 0)
                {
                    if (Convert.ToBoolean(MyDS.Tables[0].Rows[0][strFields.ToString()]))
                    {
                        functionReturnValue = MyDS.Tables[0].Rows[0].IsNull(strFields.ToString()) ? "Nothing" : MyDS.Tables[0].Rows[0][strFields].ToString();
                    }
                    else
                    {
                        functionReturnValue = ((Convert.ToString(MyDS.Tables[0].Rows[0][strFields.ToString()]) == null) ? "Nothing" : Convert.ToString(MyDS.Tables[0].Rows[0][strFields.ToString()]));
                    }
                }
            }
            catch (Exception e)
            {
                functionReturnValue = e.Message;
                if (Conn.State == ConnectionState.Open)
                {
                    Conn.Close();
                }
            }
            if (Conn.State == ConnectionState.Open)
            {
                Conn.Close();
            }
            return functionReturnValue;
        }


        public Boolean SendEmail(string FromEmail, String ToEmail, String CCEmail,string EmailSubject, string EmailBody)
        { 
        try 
        {
            using (MailMessage message = new MailMessage())
            {
                message.From = new MailAddress(FromEmail);
                message.To.Add(new MailAddress(ToEmail));
                if (CCEmail != "")
                {
                    message.CC.Add(new MailAddress(CCEmail));
                }
                message.Subject = EmailSubject  ;
                message.Body = EmailBody;
                SmtpClient client = new SmtpClient();
                client.Host = ConfigurationManager.AppSettings["smtpServer"].ToString();
                client.Send(message);
                return true;
            }
        }
        catch 
        {
            return  false;
        }
        }

        public string getEmailAgainst(Int64 AppID)
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());

            if (Conn.State == ConnectionState.Closed)
            {
                Conn.Open();
            }
            string emailList="";

            SqlCommand MyCmd = new SqlCommand("SELECT  AppID, UserID, LevelID, UserName, OrgEmail, SendEmail  FROM   vEmailListForFirstLevel where appid =" + AppID, Conn);
            //SqlDataAdapter MyAdp = new SqlDataAdapter(MyCmd);
            SqlDataReader  reader ;
            reader = MyCmd.ExecuteReader();
            //DataSet MyDS = new DataSet();
            //MyAdp.Fill(MyDS);
            if (reader.HasRows) 
            {

                     while (reader.Read())
                    {
                        if (!reader.IsDBNull(0)) 
                        {
                            emailList = emailList + (emailList.Length <= 0 ? "" : ";") + Convert.ToString(reader["OrgEmail"]);
                        }
                    }

            }

            return emailList;
        }
    }
    


}