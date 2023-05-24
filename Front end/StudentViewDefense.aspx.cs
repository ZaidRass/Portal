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
    public partial class StudentViewDefense : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //could be done inside the page load
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int StudentID = (int)Session["User_id"];

            SqlCommand ViewMyDefense = new SqlCommand("ViewMyDefense @sid=@StudentID", conn);

            ViewMyDefense.Parameters.Add("@StudentID", StudentID);

            conn.Open();
            ViewMyDefense.ExecuteNonQuery();

            SqlDataReader reader = ViewMyDefense.ExecuteReader();
            ye.DataSource = reader;
            ye.DataBind();

            conn.Close();


        }

        
    }
}