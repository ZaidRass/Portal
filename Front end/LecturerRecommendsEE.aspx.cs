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
    public partial class LecturerRecommendsEE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void REE_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int Lid = (int)Session["user_id"];
            String Proj = REEPROJ.Text;
            int EEID = int.Parse(REEEID.Text);

            SqlCommand RecommendEE = new SqlCommand("EXEC RecommendEE @Lecturer_id=@Lid,@proj_code=@Proj,@EE_id=@EEID", conn);
            RecommendEE.Parameters.AddWithValue("@Lid", Lid);
            RecommendEE.Parameters.AddWithValue("@Proj", Proj);
            RecommendEE.Parameters.AddWithValue("EEID", EEID);

            conn.Open();
            RecommendEE.ExecuteNonQuery();
            conn.Close();
        }
    }
}