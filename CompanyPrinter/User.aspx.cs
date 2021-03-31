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
            userDA.searchUser(RadGrid1, txtusername.Text);
        }
    }
}