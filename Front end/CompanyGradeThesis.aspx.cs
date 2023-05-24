using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MS3
{
    public partial class CompanyGradeThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CGRADE_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int CID = (int)Session["user_id"];
            int StudentID = int.Parse(CGTDSID.Text);
            String TTitle = CGTT.Text;
            decimal CG = decimal.Parse(CGTGRADE.Text);

            SqlCommand CompanyGradeThesis = new SqlCommand("EXEC CompanyGradeThesis @Company_id =@CID, @sid =@StudentID, @thesis_title=@TTitle,@Company_grade =@CG",conn);

            CompanyGradeThesis.Parameters.AddWithValue("@CID",CID);
            CompanyGradeThesis.Parameters.AddWithValue("@StudentID", StudentID);
            CompanyGradeThesis.Parameters.AddWithValue("@TTitle", TTitle);
            CompanyGradeThesis.Parameters.AddWithValue("@CG", CG);

            conn.Open();
            CompanyGradeThesis.ExecuteNonQuery();
            conn.Close();
        }
    }
}