using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ubank
{
    public partial class addusers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            if (Session["LoginSession"] == null || Session["LoginSession"] == "")
            {
                Response.Redirect("sessexp.aspx", false);
                return;
            }


            string strValue;
            string struserid = Session["UserID"].ToString();
            string strFileName = Path.GetFileName(Request.PhysicalPath); //idrequestaddView.aspx
            Class1 objGlobalASA = new Class1();


            strValue = objGlobalASA.CheckUserIDRights(struserid, "Admin");

            if (strValue != "True")
            {

                Session["ErrDes"] = "";
                Session["ErrDes"] = "You don’t have Administrator Privileges. Please contact with Web Administrator";
                Response.Redirect("blankpg.aspx");

            }

            if (!IsPostBack)
            {

                LockControls();
                loadCombo();

            }
        }

        protected void cmdAdd_Click(object sender, EventArgs e)
        {
            string strValue = null;
            Class1 objGlobalASA = new Class1();
            string struserid = Session["UserID"].ToString();
            string strFileName = Path.GetFileName(Request.PhysicalPath); 
            strValue = objGlobalASA.CheckRightsForAll(struserid, strFileName, 2).ToString();
            if (strValue != "True")
            {
                Session["ErrDes"]= "";
                Session["ErrDes"] = "You don’t have Administrative Privileges. Please contact with Web Administrator";
                Response.Redirect("blankpg.aspx");
            }


            CheckAddEdit.Text = "Add New User";
            txtUserID.Text = "";
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtDescription.Text = "N/A";
            txtOrgEmail.Text = "";
            txtOtherEmialAddress.Text = "";
            txtMgrEmailaddress.Text = "";
            txtEmailCC.Text = "";
            txtPhoneNo.Text = "";

            cmdEdit.Enabled = false;
            cmdSave.Enabled = true;
            cmdAdd.Enabled = false;
            cmdLoad.Enabled = false;
            cmdLoadList.Enabled = false;
            cmdCancel.Enabled = true;
            unLockControls();
        }

        private void unLockControls()
        {
            txtUserName.Enabled = true;
            txtDescription.Enabled = true;
            txtPassword.Enabled = true;
            chkAccountDisabled.Enabled = true;
            chkAdmin.Enabled = true;
            chkPasswordExpire.Enabled = true;
            chkUserBlocked.Enabled = true;
            chkSendEmail.Enabled = true;
            chkUserOfActionRegister.Enabled = true;
            cmbOffice.Enabled = true;
            cmbUserCategory.Enabled = true;
            txtOrgEmail.Enabled = true;
            txtOtherEmialAddress.Enabled = true;
            txtMgrEmailaddress.Enabled = true;
            txtEmailCC.Enabled = true;
            txtPhoneNo.Enabled = true;

        }

        private void LockControls()
        {
            txtUserName.Enabled = false;
            txtDescription.Enabled = false;
            txtPassword.Enabled = false;
            chkAccountDisabled.Enabled = false;
            chkAdmin.Enabled = false;
            chkPasswordExpire.Enabled = false;
            chkUserBlocked.Enabled = false;
            chkSendEmail.Enabled = false;
            chkUserOfActionRegister.Enabled = false;
            cmbOffice.Enabled = false;
            cmbUserCategory.Enabled = false;


            txtOrgEmail.Enabled = false;
            txtOtherEmialAddress.Enabled = false;
            txtMgrEmailaddress.Enabled = false;
            txtEmailCC.Enabled = false;
            txtPhoneNo.Enabled = false;


        }

        protected void cmdEdit_Click(object sender, EventArgs e)
        {
            string strValue = null;
            Class1 objGlobalASA = new Class1();
            strValue = objGlobalASA.CheckRightsForAll(Session["UserID"].ToString(), Path.GetFileName(Request.PhysicalPath), 3).ToString();
            if (strValue != "True")
            {
                Session["ErrDes"] = "";
                Session["ErrDes"] = "You don’t have Administrative Privileges. Please contact with Web Administrator";
                Response.Redirect("blankpg.aspx");
            }

            

            CheckAddEdit.Text = "Edit User";
            cmdAdd.Enabled = false;
            cmdEdit.Enabled = false;
            cmdSave.Enabled = true;
            cmdLoad.Enabled = false;
            cmdLoadList.Enabled = false;
            cmdCancel.Enabled = true;

            unLockControls();
        }

        protected void cmdCancel_Click(object sender, EventArgs e)
        {
            txtUserID.Text = "";
            txtUserName.Text = "";
            txtPassword.Text = "";
            txtDescription.Text = "N/A";
            txtOrgEmail.Text = "";
            txtOtherEmialAddress.Text = "";
            txtMgrEmailaddress.Text = "";
            txtEmailCC.Text = "";
            txtPhoneNo.Text = "";

            CheckAddEdit.Text = "Add/Edit Users";
            lblmsg.Text = "To edit any user type user id  and press \"Load button\"";

            chkAccountDisabled.Checked = false;
            chkAdmin.Checked = false;
            chkPasswordExpire.Enabled = true;
            chkUserBlocked.Enabled = false;


            cmdSave.Enabled = false;
            cmdEdit.Enabled = false;
            cmdAdd.Enabled = true;
            cmdLoad.Enabled = true;
            cmdLoadList.Enabled = true;
            cmdCancel.Enabled = false;
            txtUserID.Text = "";
            txtUserID.Enabled = true;
            LockControls();
        }

        protected void cmdSave_Click(object sender, EventArgs e)
        {



            int lstrLocationID = 0;


            //try
            //{
                SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
                string strSQLquery = null;


                if (chkAdmin.Checked == true)
                {
                    SqlDataAdapter cdCheckIndatabase = new SqlDataAdapter("SELECT COUNT(*) NoOfAdmin FROM UserManage WHERE (Admin = 1)", Conn);
                    DataSet dsCheckInDatabase = new DataSet();
                    cdCheckIndatabase.Fill(dsCheckInDatabase, "UserManage");
                    //Response.Write(Convert.ToString(dsCheckInDatabase.Tables(0).Rows(0).Item(0)))
                    if (Convert.ToInt16(dsCheckInDatabase.Tables[0].Rows[0].ItemArray[0]) > 0)
                    {
                        lblmsg.Text = "Only one person can be administrator of this website please contact with administrator to change rights ";
                        chkAdmin.Checked = false;
                        return;
                    }
                }



                if (CheckAddEdit.Text == "Add New User")
                {
                    if (string.IsNullOrEmpty(txtUserID.Text))
                    {
                        lblmsg.Text = "Please enter User ID ";
                        setFocus(this.txtUserID);
                        return;
                    }

                    if (string.IsNullOrEmpty(txtUserName.Text))
                    {
                        lblmsg.Text = "Please enter User Name";
                        setFocus(this.txtUserName);
                        return;
                    }

                    if (chkSendEmail.Checked == true && txtMgrEmailaddress.Text.Length <= 1)
                    {
                        lblmsg.Text = "Please enter email address of manager if send email option is checked";
                        setFocus(this.txtMgrEmailaddress);
                        return;
                    }

                    if (string.IsNullOrEmpty(txtPassword.Text))
                    {
                        lblmsg.Text = "Please enter password";
                        setFocus(this.txtPassword);
                        return;
                    }

                    if (txtPassword.Text.Length <= 3)
                    {
                        lblmsg.Text = "Length of password can not be less than 3 Characters";
                        setFocus(txtPassword);
                        
                        return;
                    }

                    //If IsNumeric(left(cmbOffice.SelectedItem.Value,len(instr(cmbOffice.SelectedItem.Value,"-",CompareMethod.Text)) Then
                    //    strLocationID = cmbOffice.SelectedItem.Value
                    //    Response.Write(strLocationID)
                    //    Exit Sub
                    //End If

                    strSQLquery = "";
                    strSQLquery = "INSERT INTO UserManager " + "(UserID, UserName, Password, Description, Admin, PasswordExpire, AccountDisabled, UserBlocked, LocationID,OrgEmail,OtherEmialAddress, MgrEmailaddress,SendEmail,CCEmail,UserOfActionRegister,PhoneNo,UserCategoryCode)  " + " VALUES ('" + txtUserID.Text.Trim().ToString() + "','" + txtUserName.Text.Trim() + "','" + txtPassword.Text + "','" + (txtDescription.Text.Length <= 0 ? "N/A" : txtDescription.Text) + "'," + (chkAdmin.Checked == true ? 1 : 0) + "," + (chkPasswordExpire.Checked == true ? 1 : 0) + "," + (chkAccountDisabled.Checked == true ? 1 : 0) + "," + (chkUserBlocked.Checked == true ? 1 : 0) + "," + Int32.Parse(cmbOffice.SelectedItem.Text) + ",'" + (txtOrgEmail.Text.Length<=0 ? "N/A" : txtOrgEmail.Text) + "','" + (txtOtherEmialAddress.Text.Length <= 0 ? "N/A" : txtOtherEmialAddress.Text) + "','" + (txtMgrEmailaddress.Text.Length <= 0 ? "N/A" : txtMgrEmailaddress.Text) + "'," + (chkSendEmail.Checked == true ? 1 : 0) + ",'" + (txtMgrEmailaddress.Text.Length <= 0 ? "N/A" : txtEmailCC.Text) + "'," + (chkUserOfActionRegister.Checked == true ? 1 : 0) + ",'" + (txtPhoneNo.Text.Length <= 0 ? "N/A" : txtPhoneNo.Text) + "'," + cmbUserCategory.SelectedValue.ToString() + ")";
                    //Response.Write(strSQLquery)

                }
                else if (CheckAddEdit.Text == "Edit User")
                {
                    if (string.IsNullOrEmpty(txtUserName.Text))
                    {
                        lblmsg.Text = "Please enter User Name";
                        return;
                    }

                    if (string.IsNullOrEmpty(txtPassword.Text))
                    {
                        strSQLquery = "UPDATE    UserManager " + "SET UserName = '" + txtUserName.Text.Trim().ToString() + "' , Description = '" + txtDescription.Text + "', Admin =" + (chkAdmin.Checked ? 1 : 0) + ", PasswordExpire =" + (chkPasswordExpire.Checked ? 1 : 0) + ", AccountDisabled =" + (chkAccountDisabled.Checked ? 1 : 0) + ", UserBlocked =" + (chkUserBlocked.Checked ? 1 : 0) + ", LocationID =" + Int32.Parse( cmbOffice.SelectedItem.Text) + ", OrgEmail = '" + txtOrgEmail.Text + "', OtherEmialAddress = '" + txtOtherEmialAddress.Text + "' , MgrEmailaddress = '" + txtMgrEmailaddress.Text + "', SendEmail = " + (chkSendEmail.Checked == true ? 1 : 0) + ", CCEmail = '" + (string.IsNullOrEmpty(txtMgrEmailaddress.Text) ? "N/A" : txtEmailCC.Text) + "', UserOfActionRegister=" + (chkUserOfActionRegister.Checked ? 1 : 0) + ", PhoneNo = '" + txtPhoneNo.Text + "', UserCategoryCode=" + cmbUserCategory.SelectedValue.ToString() + " WHERE     (UserID ='" + txtUserID.Text + "')";

                    }
                    else if (!string.IsNullOrEmpty(txtPassword.Text))
                    {
                        strSQLquery = "UPDATE    UserManager " + "SET UserName = '" + txtUserName.Text.Trim().ToString() + "' , Password ='" + txtPassword.Text + "' , Description = '" + txtDescription.Text + "', Admin =" + (chkAdmin.Checked ? 1 : 0) + ", PasswordExpire =" + (chkPasswordExpire.Checked ? 1 : 0) + ", AccountDisabled =" + (chkAccountDisabled.Checked ? 1 : 0) + ", UserBlocked =" + (chkUserBlocked.Checked ? 1 : 0) + ", LocationID =" + Int32.Parse(cmbOffice.SelectedItem.Text) + ", OrgEmail = '" + txtOrgEmail.Text + "', OtherEmialAddress = '" + txtOtherEmialAddress.Text + "' , MgrEmailaddress ='" + txtMgrEmailaddress.Text + "', SendEmail =  " + (chkSendEmail.Checked == true ? 1 : 0) + ", CCEmail = '" + (string.IsNullOrEmpty(txtMgrEmailaddress.Text) ? "N/A" : txtEmailCC.Text) + "', UserOfActionRegister=" + (chkUserOfActionRegister.Checked ? 1 : 0) + ", PhoneNo = '" + txtPhoneNo.Text + "',UserCategoryCode=" + cmbUserCategory.SelectedValue.ToString() + " WHERE (UserID ='" + txtUserID.Text + "')";
                    }

                }

                //Response.Write(Trim(Left(cmbOffice.SelectedItem.Text, Len(InStr(cmbOffice.SelectedItem.Text, "-", CompareMethod.Text)))))

                //Response.Write(strSQLquery)
                //Exit Sub

                if (Conn.State == ConnectionState.Closed)
                    Conn.Open();
                SqlCommand cmdAddUser = new SqlCommand(strSQLquery, Conn);
                //Response.Write(strSQLquery)
                cmdAddUser.ExecuteNonQuery();
                Conn.Close();
                cmdAddUser.Dispose();

                if (CheckAddEdit.Text == "Add New User")
                {
                    lblmsg.Text = "User is created successfully...!";
                }
                else if (CheckAddEdit.Text == "Edit User")
                {
                    lblmsg.Text = "Rights are updated successfully...!";
                }


                txtUserID.Text = "";
                txtUserName.Text = "";
                txtPassword.Text = "";
                txtDescription.Text = "N/A";
                txtOrgEmail.Text = "";
                txtMgrEmailaddress.Text = "";
                txtOtherEmialAddress.Text = "";
                txtEmailCC.Text = "";
                txtPhoneNo.Text = "";

                chkAccountDisabled.Checked = false;
                chkAdmin.Checked = false;
                chkPasswordExpire.Enabled = true;
                chkUserBlocked.Enabled = false;
                CheckAddEdit.Text = "Add/Edit Users";

                cmdSave.Enabled = false;
                cmdEdit.Enabled = false;
                cmdAdd.Enabled = true;
                cmdLoad.Enabled = true;
                cmdLoadList.Enabled = true;
                cmdCancel.Enabled = false;
                txtUserID.Text = "";
                txtUserID.Enabled = true;
                LockControls();

            //}
            //catch (Exception ex)
            //{
            //    lblmsg.Text = "Record Already Exist :: Detail description:- " + ex.Message;
            //    LockControls();
            //}

        }

        public void setFocus(System.Web.UI.Control ctrl)
        {

        string strS;
            strS = "<SCRIPT language='javascript'>document.getElementById('" + ctrl.ID + "').focus() </SCRIPT>";
            Page.RegisterStartupScript("focus", strS);
            //ClientScript.RegisterStartupScript(null ,"focus", strS);
        }

        

        
  private void loadCombo() {
         SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
         if ((Conn.State == ConnectionState.Closed)) {
             Conn.Open();
         }
         System.Data.SqlClient.SqlCommand cmbreadOfficeLocations = new System.Data.SqlClient.SqlCommand("SELECT LocationID, CAST(LocationID AS nvarchar(5)) + ' - ' + LocationDes AS LocationDes  FROM RefLocation WHERE (BlockLocation = 0)", Conn);
         SqlDataReader cmbreader;
         SqlCommand cmbUserCategory1 = new SqlCommand("SELECT UserCategoryCode, UserCategory  FROM  UserCategory where Active = 1", Conn);
         SqlDataReader cmbUserCategoryReader;
         cmbOffice.Items.Clear();
         cmbUserCategory.Items.Clear();
         cmbreader = cmbreadOfficeLocations.ExecuteReader();
         cmbOffice.DataMember = "RefLocation";
         cmbOffice.DataSource = cmbreader;
         cmbOffice.DataValueField = "LocationID";
         cmbOffice.DataTextField = "LocationDes";
         cmbOffice.DataBind();
         cmbreader.Close();
         cmbUserCategoryReader = cmbUserCategory1.ExecuteReader();
         cmbUserCategory.DataMember = "UserCategory";
         cmbUserCategory.DataSource = cmbUserCategoryReader;
         cmbUserCategory.DataValueField = "UserCategoryCode";
         cmbUserCategory.DataTextField = "UserCategory";
         cmbUserCategory.DataBind();
         cmbUserCategory.Dispose();
         cmbreadOfficeLocations.Dispose();
         cmbUserCategoryReader.Close();
         Conn.Close();
     }
 


     private string getvalue(int intOfficeid) 
     {
         SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
         if (Conn.State == ConnectionState.Closed) 
         {
             Conn.Open();
         }
         SqlDataAdapter cmbreadOfficeLocations = new SqlDataAdapter("SELECT CAST(LocationID AS nvarchar(5)) + ' - ' + LocationDes AS OfficeName FROM RefLocation WHERE (LocationID = " + intOfficeid + " AND BlockLocation = 0)", Conn);
         DataSet cmbreader = new DataSet();
         cmbreadOfficeLocations.Fill(cmbreader, "RefLocation");
         Conn.Close();
         cmbreadOfficeLocations.Dispose();
         cmbreader.Clear();
         return cmbreader.Tables[0].Rows[0][0].ToString();
  
     }

        
     private string getvalue1(int intUserCategoryCode) {
         SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
         if ((Conn.State == ConnectionState.Closed)) 
         {
             Conn.Open();
         }
         SqlDataAdapter cmbreadOfficeLocations = new SqlDataAdapter("SELECT UserCategory FROM  UserCategory WHERE (UserCategoryCode = " + intUserCategoryCode + ")", Conn);
         DataSet cmbreader = new DataSet();
         cmbreadOfficeLocations.Fill(cmbreader, "RefLocation");
         
         Conn.Close();
         cmbreadOfficeLocations.Dispose();
         cmbreader.Clear();
         return  cmbreader.Tables[0].Rows[0][0].ToString();
     }

        protected void cmdLoadList_Click(object sender, EventArgs e)
        {
            Session.Add("QueryString", txtUserID.Text);
            
            string scr  = "<script> function update(elemValue) {document.getElementById('txtUserID').innerText=elemValue[0];} </script>";


            
            ClientScript.RegisterClientScriptBlock(this.GetType(), "update", scr);

            
            string myScript;
            myScript = ("<script>window.open('popupwindowloginlist.aspx',null,height=440, width=670,status= no,resizable= yes, scrollbars=yes, toolbar=no,location=no,menubar=no'); </script>");
            ClientScript.RegisterStartupScript(this.GetType(), "JavaScript", myScript);
            
        }

   

 


    }
}