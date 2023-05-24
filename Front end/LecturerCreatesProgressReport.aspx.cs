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
    public partial class LecturerCreatesProgressReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CPRGBUTTON_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int Lid = (int)Session["user_id"];
            int Studentid = int.Parse(CPRSID.Text);
            DateTime CPRdate = CPRCALENDAR.SelectedDate;
            
            String Conten = CPRCONTENT.Text;

            SqlCommand LecCreatePR = new SqlCommand("EXEC LecCreatePR @Lecturer_id=@Lid, @sid=@Studentid,@date=@CPRdate,@content=@Conten",conn);

            LecCreatePR.Parameters.AddWithValue("@Lid", Lid);
            LecCreatePR.Parameters.AddWithValue("@Studentid", Studentid);
            LecCreatePR.Parameters.AddWithValue("@CPRdate", CPRdate);
            LecCreatePR.Parameters.AddWithValue("@Conten", Conten);

            conn.Open();
            LecCreatePR.ExecuteNonQuery();
            conn.Close();
        }
    }
}