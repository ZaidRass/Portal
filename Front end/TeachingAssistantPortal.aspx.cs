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
    public partial class TeachingAssistantPortal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

        }

        protected void progReport_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            int TAID = (int)Session["user_id"];
            int student_id = int.Parse(SID.Text);
            DateTime Date = Calendar1.SelectedDate;
            SqlCommand cmd = new SqlCommand("EXEC TACreatePR @TA_id = @taid, @sid = @studentid, @date = @Date, @content = @cn", conn);
            cmd.Parameters.Add(new SqlParameter("@studentid", student_id));
            cmd.Parameters.Add(new SqlParameter("@Date", Date));
            cmd.Parameters.Add(new SqlParameter("@taid", TAID));
            cmd.Parameters.Add(new SqlParameter("@cn", content.Text));
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string todolist = ToDoList.Text;
            int meetingID = int.Parse(meeting_id.Text);
            conn.Open();
            SqlCommand cmd = new SqlCommand("EXEC StudentAddToDo  @meeting_id = @mid, @to_do_list = @tdl", conn);
            cmd.Parameters.Add(new SqlParameter("@mid", meetingID));
            cmd.Parameters.Add(new SqlParameter("@tdl", todolist));
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}