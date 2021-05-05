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
    public static class MessageBox
    {
        public static void Show(Page Page, String Message)
        {
            Page.ClientScript.RegisterStartupScript(
               Page.GetType(),
               "MessageBox",
               "<script language='javascript'>alert('" + Message + "');</script>"
            );
        }
    }


//-------------------New Code--------------------

public partial class Printer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtusername.Text = (string)Session["User"];

            }
        }
        protected void RadGrid1_ItemCommand(object sender, GridCommandEventArgs e)
        {
            string commandName = e.CommandName;


            if (e.CommandName == "EditPrinter")
            {
                string PrinterID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EngenPrintersID"].ToString();
                e.Item.Selected = true;

                foreach (GridDataItem printerVal in RadGrid1.SelectedItems)
                {
                    Session["EngenPrintersID"] = Convert.ToInt32(printerVal["EngenPrintersID"].Text);
                    Session["PrinterName"] = Convert.ToString(printerVal["PrinterName"].Text);
                    Session["FolderToMonitor"] = Convert.ToString(printerVal["FolderToMonitor"].Text);
                    Session["OutputType"] = Convert.ToString(printerVal["OutputType"].Text);
                    Session["FileOutput"] = Convert.ToString(printerVal["FileOutput"].Text);
                    Session["CreatedDate"] = Convert.ToDateTime(printerVal["CreatedDate"].Text);

                }
                string script = "function f(){Open('" + updatePrinterPopup.ClientID + "'); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, true);


            }
            else if (e.CommandName == "Upload")
            {
                string PrinterID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["EngenPrintersID"].ToString();
                e.Item.Selected = true;
                foreach (GridDataItem printerVal in RadGrid1.SelectedItems)
                {
                    Session["PrintersID"] = Convert.ToInt32(printerVal["EngenPrintersID"].Text);
                }
                string script = "function f(){Open('" + uploadDocPopup.ClientID + "'); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, true);

            }
        }

        protected void Search_Button(object sender, EventArgs e)
        {
            try
            {
                if((DateTime)timestapto.SelectedDate >= (DateTime)timestapfrom.SelectedDate )
                {
                  
                        UserBL userBL = new UserBL();
                        userBL.SearchPrinters(RadGrid1, Convert.ToInt32(txtprintermake.SelectedValue), (DateTime)timestapfrom.SelectedDate, (DateTime)timestapto.SelectedDate);
                        lbsearchValidation.Visible = false;
                  
                }
                else
                {
                    lbsearchValidation.Visible =true;
                }
                       
            }
            catch (Exception)
            {

            }

        }

 
        //Adding Printer
        protected void AddPrinter_Click(object sender, EventArgs e)
        {
            string script = "function f(){Open('" + addPrinterPopup.ClientID + "'); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, true);
        }

        protected void deletePrinter_Click(object sender, EventArgs e)
        {
            DataTable dtPrinter = new DataTable();
            dtPrinter.Columns.Add("PrinterName");
            dtPrinter.Columns.Add("FolderToMonitor");
            dtPrinter.Columns.Add("OutputType");
            dtPrinter.Columns.Add("FileOutput");
            dtPrinter.Columns.Add("Active");
            //Session["dbPrinter"] = dtPrinter;

            DataTable dtPrinterIds = new DataTable();
            dtPrinterIds.Columns.Add("EngenPrintersID");
           

            if(RadGrid1.SelectedItems.Count > 0)
            {
                foreach (GridDataItem printer in RadGrid1.SelectedItems)
                {
                    dtPrinterIds.Rows.Add(Convert.ToInt32(printer["EngenPrintersID"].Text.ToString()));
                    dtPrinter.Rows.Add(printer["PrinterName"].Text.ToString(), printer["FolderToMonitor"].Text.ToString(), printer["OutputType"].Text.ToString(), printer["FileOutput"].Text.ToString(), printer["Active"].Text);
                }
                Session["EngenPrintersID"] = dtPrinterIds;
                Session["dbPrinter"] = dtPrinter;
            }

            string script = "function f(){Open('" + deletePrinterPopup.ClientID + "'); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, true);
   
        }

        //Update Printer
        protected void UpdatePrinter_Click(object sender, EventArgs e)
        {
            foreach (GridDataItem printerVal in RadGrid1.SelectedItems)
            {
                Session["EngenPrintersID"] = Convert.ToInt32(printerVal["EngenPrintersID"].Text);
                Session["PrinterName"] = Convert.ToString(printerVal["PrinterName"].Text);
                Session["FolderToMonitor"] = Convert.ToString(printerVal["FolderToMonitor"].Text);
                Session["OutputType"] = Convert.ToString(printerVal["OutputType"].Text);
                Session["FileOutput"] = Convert.ToString(printerVal["FileOutput"].Text);
                Session["CreatedDate"] = Convert.ToDateTime(printerVal["CreatedDate"].Text);

            }
            string script = "function f(){Open('" + updatePrinterPopup.ClientID + "'); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, true);

        }

        //upload documents
        protected void document_Click(object sender, EventArgs e)
        {
            foreach (GridDataItem printerVal in RadGrid1.SelectedItems)
            {
                Session["PrintersID"] = Convert.ToInt32(printerVal["EngenPrintersID"].Text);  
           }
            string script = "function f(){Open('" + uploadDocPopup.ClientID + "'); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, true);
        }

        protected void ClearPrinter_Click(object sender, EventArgs e)
        {
            RadGrid1.DataSourceID = "SqlDataSource2";
        }
    }
}