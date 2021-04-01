using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussinessObject;
using DataAccess;

namespace CompanyPrinter
{
    public partial class updatePrinterspopup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtprintername1.Text = Session["PrinterName"].ToString();
                txtfoldertomonitor1.Text = Session["FolderToMonitor"].ToString();
                txtoutputtype1.Text = Session["OutputType"].ToString();
                txtfileoutput1.Text = Session["FileOutput"].ToString();
                
            }
            
        }

        protected void btnAddPrinter_Click(object sender, EventArgs e)
        {
            int printerId = Convert.ToInt32(Session["EngenPrintersID"]);
            PrinterUpdate printer = new PrinterUpdate();

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

            UserDA userDA = new UserDA();
            userDA.UpdatePrinter(printer, printerId);
        }
    }
}