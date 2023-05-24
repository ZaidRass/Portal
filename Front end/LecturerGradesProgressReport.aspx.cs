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
    public partial class LecturerGradesProgressReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LGRADEPR_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int Lid = (int)Session["user_id"];
            int Studentid = int.Parse(LGPRSID.Text);
            DateTime PRDATE = LGPRDATE.SelectedDate;
            decimal Grade = decimal.Parse(LGPRGRADE.Text);

            SqlCommand LecGradePR = new SqlCommand("EXEC LecGradePR @Lecturer_id=@Lid,@sid=@Studentid,@date=@PRDATE,@Lecturer_grade=@Grade",conn);

            LecGradePR.Parameters.AddWithValue("@Lid", Lid);
            LecGradePR.Parameters.AddWithValue("@Studentid", Studentid);
            LecGradePR.Parameters.AddWithValue("@PRDATE", PRDATE);
            LecGradePR.Parameters.AddWithValue("@Grade", Grade);

            conn.Open();
            LecGradePR.ExecuteNonQuery();
            conn.Close();

        }
    }
}