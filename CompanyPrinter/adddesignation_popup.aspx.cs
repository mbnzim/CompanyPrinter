using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bussinesslogic;
using BussinessObject;

namespace CompanyPrinter
{
    public partial class adddesignation_popup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddDesignation_Click(object sender, EventArgs e)
        {
            BussinessObject.Designation designation = new BussinessObject.Designation();
            designation.DesignationName = txtdesignationname1.Text;

            UserBL userBL = new UserBL();
            userBL.SaveDesignation(designation);
        }
    }
}