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
    public partial class EmployeeGradeThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EGT_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int EID = (int)Session["user_id"];
            int StudentID = int.Parse(EGTSID.Text);
            String Title = EGTTITLE.Text;
            decimal Grade = decimal.Parse(EGTGRADE.Text);

            SqlCommand EmployeeGradeThesis = new SqlCommand("EXEC EmployeeGradeThesis @Employee_id=@EID, @sid=@StudentID, @thesis_title=@Title,@Employee_grade=@Grade",conn);
            
            EmployeeGradeThesis.Parameters.AddWithValue("@EID",EID);
            EmployeeGradeThesis.Parameters.AddWithValue("@StudentID",StudentID);
            EmployeeGradeThesis.Parameters.AddWithValue("@Title",Title);
            EmployeeGradeThesis.Parameters.AddWithValue("@Grade",Grade);

            conn.Open();
            EmployeeGradeThesis.ExecuteNonQuery();
            conn.Close();
        }
    }
}