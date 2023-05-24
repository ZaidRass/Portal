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
    public partial class LecturerGradeDefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void GD_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int Lid = (int)Session["user_id"];
            int Studentid = int.Parse(GDSID.Text);
            String Location = GDLOCATION.Text;
            Decimal Grade = decimal.Parse(GDGRADE.Text);

            SqlCommand LecGradedefense = new SqlCommand("EXEC LecGradedefense @Lecturer_id= @Lid, @sid=@Studentid, @defense_location=@Location, @Lecturer_grade =@Grade",conn);

            LecGradedefense.Parameters.AddWithValue("@Lid", Lid);
            LecGradedefense.Parameters.AddWithValue("@Studentid", Studentid);
            LecGradedefense.Parameters.AddWithValue("@Location", Location);
            LecGradedefense.Parameters.AddWithValue("@Grade", Grade);

            conn.Open();
            LecGradedefense.ExecuteNonQuery();
            conn.Close();
        }
    }
}