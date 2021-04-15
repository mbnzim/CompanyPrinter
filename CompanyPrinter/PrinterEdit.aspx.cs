using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace CompanyPrinter
{
    public partial class PrinterEdit : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            if (Request.QueryString["EngenPrintersID"] == null)
            {
                RadDataForm1.IsItemInserted = true;
            }
            else
            {
                RadDataForm1.EditIndex = 0;
            }
        }
        protected void RadDataForm1_ItemCommand(object sender, Telerik.Web.UI.RadDataFormCommandEventArgs e)
        {
            if (e.CommandName == "Update")
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind();", true);
            }
            else if (e.CommandName == "PerformInsert")
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CloseAndRebind('navigateToInserted');", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "mykey", "CancelEdit();", true);
            }
        }
        protected void RadDataForm1_PreRender(object sender, EventArgs e)
        {
            if (RadDataForm1.Skin != SelectedSkin)
            {
                RadDataForm1.Skin = SelectedSkin;
                RadDataForm1.Rebind();
            }
        }
        public string SelectedSkin
        {
            get
            {
                return /*(string)Session[Telerik.Quick.QSFConstants.SelectedSkinLiteral] ??*/ ConfigurationManager.AppSettings["Telerik.Skin"];
            }
        }


        //protected void RadGrid1_ItemDataBound(object sender, GridItemEventArgs e)
        //{
        //    if (e.Item is GridEditFormItem && e.Item.IsInEditMode)//the grid is about to Edit.
        //    {
        //        GridEditFormItem item = (GridEditFormItem)e.Item;
        //        RadComboBox combo = (RadComboBox)item.FindControl("cbprintermake1");
        //        combo.DataSourceID = "SqlDataSource1";
        //        combo.DataTextField = "PrinterMake";
        //        combo.DataValueField = "PrinterMakeID";
        //        TextBox txt = (TextBox)item["PrinterMakeID"].Controls[0];
        //        combo.SelectedValue = txt.Text;
        //    }
        //}
    }
}
