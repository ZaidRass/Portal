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
    public partial class StudentMakesPreferences : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int StudentID = (int)Session["user_id"];
            String bachCode = TextBox1.Text;
            int PrefNume = int.Parse(TextBox2.Text);

            SqlCommand MakePreferencesLocalProject = new SqlCommand("EXEC MakePreferencesLocalProject @sid=@StudentID, @bachelor_code=@bachCode, @preference_number=@PrefNume",conn);

            MakePreferencesLocalProject.Parameters.AddWithValue("@StudentID",StudentID);
            MakePreferencesLocalProject.Parameters.AddWithValue("@bachCode", bachCode);
            MakePreferencesLocalProject.Parameters.AddWithValue("@PrefNume", PrefNume);

            conn.Open();
            MakePreferencesLocalProject.ExecuteNonQuery();
            conn.Close();

        }
    }
}