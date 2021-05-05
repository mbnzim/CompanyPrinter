using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using Telerik.Web.UI;

namespace CompanyPrinter
{
	public partial class User : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            lbtxtusername.Text = (string)Session["User"];
        }

        protected void RadButton1_Click(object sender, EventArgs e)
        {
			Response.Redirect("CreateUser.aspx");
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            UserDA userDA = new UserDA();
            userDA.searchUser(userRd, txtusername.Text);
        }

        //protected void btnUpdate_Click(object sender, EventArgs e)
        //{
        //    foreach (Telerik.Web.UI.GridDataItem printerVal in userRd.SelectedItems)
        //    {
        //        Session["UserName"] = Convert.ToString(printerVal["UserName"].Text);
        //        Session["LastName"] = Convert.ToString(printerVal["LastName"].Text);
        //        Session["FirstName"] = Convert.ToString(printerVal["FirstName"].Text);
        //        Session["Email"] = Convert.ToString(printerVal["Email"].Text);
        //        Session["Address"] = Convert.ToString(printerVal["Address"].Text);
        //        Session["DOB"] = Convert.ToDateTime(printerVal["DOB"].Text);
        //        Session["Password"] = Convert.ToString(printerVal["Password"]);
        //        Session["CreatedDate"] = Convert.ToDateTime(printerVal["CreatedDate"].Text);

              

        //    }
        //    string script = "function f(){Open('" + userupdatepopup.ClientID + "'); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
        //    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, true);
        //}

        //protected void btnDelete_Click(object sender, EventArgs e)
        //{
        
        //}
    }
}