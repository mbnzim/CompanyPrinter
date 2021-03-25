using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataAccess;

namespace CompanyPrinter
{
    public partial class Users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        UserDA userDA = new UserDA();
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            userDA.deleteUser(txtusername.Text);
        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            Session["User"] = txtusername.Text;
            Response.Redirect("UpdateUser.aspx");
        }

        protected void BtnDisplay_Click(object sender, EventArgs e)
        {
            userDA.displayAllUsers(GridView1);
        }

        protected void BtnUAdd_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }

        protected void BtnDesignation_Click(object sender, EventArgs e)
        {
            Response.Redirect("Designation.aspx");
        }
    }
}