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
    public partial class CompanyCreateProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CREATELP_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["MS3"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            int CID = (int)Session["user_id"];
            String PROJC = CLPPROJCODE.Text;
            String CTITLE = CLPTITLE.Text;
            String CDESCRIPTION = CLPDESCRIPTION.Text;
            String CMAJORCODE = CLPMAJORCODE.Text;

            SqlCommand CompanyCreateLocalProject = new SqlCommand("EXEC CompanyCreateLocalProject @company_id= @CID, @proj_code=@PROJC, @title= @CTITLE, @description = @CDESCRIPTION, @major_code = @CMAJORCODE ",conn);

            CompanyCreateLocalProject.Parameters.AddWithValue("@CID", CID);
            CompanyCreateLocalProject.Parameters.AddWithValue("@PROJC",PROJC);
            CompanyCreateLocalProject.Parameters.AddWithValue("@CTITLE", CTITLE);
            CompanyCreateLocalProject.Parameters.AddWithValue("@CDESCRIPTION", CDESCRIPTION);
            CompanyCreateLocalProject.Parameters.AddWithValue("@CMAJORCODE", CMAJORCODE);


            conn.Open();
            CompanyCreateLocalProject.ExecuteNonQuery();
            conn.Close();
        }
    }
}