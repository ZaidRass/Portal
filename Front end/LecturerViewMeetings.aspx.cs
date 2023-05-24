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
    public partial class LecturerViewMeetings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ViewMeetingBUT_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int LID = (int)Session["user_id"];
            int MID = int.Parse(VMMID.Text);

            SqlCommand ViewMeetingLecturer = new SqlCommand("EXEC ViewMeetingLecturer @Lecturer_id =@LID, @meeting_id =@MID",conn);

            ViewMeetingLecturer.Parameters.AddWithValue("@LID", LID);
            ViewMeetingLecturer.Parameters.AddWithValue("@MID", MID);

            conn.Open();
            ViewMeetingLecturer.ExecuteNonQuery();

            SqlDataReader reader = ViewMeetingLecturer.ExecuteReader();
            ye.DataSource = reader;
            ye.DataBind();

            conn.Close();
        }
    }
}