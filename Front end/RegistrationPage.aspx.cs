using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MS3
{
    public partial class RegistrationPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String mail = loginEmail.Text;
            String pass = loginPassword.Text;

            SqlCommand loginProc = new SqlCommand("EXEC UserLogin @success OUTPUT, @uid OUTPUT, @email = @mail, @password = @pass", conn);

            SqlParameter success = loginProc.Parameters.Add("@success", sqlDbType: SqlDbType.Bit);
            SqlParameter userID = loginProc.Parameters.Add("@uid", sqlDbType: SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            userID.Direction = ParameterDirection.Output;

            loginProc.Parameters.Add(new SqlParameter("@mail", mail));
            loginProc.Parameters.Add(new SqlParameter("@pass", pass));

            conn.Open();
            loginProc.ExecuteNonQuery();
            conn.Close();

            if ((int)userID.Value == -1)
            {
                Response.Redirect("RegistrationPage.aspx");
                Response.Write("Wrong Email or Password!");
            }
            else
            {
                Session["user_id"] = userID.Value;
                string role = RoleCheck((int)userID.Value);
                if (role.Equals("Students"))
                {
                    Response.Redirect("StudentView.aspx");
                }
                else if (role.Equals("Companies"))
                {
                    Response.Redirect("Company.aspx");
                }
                else if (role.Equals("Lecturers"))
                {
                    Response.Redirect("Lecturer.aspx");
                }
                else if (role.Equals("Coordinators"))
                {
                    Response.Redirect("CoordinatorPortal.aspx");
                }
                else if (role.Equals("Employees"))
                {
                    Response.Redirect("Employee.aspx");
                }
                else if (role.Equals("ExternalExaminers"))
                {
                    Response.Redirect("ExternalExaminerPortal.aspx");
                }
                else if (role.Equals("TeachingAssistants"))
                {
                    Response.Redirect("TeachingAssistantPortal.aspx");
                }
            }
        }

        protected string RoleCheck(int id)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT userRole from Users WHERE UserID = @id", conn);
            cmd.Parameters.Add(new SqlParameter("@id", id));

            string role = cmd.ExecuteScalar().ToString();
            return role;
        }

        protected void studentReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("StudentRegistration.aspx");
        }

        protected void lecReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerRegistration.aspx");
        }

        protected void TAReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("TARegistration.aspx");
        }

        protected void comReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompanyRegistration.aspx");
        }

        protected void EEReg_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExternalExaminerRegistration.aspx");
        }
    }
}