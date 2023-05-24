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
    public partial class LecturerCreatesProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void CreateProject_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int Lid = (int)Session["user_id"];
            String P_Code = CreateProjectProjectCode.Text;
            String Title = CreateProjectTitle.Text;
            String M_Code = CreateProjectMajorCode.Text;
            String Description = CreateProjectDescription.Text;

            SqlCommand LecturerCreateLocalProject = new SqlCommand("EXEC LecturerCreateLocalProject @Lecturer_id =@Lid, @proj_code =@P_Code,@title = @Title ,@description=@Description, @major_code = @M_Code", conn);

            LecturerCreateLocalProject.Parameters.AddWithValue("@Lid", Lid);
            LecturerCreateLocalProject.Parameters.AddWithValue("@P_code", P_Code);
            LecturerCreateLocalProject.Parameters.AddWithValue("@Title", Title);
            LecturerCreateLocalProject.Parameters.AddWithValue("@M_Code", M_Code);
            LecturerCreateLocalProject.Parameters.AddWithValue("@Description", Description);

            conn.Open();
            LecturerCreateLocalProject.ExecuteNonQuery();
            conn.Close();
        }
    }
}