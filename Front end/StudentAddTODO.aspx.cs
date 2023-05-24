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
    public partial class StudentAddTODO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int MID = int.Parse(TextBox1.Text);
            String content = TextBox2.Text;

            SqlCommand StudentAddToDo = new SqlCommand("EXEC StudentAddToDo @meeting_id =@MID, @to_do_list=@content", conn);

            StudentAddToDo.Parameters.Add("@MID", MID);
            StudentAddToDo.Parameters.Add("@content", content);

            conn.Open();
            StudentAddToDo.ExecuteNonQuery();
            conn.Close();
        }
    }
}