using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CompanyPrinter
{
    public partial class Desinations : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lbtxtusername.Text = (string)Session["User"];
        }

 
        protected void Add_Click(object sender, EventArgs e)
        {
            string script = "function f(){Open('" + adddesignationpopup.ClientID + "'); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, true);
        }

        protected void Update_Click(object sender, EventArgs e)
        {

        }

        protected void Delete_Click(object sender, EventArgs e)
        {

        }
    }
}