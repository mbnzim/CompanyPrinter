using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bussinesslogic;

namespace CompanyPrinter
{
    public partial class NewReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UserBL userBL = new UserBL();

            
            ReportDocument Report = new ReportDocument();
            
            Report.Load(Server.MapPath("~/UserProfiles.rpt"));
            Report.SetParameterValue("@username", (string)Session["useridsession"]);
            CrystalReportViewer1.ReportSource = Report;
            CrystalReportViewer1.DataBind();
        }
    }
}