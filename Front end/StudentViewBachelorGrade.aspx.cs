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
    public partial class StudentViewBachelorGrade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int StudentID = (int)Session["user_id"];


            SqlCommand ViewMyBachelorProjectGrade = new SqlCommand("EXEC ViewMyBachelorProjectGrade @BachelorGrade OUTPUT,@sid=@StudentID", conn);

            ViewMyBachelorProjectGrade.Parameters.AddWithValue("@StudentID", StudentID);


            SqlParameter Grade = ViewMyBachelorProjectGrade.Parameters.Add("@BachelorGrade", System.Data.SqlDbType.Decimal);
            Grade.Direction = System.Data.ParameterDirection.Output;
            Label2.Text = Grade.ToString();
            conn.Open();
            ViewMyBachelorProjectGrade.ExecuteNonQuery();
            conn.Close();
             


        }

       
    }
}