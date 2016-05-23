using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;



namespace ubank
{
    public partial class assignrights : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginSession"] == null || Session["LoginSession"] == "")
            {
                Response.Redirect("sessexp.aspx", false);
                return;
            }


            string  strValue;
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


            if (!Page.IsPostBack)
            {
                LoadListValues();
            }

        }

        private void LoadListValues()
        {
            string strSQLtoLoadusers = null;
             string struserid = Session["UserID"].ToString();
            string intValue = null;
            Class1 objGloble = new Class1();

            intValue = objGloble.CheckUserIDRightsForIT(struserid, "Admin");

            if (intValue == "False")
            {
                strSQLtoLoadusers = "SELECT     '0 - ALL' AS UserID, ' Assign Rights to All' UserName  FROM         UserManager  UNION   SELECT UserID, UserName FROM UserManager WHERE     (NOT (UserID = '" + Session["UserID"] + "')) ORDER BY UserName";
            }
            else
            {
                strSQLtoLoadusers = "SELECT     '0 - ALL' AS UserID, ' Assign Rights to All' UserName  FROM         UserManager  UNION   SELECT UserID, UserName FROM UserManager ORDER BY UserName";
            }

            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
            

            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(strSQLtoLoadusers, Conn);
            DataSet DSUsers = new DataSet();
            sqlDataAdapter.Fill(DSUsers, "UserManage");
            ListBox1.DataSource = DSUsers;
            ListBox1.DataMember = "UserManage";
            ListBox1.DataTextField = "UserName";
            ListBox1.DataValueField = "UserID";
            ListBox1.DataBind();

        }

        protected void cmdSelectUser_Click(object sender, EventArgs e)
        {
            try
            {
                if ((ListBox1.Items.Count <= 0))
                {
                    lblMessage.Text = "List is empty.";
                    return;
                }
                if ((ListBox1.SelectedItem.Text == ""))
                {
                    lblMessage.Text = "User is not selected form the list.";
                    return;
                }
                lblUserName.Text = ListBox1.SelectedItem.Text;
                lblUserID.Text = ListBox1.Items[ListBox1.SelectedIndex].Value;
                Button1.Enabled = true;
                lblMessage.Text = "";
                cmdSelectUser.Enabled = false;
                ListBox1.Enabled = false;
                cmdCancel.Enabled = true;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "User is not selected from the list.";
            }
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            {
               
                if ((lblUserID.Text != "0 - ALL"))
                {
                    UpdateRights(lblUserID.Text);
                }
                else if ((lblUserID.Text == "0 - ALL"))
                {
                    
                    Int32 i;
                    i = 0;
                    while ((i < ListBox1.Items.Count))
                    {
                        
                        if (ListBox1.Items[i].Value.ToString() != "0 - ALL")
                        {
                            UpdateRights(ListBox1.Items[i].Value);
                            Response.Write((" " + (i + (" - " + ListBox1.Items[i].Value.ToString()))));
                            
                        }

                        i = (i + 1);
                    }
                    lblUserName.Text = ListBox1.SelectedItem.Text;
                    lblUserID.Text = ListBox1.Items[ListBox1.SelectedIndex].Value;
                }
                if ((lblUserID.Text != "0 - ALL"))
                {
                    lblMessage.Text = ("Successfully Implemented Rights at user "
                                + (lblUserName.Text + ". You can change rights of users from Change Rights form"));
                }
                else if ((lblUserID.Text == "0 - ALL"))
                {
                    lblMessage.Text = "Successfully Implemented Rights at ALL Users. You can change rights of users from Change Rights form";
                }
                Button1.Enabled = false;
                lblUserID.Text = "Selected User ID";
                lblUserName.Text = "Selected User Name";
                cmdSelectUser.Enabled = true;
                ListBox1.Enabled = true;
                cmdCancel.Enabled = false;
            }
            catch (Exception ex)
            {
                lblMessage.Text = ex.Source.ToString() + " ( : " + ex.Message + ")" ;
              
            }
        }
        private void UpdateRights(string fnUserID)
        {
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
            
            if ((Conn.State == ConnectionState.Closed))
            {
                Conn.Open();
            }
            
            SqlCommand cSQLCommand = new SqlCommand();
            SqlCommand cmdLoadFormNames = new SqlCommand("SELECT FormName, RightID  FROM  FormNames", Conn);
            SqlDataReader drLoadFormNames;
            string strSQLQuery;
            try
            {
                drLoadFormNames = cmdLoadFormNames.ExecuteReader();
                while (drLoadFormNames.Read())
                {
                    SqlConnection Conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
                    if ((Conn1.State == ConnectionState.Closed))
                    {
                        Conn1.Open();
                    }
                    SqlDataAdapter daRights = new SqlDataAdapter("SELECT count(*) FROM FormRights WHERE (UserID = '" + fnUserID + "') AND (FormName ='" + drLoadFormNames["FormName"].ToString() + "') AND (RightID = " + drLoadFormNames["RightID"].ToString() + ")", Conn1);
                    DataSet dsRights = new DataSet();
                    daRights.Fill(dsRights, "FormRights");
                    if ((Convert.ToInt32(dsRights.Tables["FormRights"].Rows[0][0]) <= 0))
                    {
                        Conn1.Close();
                        strSQLQuery = "INSERT INTO FormRights  (UserID, FormName, RightID, Granted) VALUES ('" + fnUserID + "','" + drLoadFormNames["FormName"].ToString() + "'," + drLoadFormNames["RightID"].ToString() + ",0)";
                        if ((Conn1.State == ConnectionState.Closed))
                        {
                            Conn1.Open();
                        }
                        SqlCommand cmdInsertRights = new SqlCommand(strSQLQuery, Conn1);
                        cmdInsertRights.ExecuteNonQuery();
                        Conn1.Close();
                    }
                }
                if ((Conn.State == ConnectionState.Open))
                {
                    Conn.Close();
                }
      
            }
            catch (Exception ex)
            {
                if ((Conn.State == ConnectionState.Open))
                {
                    Conn.Close();
                }

                lblMessage.Text = ex.Source.ToString() + "( : " + ex.Message.ToString() + ")";
                
            }
        }

    }
}