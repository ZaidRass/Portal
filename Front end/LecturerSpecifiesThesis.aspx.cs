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
    public partial class LecturerSpecifiesThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void DeadlineCal_SelectionChanged(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            DateTime Deadline1 = DeadlineCal.SelectedDate;

            SqlCommand SpecifyThesisDeadline = new SqlCommand("EXEC SpecifyThesisDeadline @deadline=@Deadline1", conn);

            SpecifyThesisDeadline.Parameters.AddWithValue("@Deadline1", Deadline1);

            conn.Open();
            SpecifyThesisDeadline.ExecuteNonQuery();
            conn.Close();
            //how to do this shit because i dont know how to take the inpuyt from a calendar 
        }
    }
}