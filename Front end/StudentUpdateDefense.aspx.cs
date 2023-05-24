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
    public partial class StudentUpdateDefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int StudentID = (int)Session["User_id"];
            String C = TextBox2.Text;

            SqlCommand UpdateMyDefense = new SqlCommand("EXEC UpdateMyDefense @sid =@StudentID ,@defense_content=@C", conn);

            UpdateMyDefense.Parameters.Add("@StudentID",StudentID);
            UpdateMyDefense.Parameters.Add("@C",C);

            conn.Open();

            UpdateMyDefense.ExecuteNonQuery();

            conn.Close();

        }
    }
}