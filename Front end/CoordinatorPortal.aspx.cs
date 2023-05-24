using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MS3
{
    public partial class CoordinatorPortal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            DataTable dt = this.GetData();
            StringBuilder html = new StringBuilder();
            html.Append("<table border = '1'>");
            html.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }
            html.Append("</table>");
            UserInfo.Controls.Add(new Literal { Text = html.ToString() });
            
        }
        private DataTable GetData()
        {
            string constr = ConfigurationManager.ConnectionStrings["MS3"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("EXEC ViewEE"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }


        private DataTable GetData(string type, int ID)
        {
            string constr = ConfigurationManager.ConnectionStrings["MS3"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("EXEC ViewUsers @User_type= " + type + ", @User_id= " + ID))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }


        protected void Search_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            DataTable dt;
            string role = Filter.SelectedValue;
            int GrpID = 0;
            int.TryParse(ID.Text, out GrpID);
            conn.Open();
            if (GrpID > 0)

                dt = this.GetData(role, GrpID);
            else
            {
                dt = this.GetData(role, -1);
            }
            StringBuilder html = new StringBuilder();
            html.Append("<table border = '1'>");
            html.Append("<tr>");
            foreach (DataColumn column in dt.Columns)
            {
                html.Append("<th>");
                html.Append(column.ColumnName);
                html.Append("</th>");
            }
            html.Append("</tr>");
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                foreach (DataColumn column in dt.Columns)
                {
                    html.Append("<td>");
                    html.Append(row[column.ColumnName]);
                    html.Append("</td>");
                }
                html.Append("</tr>");
            }
            html.Append("</table>");
            
            UserInfo.Controls.Add(new Literal { Text = html.ToString() });
        }

        protected void save_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("EXEC AssignTAs @coordinator_id=@cid, @TA_id=@TAid ,@proj_code=@pid", conn);
            int coordinator_id = (int)Session["user_id"];
            int TA_id = int.Parse(TA.Text);
            string project_code = PID.Text;
            cmd.Parameters.Add(new SqlParameter("@cid", coordinator_id));
            cmd.Parameters.Add(new SqlParameter("@TAid", TA_id));
            cmd.Parameters.Add(new SqlParameter("@pid", project_code));
            cmd.ExecuteNonQuery();
            conn.Close();

        }

        protected void save2_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("EXEC AssignEE  @coordinator_id = @cid, @EE_id = @EEid, @proj_code = @pid", conn);
            int coordinator_id = (int)Session["user_id"];
            int EE_ID = int.Parse(EEID.Text);
            string project_code = PID.Text;
            cmd.Parameters.Add(new SqlParameter("@cid", coordinator_id));
            cmd.Parameters.Add(new SqlParameter("@EEid", EE_ID));
            cmd.Parameters.Add(new SqlParameter("@pid", project_code));
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        protected void schedDefense_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            conn.Open();
            SqlCommand cmd = new SqlCommand("EXEC ScheduleDefense @sid = @SID, @date = @Date, @time = @Time, @location = @Location", conn);
            int student_id = int.Parse(StudentID.Text);
            DateTime Date = Calendar.SelectedDate;
            string time = Time.Text;
            string location =Location.Text;
            cmd.Parameters.Add(new SqlParameter("@SID", student_id));
            cmd.Parameters.Add(new SqlParameter("@Date", Date));
            cmd.Parameters.Add(new SqlParameter("@Time", time));
            cmd.Parameters.Add(new SqlParameter("@Location", location));
            cmd.ExecuteNonQuery();

            conn.Close();
        }
    }
}
