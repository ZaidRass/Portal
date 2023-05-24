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
    public partial class EmployeeGradeDefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int EID = (int)Session["user_id"];
            int StudentID = int.Parse(TextBox2.Text);
            String Loc = TextBox3.Text;
            decimal Grade = decimal.Parse(TextBox4.Text);

            SqlCommand EmployeeGradedefense = new SqlCommand("EXEC EmployeeGradedefense @Employee_id= @EID, @sid=@StudentID, @defense_location=@Loc, @Employee_grade=@Grade", conn);

            EmployeeGradedefense.Parameters.AddWithValue("@EID",EID);
            EmployeeGradedefense.Parameters.AddWithValue("@StudentID",StudentID);
            EmployeeGradedefense.Parameters.AddWithValue("@Loc",Loc);
            EmployeeGradedefense.Parameters.AddWithValue("@Grade",Grade);

            conn.Open();
            EmployeeGradedefense.ExecuteNonQuery();
            conn.Close();
        }
    }
}