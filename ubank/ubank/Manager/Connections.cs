using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Configuration;

namespace ubank.Manager
{
    public static class Connections
    {


        public static OracleConnection connection()
        {
            /////actual connection class
            string myConnectionString = ConfigurationManager.ConnectionStrings.ToString();
            myConnectionString =    "Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=172.24.2.45)(PORT=8778))(CONNECT_DATA=(SID=sybase1)));User Id=winftpsrv;Password=mis2user321~";

            OracleConnection myConnection = new OracleConnection(myConnectionString);
            //myConnection.Open();
            return myConnection;
        }

        static public DataTable GetFromDB(string Query)
        {
            DataTable DT = new DataTable();
            OracleConnection Con = default(OracleConnection);
            OracleTransaction Tran = default(OracleTransaction);
            Con = connection();
            Con.Open();
            Tran = Con.BeginTransaction();
            OracleCommand Cmd = new OracleCommand();
            Cmd.CommandText = Query;
            Cmd.Transaction = Tran;
            Cmd.Connection = Con;
            try
            {
                OracleDataAdapter Adapter = new OracleDataAdapter(Cmd);
                Adapter.Fill(DT);
                Tran.Commit();
                Con.Close();
                return DT;
            }
            catch (Exception)
            {
                Tran.Rollback();
                Con.Close();
                throw;
            }
        }
    }
}