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
    public partial class LecturerViewExternalExaminer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand ViewEE = new SqlCommand("Exec ViewEE",conn);

            conn.Open();
            ViewEE.ExecuteNonQuery();
            SqlDataReader rdr = ViewEE.ExecuteReader();
            Zaid.DataSource = rdr;

            Zaid.DataBind();



            conn.Close();

            
        }
    }
}