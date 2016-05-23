using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Oracle.ManagedDataAccess.Client;

namespace ubank
{
    public partial class pibas111uploadxl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            if (FileUpload1.HasFile)
            {
                //first truncate the table to remove the existing data of both cls sheet and pibas data tables
                truncateTableXLSheet();
                truncateTablePibas();
                // after clearing the existing data insert new records xls file and pibas data
                insertdata();
                loadAllDataOfPibas();
            }
            else
            {
                litmsg.Text = "You did not specified a file to upload.";
            }
        }
        public void truncateTableXLSheet()
        {
            string consString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            SqlConnection con = new SqlConnection(consString);
            // SqlConnection con = new SqlConnection("constr");
            con.Open();
            SqlCommand cmd = new SqlCommand("TRUNCATE TABLE xlSheetDate", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void truncateTablePibas()
        {
            string consString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            SqlConnection con = new SqlConnection(consString);
            // SqlConnection con = new SqlConnection("constr");
            con.Open();
            SqlCommand cmd = new SqlCommand("TRUNCATE TABLE [tblLMFREPAYMENT]", con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void insertdata()
        {
            //Upload and save the file
            string excelPath = Server.MapPath("~/") + Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(excelPath);

            string conString = string.Empty;
            string extension = Path.GetExtension(FileUpload1.PostedFile.FileName);
            switch (extension)
            {
                case ".xls": //Excel 97-03
                    conString = ConfigurationManager.ConnectionStrings["Excel03ConString"].ConnectionString;
                    break;
                case ".xlsx": //Excel 07 or higher
                    conString = ConfigurationManager.ConnectionStrings["Excel07+ConString"].ConnectionString;
                    break;

            }
            conString = string.Format(conString, excelPath);
            using (OleDbConnection excel_con = new OleDbConnection(conString))
            {
                excel_con.Open();
                string sheet1 = excel_con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null).Rows[0]["TABLE_NAME"].ToString();
                DataTable dtExcelData = new DataTable();

                //[OPTIONAL]: It is recommended as otherwise the data will be considered as String by default.
                dtExcelData.Columns.AddRange(new DataColumn[23] { new DataColumn("BR", typeof(string)),
                new DataColumn("LC", typeof(decimal)),
                new DataColumn("RoName", typeof(string)),
                new DataColumn("BorrowerCell", typeof(string)),
                new DataColumn("BorrowerAddress", typeof(string)),
                new DataColumn("BorrowerCNIC", typeof(string)),
                new DataColumn("PC", typeof(string)),
                new DataColumn("DisbAmnt", typeof(decimal)),
                new DataColumn("No", typeof(decimal)),
                new DataColumn("InstAmnt", typeof(decimal)),
                new DataColumn("DateDue", typeof(string)),
                new DataColumn("InstPrincipal", typeof(decimal)),
                new DataColumn("InstMKPNormal", typeof(decimal)),
                new DataColumn("InstMKPOfGP", typeof(decimal)),
                new DataColumn("PaidPrincipal", typeof(decimal)),
                new DataColumn("PaidMKPNormal", typeof(decimal)),
                new DataColumn("PaidMKPOfGP", typeof(decimal)),
                new DataColumn("DatePaid", typeof(string)),
                new DataColumn("OutsidePrincipal", typeof(decimal)),
                new DataColumn("OutsideMKPNormal", typeof(decimal)),
                new DataColumn("OutsideMKPOfGP", typeof(decimal)),
                new DataColumn("DueAmount", typeof(decimal)),
                new DataColumn("DPD",typeof(decimal)) 
            });

                using (OleDbDataAdapter oda = new OleDbDataAdapter("SELECT * FROM [" + sheet1 + "]", excel_con))
                {
                    // HttpContext.Current.Response.Write(oda + "<br />" + dtExcelData);
                    oda.Fill(dtExcelData);
                }
                excel_con.Close();

                string consString = ConfigurationManager.ConnectionStrings["strConn"].ConnectionString;
                using (SqlConnection con = new SqlConnection(consString))
                {
                    using (SqlBulkCopy sqlBulkCopy = new SqlBulkCopy(con))
                    {
                        //Set the database table name
                        sqlBulkCopy.DestinationTableName = "dbo.xlSheetDate";

                        //[OPTIONAL]: Map the Excel columns with that of the database table
                        sqlBulkCopy.ColumnMappings.Add("BR", "BR");
                        sqlBulkCopy.ColumnMappings.Add("LC", "LC");
                        sqlBulkCopy.ColumnMappings.Add("RoName", "RoName");
                        sqlBulkCopy.ColumnMappings.Add("BorrowerCell", "BorrowerCell");
                        sqlBulkCopy.ColumnMappings.Add("BorrowerAddress", "BorrowerAddress");
                        sqlBulkCopy.ColumnMappings.Add("BorrowerCnic", "BorrowerCNIC");
                        sqlBulkCopy.ColumnMappings.Add("PC", "PC");
                        sqlBulkCopy.ColumnMappings.Add("DisbAmnt", "DisbAmnt");
                        sqlBulkCopy.ColumnMappings.Add("No", "No");
                        sqlBulkCopy.ColumnMappings.Add("InstAmnt", "InstAmnt");
                        sqlBulkCopy.ColumnMappings.Add("DateDue", "DateDue");
                        sqlBulkCopy.ColumnMappings.Add("InstPrincipal", "InstPrincipal");
                        sqlBulkCopy.ColumnMappings.Add("InstMKPNormal", "InstMKPNormal");
                        sqlBulkCopy.ColumnMappings.Add("InstMKPOfGP", "InstMKPGP");
                        sqlBulkCopy.ColumnMappings.Add("PaidPrincipal", "PaidPrincipal");
                        sqlBulkCopy.ColumnMappings.Add("PaidMKPNormal", "PaidMKPNormal");
                        sqlBulkCopy.ColumnMappings.Add("PaidMKPOfGP", "PaidMKPGP");
                        sqlBulkCopy.ColumnMappings.Add("DatePaid", "DatePaid");
                        sqlBulkCopy.ColumnMappings.Add("OutsidePrincipal", "OutsidePrinciple");
                        sqlBulkCopy.ColumnMappings.Add("OutsideMKPNormal", "OutsideMKPNormal");
                        sqlBulkCopy.ColumnMappings.Add("OutsideMKPOfGP", "OutsideMKPGP");
                        sqlBulkCopy.ColumnMappings.Add("DueAmount", "DueAmount");
                        sqlBulkCopy.ColumnMappings.Add("DPD", "DPD");
                        con.Open();
                        sqlBulkCopy.WriteToServer(dtExcelData);
                        con.Close();
                        litmsg.Text = "XLS file data has been inserted Successfully!";

                    }
                }
            }
        }

        protected void loadAllDataOfPibas()
        {
            //string constr = ConfigurationManager.ConnectionStrings["conpibas"].ConnectionString;
            OracleConnection connection = new OracleConnection(System.Configuration.ConfigurationManager.AppSettings["PIBASConnectionString"]);
            //"Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=172.24.2.45)(PORT=8778))(CONNECT_DATA=(SID=pibas1)));User Id=system;Password=cbcboraclesystem"
            connection.Open();
            OracleCommand Command = new OracleCommand();
            Command.CommandType = CommandType.Text;
            //  Command.CommandType = CommandType.StoredProcedure;
            //Command.CommandText = @"select lmf.BRANCH_CODE as 'Branch Code',lmf.LOAN_CODE as 'Loan Code',lmf.BORROWER_CODE as 'Borrower Code', lmf.CREDIT_OFFICER as 'RO Code' , macd.CODE_DESC as 'RO Name' , brm.NIC_NEW as 'CNIC', crmc.COMM_VALUE as 'Cell' from lmf.lmfloans lmf left outer join pls.macd macd on macd.CODE_NUMB = lmf.CREDIT_OFFICER and macd.BRAN_CODE = lmf.BRANCH_CODE and macd.CODE_TYPE =13 left outer join pls.BRMBUSINESSENTITIES brm on brm.BRM_CODE = lmf.BORROWER_CODE left outer join pls.BRMCOMMTYPES crmc on crmc.BRM_CODE = lmf.BORROWER_CODE and crmc.COMM_SEQ = 1 left outer join pls.BRMADDRESSES brma on brma.BRM_CODE = lmf.BORROWER_CODE  and brma.ADDRESS_SEQ = 1";
            // Command.CommandText = @"SYSTEM.LMFREPAYMENT";


            OracleCommand objCmd = new OracleCommand();
            objCmd.Connection = connection;
            objCmd.CommandType = CommandType.StoredProcedure;
            objCmd.BindByName = true;
            objCmd.CommandText = "SYSTEM.LMFREPAYMENT";
            objCmd.CommandType = CommandType.StoredProcedure;

            objCmd.Parameters.Add("C_DEPOSITSUM", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            //OracleDataReader dr = objCmd.ExecuteReader();
            OracleDataAdapter adapter = new OracleDataAdapter(objCmd);
            DataSet ds = new DataSet();
            adapter.Fill(ds);
            DataView dv;
            dv = ds.Tables[0].DefaultView;
            // DataView dv = new DataView(adapter);
            if (dv.Count > 0)
            {
                for (int i = 0; i < dv.Count; i++)
                {
                    string bracncode = dv[i]["Branch Code"].ToString();
                    string loancode = dv[i]["Loan Code"].ToString();
                    string borrowercode = dv[i]["Borrower Code"].ToString();
                    string rocode = dv[i]["Ro Code"].ToString();
                    string roname = dv[i]["Ro Name"].ToString();
                    string cnic = dv[i]["CNIC"].ToString();
                    string cellno = dv[i]["Cell #"].ToString();
                    string address = dv[i]["Adress"].ToString();
                    string productname = dv[i]["Product Name"].ToString();
                    insertdatafromPibas(bracncode, loancode, borrowercode, rocode, roname, cnic, cellno, address, productname);
                    // Response.Write(bracncode + "," + loancode + "," + borrowercode + "," + rocode + "," + roname + "," + cnic + "," + cellno + "," + address + "<br />");
                }
            }
            connection.Close();
        }
        protected void insertdatafromPibas(string bc, string lc, string browercode, string rocode, string roname, string cnic, string cellno, string address, string productname)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["strConn"].ToString());
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = "INSERT INTO tblLMFREPAYMENT (BranchCode,LoanCode,BorrowerCode,RoCode,RoName,CNIC,CellNo,Address,ProductName) VALUES (@BranchCode,@LoanCode,@BorrowerCode,@RoCode,@RoName,@CNIC,@CellNo,@Address,@ProductName)";

            //Uses the FirstName variable and creates a new sql variable for use in the sql commandtext
            cmd.Parameters.Add("@BranchCode", SqlDbType.NVarChar).Value = bc;
            cmd.Parameters.Add("@LoanCode", SqlDbType.NVarChar).Value = lc;
            cmd.Parameters.Add("@BorrowerCode", SqlDbType.NVarChar).Value = browercode;
            cmd.Parameters.Add("@RoCode", SqlDbType.NVarChar).Value = rocode;
            cmd.Parameters.Add("@RoName", SqlDbType.NVarChar).Value = roname;
            cmd.Parameters.Add("@CNIC", SqlDbType.NVarChar).Value = cnic;
            cmd.Parameters.Add("@CellNo", SqlDbType.NVarChar).Value = cellno;
            cmd.Parameters.Add("@Address", SqlDbType.NVarChar).Value = address;
            cmd.Parameters.Add("@ProductName", SqlDbType.NVarChar).Value = productname;

            cmd.Connection = conn;

            conn.Open();

            cmd.ExecuteNonQuery();

            conn.Close();
            litmsg.Text = "ALL Records has been Successfully inserted";
        }

    }
}