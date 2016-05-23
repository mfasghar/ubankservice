using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace ubank
{
    public partial class editGLpostingTime : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataSet ds = new DataSet();
                //ds.ReadXml(Request.MapPath(@"\\172.24.1.46\c$\GLPostingService\config.xml"));
                ds.ReadXml(@"\\172.24.1.46\c$\GLPostingService\config.xml");
                FormView1.DataSource = ds.Tables[0];
                FormView1.DataBind();
               
                GridView1.DataSource = ds.Tables[0];
                                
                GridView1.DataBind();
                ViewState["dt"] = ds.Tables[0];
            }
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataSource = (DataTable)ViewState["dt"];
            GridView1.DataBind();
        }

        /// <summary>
        /// Update the specific row in the DataTable with the data from GridView,
        /// re-write the data into the xml file and re-databind again.
        /// </summary>
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            DataTable dt = (DataTable)ViewState["dt"];

            for (int i = 1; i < GridView1.Rows[e.RowIndex].Cells.Count; i++)
            {
                dt.Rows[e.RowIndex][i - 1] = (GridView1.Rows[e.RowIndex].Cells[i].Controls[0] as TextBox).Text;
            }
            dt.AcceptChanges();
            GridView1.EditIndex = -1;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            //dt.WriteXml(Request.MapPath(@"\\172.24.1.46\c$\GLPostingService\config.xml"));
            dt.WriteXml(@"\\172.24.1.46\c$\GLPostingService\config.xml");
        }

        /// <summary>
        /// Cancel edit and set the mode of the GridView to normal viewing mode.
        /// </summary>
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            DataTable dt = (DataTable)ViewState["dt"];
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            FormView1.DefaultMode = FormViewMode.Edit;
           // FormView1.DataBind();
        }

        /// <summary>
        /// Insert the data into the DataTable, re-write into the xml file and
        /// re-databind to the GridView.
        /// </summary>
        //protected void btnInsert_Click(object sender, EventArgs e)
        //{
        //    DataTable dt = (DataTable)ViewState["dt"];
        //    dt.Rows.Add(tbAuthor.Text, tbTitle.Text, tbGenre.Text, tbPrice.Text, tbPublishDate.Text, tbDescription.Text, tbId.Text);
        //    dt.AcceptChanges();
        //    dt.WriteXml(Request.MapPath("try.xml"));
        //    GridView1.DataSource = dt;
        //    GridView1.DataBind();
        //}

        /// <summary>
        /// Delete the row from DataTable and write data into xml file,
        /// re-databind to the GridView.
        /// </summary>
        //protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    DataTable dt = (DataTable)ViewState["dt"];
        //    dt.Rows.RemoveAt(e.RowIndex);
        //    dt.WriteXml(Request.MapPath("try.xml"));
        //    GridView1.DataSource = dt;
        //    GridView1.DataBind();
        //}
    }
}