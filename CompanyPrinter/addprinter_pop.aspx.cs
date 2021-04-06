using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CompanyPrinter
{
    public partial class addprinter_pop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddPrinter_Click(object sender, EventArgs e)
        {

            BussinessObject.Printer printer = new BussinessObject.Printer();

            printer.PrinterName = txtprintername1.Text;
            printer.FolderToMonitor = txtfoldertomonitor1.Text;
            printer.OutputType = txtoutputtype1.Text;
            printer.FileOutput = txtfileoutput1.Text;
            printer.PrinterMakeID = Convert.ToInt32(cbprintermake1.SelectedValue);
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
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Printer has been added successfully')", true);
            }
            Server.TransferRequest(Request.Url.AbsolutePath, false);
        }
    }
}