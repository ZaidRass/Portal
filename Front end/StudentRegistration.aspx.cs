using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MS3
{
    public partial class StudentRegistration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String mail = regEmail.Text;
            String uName = regUsername.Text;
            String phone = phoneNum.Text;

            String fName = firstName.Text;
            String lName = lastName.Text;
            String mCode = majorCode.Text;
            String dateOfBirth = birthDate.Text;
            String addr = address.Text;
            int sem = int.TryParse(semester.Text, out sem) ? sem : 0;
            float grade = float.TryParse(gpa.Text, out grade) ? grade : 0;

            SqlCommand regProc = new SqlCommand("EXEC UserRegister @uid OUTPUT, @pass OUTPUT, @userType = @role, @username = @uname, @email = @mail, @first_name = @fname, @last_name = @lname, @birth_date = @date, @GPA = @grade, @semester = @sem, @address = @addr, @faculty_code = NULL, @major_code = @m_code, @company_name = NULL, @representative_name = NULL, @representative_email = NULL, @phone_number = @phone", conn);

            SqlParameter userID = regProc.Parameters.Add("@uid", sqlDbType: SqlDbType.Int);
            SqlParameter password = regProc.Parameters.Add("@pass", sqlDbType: SqlDbType.VarChar, 10);
            userID.Direction = ParameterDirection.Output;
            password.Direction = ParameterDirection.Output;

            regProc.Parameters.Add(new SqlParameter("@role", "Students"));
            regProc.Parameters.Add(new SqlParameter("@uname", uName));
            regProc.Parameters.Add(new SqlParameter("@mail", mail));
            regProc.Parameters.Add(new SqlParameter("@fname", fName));
            regProc.Parameters.Add(new SqlParameter("@lname", lName));
            regProc.Parameters.Add(new SqlParameter("@date", dateOfBirth));
            regProc.Parameters.Add(new SqlParameter("@grade", grade));
            regProc.Parameters.Add(new SqlParameter("@sem", sem));
            regProc.Parameters.Add(new SqlParameter("@addr", addr));
            regProc.Parameters.Add(new SqlParameter("@m_code", mCode));
            regProc.Parameters.Add(new SqlParameter("@phone", phone));

            conn.Open();
            regProc.ExecuteNonQuery();
            conn.Close();

            if ((int)userID.Value > 0)
            {
                Session["user_id"] = userID.Value;
                Response.Redirect("StudentView.aspx");
            }
            else
            {
                Response.Redirect("StudentRegistration.aspx");
                Response.Write("Registration Failed!");
            }
        }
    }
}