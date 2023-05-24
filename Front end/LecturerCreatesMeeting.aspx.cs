using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;


namespace MS3
{
    public partial class LecturerCreatesMeeting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CreateMeeting_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int Lid = (int)Session["user_id"];

            // do the start time 
            String startTime = CMSTARTTIME.Text;
            String endTime = CMENDTIME.Text;
            // do the end time
            String CMdate = CMDATE.Text;
            String point = CMPOINT.Text;

            SqlCommand CreateMeeting = new SqlCommand("EXEC CreateMeeting @Lecturer_id =@Lid,@start_time=@stime, @end_time=@etime, @date =@CMdate, @meeting_point =@point", conn);

            CreateMeeting.Parameters.Add(new SqlParameter("@Lid", Lid));
            CreateMeeting.Parameters.Add(new SqlParameter("@stime", startTime));
            CreateMeeting.Parameters.Add(new SqlParameter("@etime", endTime));
            CreateMeeting.Parameters.Add(new SqlParameter("@CMdate", CMdate));
            CreateMeeting.Parameters.Add(new SqlParameter("@point", point));
            conn.Open();
            CreateMeeting.ExecuteNonQuery();
            Response.Redirect("Lecturer.aspx");
            conn.Close();
        }
    }
}