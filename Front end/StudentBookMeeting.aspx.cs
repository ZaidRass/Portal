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
    public partial class StudentBookMeeting : System.Web.UI.Page
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

            SqlCommand BookMeeting = new SqlCommand("EXEC BookMeeting @sid=@StudentId,@meeting_id=@MID", conn);

            BookMeeting.Parameters.Add("@StudentID",StudentID);
            BookMeeting.Parameters.Add("@MID",MID);

            conn.Open();
            BookMeeting.ExecuteNonQuery();
            conn.Close();
        }
    }
}