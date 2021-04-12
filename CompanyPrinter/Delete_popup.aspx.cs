using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bussinesslogic;
using BussinessObject;
using DataAccess;

namespace CompanyPrinter
{
    public partial class Delete_popup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtDeletePrinter = (DataTable)Session["dbPrinter"];
                rdDelete.DataSource = dtDeletePrinter;
                DataTable dtDeletePrinterID = (DataTable)Session["EngenPrintersID"];
                rdDelete.DataBind();
            }
        }

        protected void btnDeletePrinter_Click(object sender, EventArgs e)
        {
            DataTable dtDeletePrinter = (DataTable)Session["dtPrinter"];
            DataTable dtDeletePrinterIds = (DataTable)Session["EngenPrintersID"];
            foreach(DataRow drPrinter in dtDeletePrinterIds.Rows)
            {
                BussinessObject.Printer printer = new BussinessObject.Printer();
                UserBL userBL = new UserBL();
                printer.PrinterID = Convert.ToInt32(drPrinter["EngenPrintersID"]);
                

                userBL.delePrinter(printer);
            }
        }
    }
}