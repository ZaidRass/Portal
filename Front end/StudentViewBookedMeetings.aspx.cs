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
    public partial class StudentViewBookedMeetings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int StudentID = (int)Session["user_id"];
            int MID = int.Parse(TextBox2.Text);
            SqlCommand ViewMeeting = new SqlCommand("EXEC ViewMeeting @sid =@StudentID, @meeting_id =@MID", conn);


            ViewMeeting.Parameters.Add(new SqlParameter("@StudentID", StudentID));
            ViewMeeting.Parameters.Add("@MID", MID);

            conn.Open();
            ViewMeeting.ExecuteNonQuery();

            SqlDataReader reader = ViewMeeting.ExecuteReader();
            ye.DataSource = reader;
            ye.DataBind();

            conn.Close();
        }
    }
}