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
    public partial class StudentViewProgressReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int StudentID = (int)Session["User_id"];
            DateTime StudentDate = Calendar1.SelectedDate;

            SqlCommand ViewMyProgressReport = new SqlCommand("EXEC ViewMyProgressReport @sid=@StudentID , @date =@StudentDate");

            conn.Open();
            ViewMyProgressReport.ExecuteNonQuery();

            SqlDataReader reader = ViewMyProgressReport.ExecuteReader();
            ye.DataSource = reader;
            ye.DataBind();

            conn.Close();



        }
    }
}