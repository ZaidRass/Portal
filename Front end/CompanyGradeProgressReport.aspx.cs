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
    public partial class CompanyGradeProgressReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Grade_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int CID = (int)Session["user_id"];
            int StudentID = int.Parse(PRSID.Text);
            DateTime Date2 = PRDATE.SelectedDate;
            Decimal Grade = decimal.Parse(PRGRADE.Text);


            SqlCommand CompanyGradePR = new SqlCommand("EXEC CompanyGradePR @Company_id=@CID, @sid=@StudentID, @date=@Date2, @Company_grade =@Grade ",conn);

            CompanyGradePR.Parameters.AddWithValue("@CID",CID);
            CompanyGradePR.Parameters.AddWithValue("@StudentID",StudentID);
            CompanyGradePR.Parameters.AddWithValue("@Date2",Date2);
            CompanyGradePR.Parameters.AddWithValue("@Grade",Grade);

            conn.Open();
            CompanyGradePR.ExecuteNonQuery();
            conn.Close();
        }
    }
}