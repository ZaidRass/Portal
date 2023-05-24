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
    public partial class EmployeeCreateProgressReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int EID = (int)Session["user_id"];
            int StudentID= int.Parse(TextBox2.Text);
            String C = TextBox3.Text;
            DateTime D = Calendar1.SelectedDate;

            SqlCommand EmployeeCreatePR = new SqlCommand("EXEC EmployeeCreatePR @Employee_id=@EId, @sid =@StudentID, @date= @D, @content=@C ",conn);

            EmployeeCreatePR.Parameters.AddWithValue("@EID",EID);
            EmployeeCreatePR.Parameters.AddWithValue("@StudentID", StudentID);
            EmployeeCreatePR.Parameters.AddWithValue("@C", C);
            EmployeeCreatePR.Parameters.AddWithValue("@D", D);

            conn.Open();
            EmployeeCreatePR.ExecuteNonQuery();
            conn.Close();

        }
    }
}