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
    public partial class StudentSubmitThesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        { // return to this if he wants to make a pdf document
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int StudentId = (int)Session["user_id"];
            String ThesisTitle = TextBox2.Text;
            String PDF = TextBox3.Text;
           
            SqlCommand SubmitMyThesis = new SqlCommand("EXEC SubmitMyThesis @sid=@StudentID, @title=@ThesisTitle,@PDF_Document=@PDF", conn);

            SubmitMyThesis.Parameters.Add("@StudentID",StudentId);
            SubmitMyThesis.Parameters.Add("@ThesisTitle", ThesisTitle);
            SubmitMyThesis.Parameters.Add("@PDF",PDF);


            conn.Open();
            SubmitMyThesis.ExecuteNonQuery();
            Response.Redirect("StudentView.aspx");
            conn.Close();
        }
    }
}