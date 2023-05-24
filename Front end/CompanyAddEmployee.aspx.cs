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
    public partial class CompanyAddEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ADDEMPLOYEE_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int ComID = (int)Session["user_id"];
            String Em = CEMAIL.Text;
            String N = CNAME.Text;
            String NUM = CPHONENUMBER.Text;
            String Fiel = CFIELD.Text;
           

            SqlCommand AddEmployee = new SqlCommand("EXEC AddEmployee @ComapnyID=@ComID, @email=@Em, @name=@N, @phone_number=@NUM, @field=@Fiel ,@StaffID = @tempStaffID, @password = @tempPassword", conn);

            AddEmployee.Parameters.AddWithValue("@ComID", ComID);
            AddEmployee.Parameters.AddWithValue("@Em", Em);
            AddEmployee.Parameters.AddWithValue("@N", N);
            AddEmployee.Parameters.AddWithValue("@NUM", NUM);
            AddEmployee.Parameters.AddWithValue("@Fiel",Fiel);

            SqlParameter SID = AddEmployee.Parameters.Add("@tempStaffID", System.Data.SqlDbType.Int);
            SID.Direction = System.Data.ParameterDirection.Output;
            Label6.Text = SID.ToString();
            SqlParameter pass = AddEmployee.Parameters.Add("@tempPassword", System.Data.SqlDbType.VarChar, 10);
            pass.Direction = System.Data.ParameterDirection.Output;
            Label7.Text = pass.ToString();


            

            conn.Open();
            AddEmployee.ExecuteNonQuery();
            conn.Close();
        }
    }
}