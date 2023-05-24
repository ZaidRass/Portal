using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace MS3
{
    public partial class TempLol : System.Web.UI.Page
    {

        SqlDataAdapter da;
        DataSet ds = new DataSet();
        StringBuilder htmlTable = new StringBuilder();

        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id = (int)Session["user_id"];

            SqlCommand viewProfile = new SqlCommand("ViewProfile", conn);
            viewProfile.CommandType = CommandType.StoredProcedure;

            viewProfile.Parameters.Add(new SqlParameter("@user_id", id));

            da = new SqlDataAdapter(viewProfile);
            da.Fill(ds);

            conn.Open();
            viewProfile.ExecuteNonQuery();
            htmlTable.Append("<table border='1'>");
            htmlTable.Append("<tr style='background-color:green; color: White;'>");

            foreach (DataColumn column in ds.Tables[0].Columns)
                htmlTable.Append("<th>" + column.ColumnName + "</th>");

            htmlTable.Append("</tr>");

            if (!object.Equals(ds.Tables[0], null))
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                    {
                        htmlTable.Append("<tr>");
                        for (int j = 0; j < ds.Tables[0].Columns.Count; j++)
                        {
                            htmlTable.Append("<td>" + ds.Tables[0].Rows[i][j] + "</td>");
                        }
                        htmlTable.Append("</tr>");
                    }
                    userInfo.Controls.Add(new Literal { Text = htmlTable.ToString() });
                }
                else
                {
                    userInfo.Controls.Add(new Literal { Text = "No Data Found" });
                }
            }

            conn.Close();

        }

        protected void SVT_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentViewThesis.aspx");
        }

        protected void SST_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentSubmitThesis.aspx");
        }

        protected void SVPR_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentViewProgressReport.aspx");
        }

        protected void SVD_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentViewDefense.aspx");
        }

        protected void SUD_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentUpdateDefense.aspx");
        }

        protected void SBPG_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentViewBachelorGrade.aspx");
        }

        protected void SVFM_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentViewFreeMeetings.aspx");
        }

        protected void SBM_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentBookMeeting.aspx");
        }

        protected void SVBM_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentViewBookedMeetings.aspx");
        }

        protected void SATDL_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentAddTODO.aspx");
        }
    }
}