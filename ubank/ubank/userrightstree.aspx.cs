using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.IO;
using System.Data;
using System.Data.SqlClient;

namespace ubank
{
    public partial class userrightstree : System.Web.UI.Page
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

            if (!Page.IsPostBack)
            {
                LoadListValues();
            }

        }


        private void LoadListValues()
        {
            string strSQLtoLoadusers;
            string intValue;
            Class1 objGloble = new Class1();
            intValue = "True";

            if ((intValue == "False"))
            {
                strSQLtoLoadusers = "SELECT UserID, UserName FROM UserManager WHERE     (NOT (UserID = '" + Session["UserID"] +  "')) ORDER BY UserName";
            }
            else
            {
                strSQLtoLoadusers = "SELECT UserID, UserName FROM UserManager ORDER BY UserName";
            }
            SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(strSQLtoLoadusers, Conn);
            DataSet DSUsers = new DataSet();
            sqlDataAdapter.Fill(DSUsers, "UserManager");
            ListBox1.DataSource = DSUsers;
            ListBox1.DataMember = "UserManager";
            ListBox1.DataTextField = "UserName";
            ListBox1.DataValueField = "UserID";
            ListBox1.DataBind();
        }

        protected void cmdSelectUser_Click(object sender, EventArgs e)
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
            lblMessage.Text = "";
            loadtree(lblUserID.Text);
        }

      public  void loadtree(string strUserID)
        {
            SqlConnection ccon = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
            if ((ccon.State == ConnectionState.Closed))
            {
                ccon.Open();
            }
            SqlConnection ccon1 = new  SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
            if ((ccon1.State == ConnectionState.Closed))
            {
                ccon1.Open();
            }
            TreeView1.Nodes.Clear();
            string sqlString;
            // sqlString = "SELECT DISTINCT FormRights.FormName, FormNames.FormDesc FROM FormRights INNER JOIN FormNames ON FormRights.FormName = FormNames.FormName AND FormRights.RightID = FormNames.RightID WHERE (FormNames.FormDesc IS NOT NULL) AND (FormNames.FormDesc <> '' and (FormRights.UserID = '" + strUserID + "')) ORDER BY 1"
            sqlString ="SELECT     FormName, FormDesc FROM    vFormNameListForTree where UserID = '" + strUserID + "' ORDER BY FormDesc";
            SqlCommand cm = new SqlCommand(sqlString, ccon);
            SqlDataReader dr = cm.ExecuteReader();
            string[,] ParentNode = new string[100,2];
            int count = 0;
            while (dr.Read())
            {
                
                ParentNode[count, 0] = dr.GetValue(dr.GetOrdinal("FormName")).ToString();
                ParentNode[count, 1] = dr.GetValue(dr.GetOrdinal("FormDesc")).ToString();
                
                count++;
            }
            dr.Close();
            int loopfor = 0;
            while ((loopfor < count))
            {
                TreeNode root = new TreeNode();
                root.Text = ParentNode[loopfor, 1];
                // skm loopfor += 1
                string strFormRights ="SELECT DISTINCT FormRights.SrNo, FormRights.RightID, FormRights.FormName ,RefRights.RightDes, FormRights.Granted FROM     FormRights INNER JOIN RefRights ON FormRights.RightID = RefRights.RightID WHERE     (FormRights.UserID = '" + strUserID + "') AND (FormRights.FormName = '" + ParentNode[loopfor, 0] + "') ORDER BY FormRights.RightID"; 

                SqlCommand cmdRights = new SqlCommand(strFormRights, ccon);
                SqlDataReader drRights;
                drRights = cmdRights.ExecuteReader();
                while (drRights.Read())
                {
                    TreeNode child = new TreeNode();
                    child.Text = drRights.GetValue(drRights.GetOrdinal("RightDes")).ToString();
                    if (Convert.ToBoolean(drRights["Granted"]) == true)
                    {
                        child.Checked = true;
                    }
                    else
                    {
                        child.Checked = false;
                    }
                    child.Value = drRights["SrNo"].ToString();
                    // + ";" + drRights("FormName").ToString()
                    root.ChildNodes.Add(child);
                }
                drRights.Close();
                TreeView1.Nodes.Add(root);
                loopfor++;
            }

            TreeView1.CollapseAll();
            
        }

      protected void cmdCancel_Click(object sender, EventArgs e)
      {

      }

      protected void cmdExpandTree_Click(object sender, EventArgs e)
      {
          TreeView1.ExpandAll();
      }

      protected void cmdcollapseTree_Click(object sender, EventArgs e)
      {
          TreeView1.CollapseAll();
      }

      protected void cmdUpdateAll_Click(object sender, EventArgs e)
      {
          if (Session["LoginSession"] == null || Session["LoginSession"] == "")
          {
              Response.Redirect("sessexp.aspx", false);
              return;
          }

          loadandsave();

      }

      private void loadandsave()
      {
          
          SqlConnection Conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
          if ((Conn.State == ConnectionState.Closed))
          {
              Conn.Open();
          }
          int i = 0;
          int j = 0;
          while ((i < TreeView1.Nodes.Count))
          {
              j = 0;
              while ((j < TreeView1.Nodes[i].ChildNodes.Count))
              {
                  SqlCommand cmdUpdate = new SqlCommand("UPDATE FormRights SET Granted =" + (TreeView1.Nodes[i].ChildNodes[j].Checked ? 1 : 0) + " WHERE  (SrNo ='" + TreeView1.Nodes[i].ChildNodes[j].Value.ToString() + "' and UserID ='" + lblUserID.Text.ToString() + "')", Conn);
                  cmdUpdate.ExecuteNonQuery();
                  cmdUpdate.Dispose();
                  
                  j++;
              }
              i++;
          }
      }
    }
}