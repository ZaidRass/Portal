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
    public partial class CompanyGradeDefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CGRADE_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int CID = (int)Session["user_id"];
            int StudentID = int.Parse(CGDSID.Text);
            String Def = CGDLOCATION.Text;
            Decimal G = decimal.Parse(CGDGRADE.Text);

            SqlCommand CompanyGradedefense = new SqlCommand("EXEC CompanyGradedefense @Company_id=@CID ,@sid=@StudentID,@defense_location= @Def, @Company_grade= @G",conn);

            CompanyGradedefense.Parameters.AddWithValue("@CID",CID);
            CompanyGradedefense.Parameters.AddWithValue("@StudentID", StudentID);
            CompanyGradedefense.Parameters.AddWithValue("@Def", Def);
            CompanyGradedefense.Parameters.AddWithValue("@G",G);

            conn.Open();
            CompanyGradedefense.ExecuteNonQuery();
            conn.Close();

        }
    }
}