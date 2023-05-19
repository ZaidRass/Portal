using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace MS3
{
    public partial class TempLol : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int id = (int) Session["user_id"];

            SqlCommand viewProfile = new SqlCommand("ViewProfile", conn);
            viewProfile.CommandType = CommandType.StoredProcedure;

            viewProfile.Parameters.Add(new SqlParameter("@user_id", id));

            conn.Open();
            
            SqlDataReader rdr = viewProfile.ExecuteReader(CommandBehavior.CloseConnection);
            
            while (rdr.Read())
            {
                String tempID = rdr.GetOrdinal("userID").ToString();
                String tempUsername = rdr.GetString(rdr.GetOrdinal("userName"));
                String tempMail = rdr.GetString(rdr.GetOrdinal("email"));
                String tempString = tempID + " " + tempUsername + " " + tempMail;
                //creating a lable to put the names in it 
                Label l = new Label();
                l.Text = tempString + ",\n";
                //add lable to the form of this page
                form1.Controls.Add(l);
            }
            conn.Close();
            
        }
    }
}