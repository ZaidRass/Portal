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
    public partial class LecturerSupervisesIndustrial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void SIBUT_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int Lid = (int)Session["user_id"];
            String Proj = SIPROJ.Text;

            SqlCommand SuperviseIndustrial = new SqlCommand("EXEC SuperviseIndustrial @Lecturer_id =@Lid, @proj_code=@Proj",conn);
            SuperviseIndustrial.Parameters.AddWithValue("@Lid", Lid);
            SuperviseIndustrial.Parameters.AddWithValue("@Proj", Proj);
            conn.Open();
            SuperviseIndustrial.ExecuteNonQuery();
            conn.Close();

        }
    }
}