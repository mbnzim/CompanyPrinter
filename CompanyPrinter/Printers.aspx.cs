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

            BussinessObject.Printer printer = new BussinessObject.Printer();

            printer.PrinterName = txtprintername.Text;
            printer.FolderToMonitor = txtfoldertomonitor.Text;
            printer.OutputType = txtoutputtype.Text;
            printer.FileOutput = txtfileoutput.Text;
            printer.PrinterMakeID = Convert.ToInt32(cbprintermake.SelectedValue);
            printer.CreatedDate = DateTime.Now;

            if (radactive.Checked)
            {
                printer.Active = 1;
            }
            else
            {
                printer.Active = 0;
            }

            Bussinesslogic.UserBL userBL = new Bussinesslogic.UserBL();

            int result = userBL.SavePrinter(printer);
            if (result > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Printer has been added successfully')", true);
            }
        }
    }
}