using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ubank.Manager
{
    public static class ConnectionsPIBAS
    {


        public static OracleConnection connectionPIBAS(Int64 ConnCode)
        {
            /////actual connection class
            string myConnectionString = "Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=172.24.2.45)(PORT=8778))(CONNECT_DATA=(SID=pibas1)));User Id=system;Password=cbcboraclesystem";

            OracleConnection myConnection = new OracleConnection(myConnectionString);
            //myConnection.Open();
            return myConnection;
        }

        static public DataTable GetFromDBPIBAS(string @Query, Int64 ConnCode)
        {
            DataTable DT = new DataTable();
            OracleConnection Con = default(OracleConnection);
            OracleTransaction Tran = default(OracleTransaction);
            Con = connectionPIBAS(ConnCode);
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