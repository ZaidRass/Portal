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
    public partial class CompanyAssignsemployees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CAEMP_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            String Bach = CAE.Text;
            int StffID = int.Parse(CSID.Text);
            int CID = (int)Session["user_id"];

            SqlCommand AssignEmployee = new SqlCommand("EXEC AssignEmployee @bachelor_code=@Bach, @staff_id=@StaffID,@Company_id=@CID",conn);

            AssignEmployee.Parameters.AddWithValue("@Bach",Bach);
            AssignEmployee.Parameters.AddWithValue("@StaffID",StffID);
            AssignEmployee.Parameters.AddWithValue("@CID",CID);

            conn.Open();
            AssignEmployee.ExecuteNonQuery();
            conn.Close();
        }
    }
}