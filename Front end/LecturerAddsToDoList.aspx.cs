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
    public partial class LecturerAddsToDoList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void TODOADD_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int Mid = int.Parse(TODOMID.Text);
            String List = TODOLIST.Text;

            SqlCommand LecturerAddToDo = new SqlCommand("EXEC LecturerAddToDo @meeting_id=@Mid,  @to_do_list =@List",conn);

            LecturerAddToDo.Parameters.AddWithValue("@Mid", Mid);
            LecturerAddToDo.Parameters.AddWithValue("@List", List);

            conn.Open();
            LecturerAddToDo.ExecuteNonQuery();
            conn.Close();
        }
    }
}