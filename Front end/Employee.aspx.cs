using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MS3
{
    public partial class Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void EGT_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeGradeThesis.aspx");
        }

        protected void EGD_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeGradeDefense.aspx");
        }

        protected void EPR_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeCreateProgressReport.aspx");
        }
    }
}