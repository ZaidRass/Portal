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

            if ((int) userID.Value == -1)
            {
                Response.Redirect("RegistrationPage.aspx");
                Response.Write("Wrong Email or Password!");
            }
            else
            {
                Session["user_id"] = userID.Value;
                Response.Redirect("ProfileView.aspx");
                Response.Write("great success!");
            }
        }

        protected void Register(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String userRole = userType.SelectedValue;
            String mail = regEmail.Text;
            String uName = regUsername.Text;
            String phone = phoneNum.Text;

            if (userRole.Equals("Students"))
            {
                String fName = firstName.Text;
                String lName = lastName.Text;
                String mCode = majorCode.Text;
                DateTime dateOfBirth = birthDate.SelectedDate;
                String addr = address.Text;
                int sem = int.Parse(semester.Text);
                float grade = float.Parse(gpa.Text);

                SqlCommand regProc = new SqlCommand("EXEC UserRegister @uid OUTPUT, @pass OUTPUT, @userType = @role, @username = @uname, @email = @mail, @first_name = @fname, @last_name = @lname, @birth_date = @date, @GPA = @grade, @semester = @sem, @address = @addr, @faculty_code = NULL, @major_code = @m_code, @company_name = NULL, @representative_name = NULL, @representative_email = NULL, @phone_number = @phone", conn);

                SqlParameter userID = regProc.Parameters.Add("@uid", sqlDbType: SqlDbType.Int);
                SqlParameter password = regProc.Parameters.Add("@pass", sqlDbType: SqlDbType.VarChar, 10);
                userID.Direction = ParameterDirection.Output;
                password.Direction = ParameterDirection.Output;

                regProc.Parameters.Add(new SqlParameter("@role", userRole));
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
            }

            if (true)
            {
                Response.Redirect("ProfileView.aspx");
                Response.Write(userRole);
            }
        }
    }
}