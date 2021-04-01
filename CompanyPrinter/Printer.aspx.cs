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
using DataAccess;
using Bussinesslogic;
using Telerik.Web.UI;

namespace CompanyPrinter
{
    public partial class Printer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtusername.Text = (string)Session["User"];
        }

        //protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        //{
        //    if (e.Item is GridDataItem)
        //    {
        //        GridDataItem item = (GridDataItem)e.Item;
        //        ImageButton imgbtn = (ImageButton)item["DeleteColumn"].Controls[0];
        //        imgbtn.Attributes.Add("OnClick", "return Click('" + item.ItemIndex + "');");
        //        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('')", true);
        //    }
        //}

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

        protected void Search_Button(object sender, EventArgs e)
        {
            UserBL userBL = new UserBL();
            userBL.SearchPrinters(RadGrid1, Convert.ToInt32(txtprintermake.SelectedValue), (DateTime)timestapfrom.SelectedDate, (DateTime)timestapto.SelectedDate);
        }

 

        protected void AddPrinter_Click(object sender, EventArgs e)
        {
            string script = "function f(){Open('" + addPrinterPopup.ClientID + "'); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, true);
        }

        protected void deletePrinter_Click(object sender, EventArgs e)
        {

        }
    }
}