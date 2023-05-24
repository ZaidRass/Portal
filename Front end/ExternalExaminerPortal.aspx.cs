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
    public partial class ExternalExaminerPortal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            
        }

        protected void Grade_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            int id = (int)Session["user_id"];
            SqlCommand cmd = new SqlCommand("EXEC EEGradeThesis  @EE_id = @EEID, @sid = @SID, @thesis_title = @TT, @EE_grade = @EEG", conn);
            int student_id = int.Parse(sid.Text);
            string ThesisTitle = thesistitle.Text;
            double EEGrade = double.Parse(EEgrade.Text);
            cmd.Parameters.Add(new SqlParameter("@EEID", id));
            cmd.Parameters.Add(new SqlParameter("@SID", student_id));
            cmd.Parameters.Add(new SqlParameter("@TT", ThesisTitle));
            cmd.Parameters.Add(new SqlParameter("@EEG", EEGrade));

            conn.Close();
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            int id = (int)Session["user_id"];
            SqlCommand cmd = new SqlCommand("EXEC EEGradeThesis  @EE_id = @EEID, @sid = @SID, @defense_location = @DL, @EE_grade = @EEG", conn);
            int student_id = int.Parse(sid1.Text);
            string defense_location = DefenseLocation.Text;
            double EEGrade = double.Parse(EEgrade1.Text);
            cmd.Parameters.Add(new SqlParameter("@EEID", id));
            cmd.Parameters.Add(new SqlParameter("@SID", student_id));
            cmd.Parameters.Add(new SqlParameter("@DL", defense_location));
            cmd.Parameters.Add(new SqlParameter("@EEG", EEGrade));

            conn.Close();
        }
    }
}