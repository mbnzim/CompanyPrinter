using CrystalDecisions.CrystalReports.Engine;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CompanyPrinter
{
    public partial class NewReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ReportDocument Report = new ReportDocument();
            Report.Load(Server.MapPath("~/UserProfile02.rpt"));
          //  Report.SetDatabaseLogon("sa", "sa123", "Rakesh-PC", "RakeshData");
            CrystalReportViewer1.ReportSource = Report;
        }
    }
}