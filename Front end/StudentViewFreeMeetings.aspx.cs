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
    public partial class StudentViewFreeMettings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int StudentID = (int)Session["user_id"];

            SqlCommand ViewNotBookedMeetings = new SqlCommand("EXEC ViewNotBookedMeetings @sid=@StudentID", conn);

            ViewNotBookedMeetings.Parameters.AddWithValue("@StudentID", StudentID);


            conn.Open();
            ViewNotBookedMeetings.ExecuteNonQuery();

            SqlDataReader reader = ViewNotBookedMeetings.ExecuteReader();
            ye.DataSource = reader;
            ye.DataBind();
            form1.Controls.Add(ye);

            conn.Close();
        }


    }
}