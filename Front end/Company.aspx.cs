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
    public partial class Company : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CADDEMP_Click(object sender, EventArgs e)
        {

            Response.Redirect("CompanyAddEmployee.aspx");
        }

        protected void CCREATEPROJECT_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompanyCreateProject.aspx");
        }

        protected void CGRADETHESIS_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompanyGradeThesis.aspx");
        }

        protected void CGRADEDEFENSE_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompanyGradeDefense.aspx");
        }

        protected void CGRADEPR_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompanyGradeProgressReport.aspx");
        }

        protected void CASSIGNEMPS_Click(object sender, EventArgs e)
        {
            Response.Redirect("CompanyAssignsemployees.aspx");
        }
    }
}