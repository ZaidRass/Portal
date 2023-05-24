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
    public partial class StudentViewThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ViewMyThesis = new SqlCommand("EXEC ViewMyThesis @sid = @StudentID, @title=@Thesis_title", conn);

            int StudentID = (int)Session["User_id"];
            String Thesis_Tilte = Thesis_title.Text;

            ViewMyThesis.Parameters.Add("@StudentID", StudentID);
            ViewMyThesis.Parameters.Add("Thesis_title", Thesis_Tilte);

            conn.Open();

            ViewMyThesis.ExecuteNonQuery();

            SqlDataReader rdr = ViewMyThesis.ExecuteReader();

            Grid.DataSource = rdr;
            Grid.DataBind();

            conn.Close();

        }
    }
}