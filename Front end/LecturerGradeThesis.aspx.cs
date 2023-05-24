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
    public partial class LecturerGradeThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LGT_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int Lid = (int)Session["user_id"];
            int Studentid = int.Parse(LGTSID.Text);
            String Title = LGTTITLE.Text;
            Decimal Grade = decimal.Parse(LGTGRADE.Text);

            SqlCommand LecGradeThesis = new SqlCommand("EXEC LecGradeThesis @Lecturer_id=@Lid, @sid =@Studentid, @thesis_title=@Title,@Lecturer_grade =@Grade ", conn);

            LecGradeThesis.Parameters.AddWithValue("@Lid", Lid);
            LecGradeThesis.Parameters.AddWithValue("@Studentid", Studentid);
            LecGradeThesis.Parameters.AddWithValue("@Title", Title);
            LecGradeThesis.Parameters.AddWithValue("@Grade", Grade);

            conn.Open();
            LecGradeThesis.ExecuteNonQuery();
            conn.Close();
        }
    }
}