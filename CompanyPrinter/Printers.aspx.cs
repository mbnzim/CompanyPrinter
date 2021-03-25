using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;


namespace CompanyPrinter
{
    public partial class Printers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect(FormsAuthentication.DefaultUrl);
            }
        }
        protected void SaveButton(object sender, EventArgs e)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('ValidateUser')", true);

            BussinessObject.Printer printer = new BussinessObject.Printer();

            printer.PrinterName = txtprintername.Text;
            printer.FolderToMonitor = txtfoldertomonitor.Text;
            printer.OutputType = txtoutputtype.Text;
            printer.FileOutput = txtfileoutput.Text;
            printer.PrinterMakeID = 1;
            printer.Active = 1;
            printer.CreatedDate = DateTime.Now;

            DataAccess.UserDA userDA = new DataAccess.UserDA();

            userDA.AddPrinter(printer);

        }
    }
}