using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ubank.Manager;
using System.Data;


namespace ubank
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            glposting();
        }


        public void glposting()
        {
            string querry = " SELECT " +
        "xvz.* , " +
        "'Posted' AS status ,  " +
        "NVL(tbl.PIBAS_GL_WITH_LOCATION,0) AS PibasGL  " +
        "FROM " +
        "(	SELECT " +
        "		GL_CODE_DESCRIPTION, " +
        "		ID_GL_CODE , " +
        "		MAX(ID_GL_HISTORY) RefrenceNO, " +
        "		SUM(AMOUNT) Amount  " +
        "	FROM " +
        "		(	SELECT " +
        "				gl.GL_CODE_DESCRIPTION, " +
        "				gl.ID_GL_CODE, " +
        "				glh.ID_GL_HISTORY ID_GL_HISTORY, " +
        "					CASE  " +
        "						WHEN glh.DC_FLAG='D'  " +
        "						THEN glh.AMOUNT*-1  " +
        "						ELSE glh.AMOUNT  " +
        "					END AMOUNT, " +
        "					glh.DC_FLAG  " +
        "			FROM " +
        "				pbxhbl.GENERAL_LEDGER gl  " +
        "				INNER JOIN pbxhbl.GL_HISTORY glh  " +
        "					ON glh.GL_CODE=gl.ID_GL_CODE  " +
        "				WHERE " +
        "					to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') >=  " +
        "					trunc(to_date('" + txtFromDate.Text + "')-1)||'04.00.00.00 AM' AND " +
        "					to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') <  " +
        "					trunc(to_date('" + txtFromDate.Text + "'))||'04.00.00.00 AM' " +
        "			) " +
        "		GROUP BY " +
        "			GL_CODE_DESCRIPTION, " +
        "			ID_GL_CODE, " +
        "			DC_FLAG " +
        "	) " +
        "	xvz  " +
        "		INNER JOIN cmsuser.TBLGLINFO tbl  " +
        "		ON tbl.SYBASEGLACCOUNT=xvz.ID_GL_CODE " +
        " WHERE " +
        "	xvz.REFRENCENO IN (	SELECT " +
        "							substr(RETRIEVALREFERENCENUMBER,1,8)  " +
        "						FROM " +
        "							pls.BBTRANSACTIONS@pibas  " +
        "						WHERE " +
        "							To_date(TRANSACTIONDATE,'yyyy-mm-dd') =  " +
        "							to_date('" + txtFromDate.Text + "') AND " +
        "							(FROMACCOUNTNUMBERFA='900091402010586' OR " +
        "							TOACCOUNTNUMBERTA='900091402010586') " +
        "	) " +
        " UNION " +
        "	ALL  " +
        " SELECT " +
        "	xvz.* , " +
        "	'Not Posted'                     AS status, " +
        "	NVL(tbl.PIBAS_GL_WITH_LOCATION,0) AS PibasGL  " +
        " FROM " +
        "	(	SELECT " +
        "			GL_CODE_DESCRIPTION, " +
        "			ID_GL_CODE , " +
        "			MAX(ID_GL_HISTORY) RefrenceNO, " +
        "			SUM(AMOUNT) Amount  " +
        "		FROM " +
        "			(	SELECT " +
        "					gl.GL_CODE_DESCRIPTION, " +
        "					gl.ID_GL_CODE, " +
        "					glh.ID_GL_HISTORY ID_GL_HISTORY, " +
        "					CASE  " +
        "						WHEN glh.DC_FLAG='D'  " +
        "						THEN glh.AMOUNT*-1  " +
        "						ELSE glh.AMOUNT  " +
        "					END AMOUNT, " +
        "					glh.DC_FLAG  " +
        "				FROM " +
        "					pbxhbl.GENERAL_LEDGER gl  " +
        "					INNER JOIN pbxhbl.GL_HISTORY glh  " +
        "					ON glh.GL_CODE=gl.ID_GL_CODE  " +
        "				WHERE " +
        "					to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') >=  " +
        "					trunc(to_date('" + txtFromDate.Text + "')-1)||'04.00.00.00 AM' AND " +
        "					to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') <  " +
        "					trunc(to_date('" + txtFromDate.Text + "'))||'04.00.00.00 AM' " +
        "			) " +
        "		GROUP BY " +
        "			GL_CODE_DESCRIPTION, " +
        "			ID_GL_CODE, " +
        "			DC_FLAG " +
        "	) " +
        "	xvz  " +
        "		LEFT JOIN cmsuser.TBLGLINFO tbl  " +
        "		ON tbl.SYBASEGLACCOUNT=xvz.ID_GL_CODE  " +
        " WHERE " +
        "	xvz.REFRENCENO NOT IN (	SELECT " +
        "								substr(RETRIEVALREFERENCENUMBER,1,8)  " +
        "							FROM " +
        "								pls.BBTRANSACTIONS@pibas  " +
        "							WHERE " +
        "								To_date(TRANSACTIONDATE,'yyyy-mm-dd') =  " +
        "								to_date('" + txtFromDate.Text + "') AND " +
        "								(FROMACCOUNTNUMBERFA='900091402010586' OR " +
        "								TOACCOUNTNUMBERTA='900091402010586'))"; ;

            DataTable dt = Connections.GetFromDB(querry);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}