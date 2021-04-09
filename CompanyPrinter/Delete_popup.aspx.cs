using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CompanyPrinter
{
    public partial class Delete_popup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbprintername.Text = Session["PrinterNameDelete"].ToString();
            }
        }

        protected void btnDeletePrinter_Click(object sender, EventArgs e)
        {
           
        }
    }
}