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
    public partial class Lecturer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
       
        protected void ViewProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerProfile.aspx");
        }

        protected void CreateProjectBUT_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerCreatesProject.aspx");
        }

        protected void SpecifytThesisBUT_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerSpecifiesThesis.aspx");
        }

        protected void CM_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerCreatesMeeting.aspx");
        }

        protected void ADDTODOLIST_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerAddsToDoList.aspx");
        }

        protected void ViewMeetings_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerViewMeetings.aspx");
        }

        protected void ViewEE_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerViewExternalExaminer.aspx");
        }

        protected void Supervise_Industrial_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerSupervisesIndustrial.aspx");
        }

        protected void Grade_Thesis_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerGradeThesis.aspx");
        }

        protected void Grade_defense_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerGradeDefense.aspx");
        }

        protected void Create_Progress_Report_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerCreatesProgressReport.aspx");
        }

        protected void Grade_Progress_Report_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerGradesProgressReport.aspx");
        }

        protected void RecEE_Click(object sender, EventArgs e)
        {
            Response.Redirect("LecturerRecommendsEE.aspx");
        }
    }
}