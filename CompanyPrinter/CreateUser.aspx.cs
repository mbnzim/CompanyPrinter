using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CompanyPrinter
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CompanyPrinterDB"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            }
        }


        protected void CreateButton_Click(object sender, EventArgs e)
        {
            if (txtfirstname.Text == "")
            {
                lbfirstname.Visible = true;
            }
            if (txtlastname.Text == "")
            {
                lblastname.Visible = true;            
            }          
            if (txtaddress.Text == "")
            {
                lbaddress.Visible = true;             
            }
            if (RadDatePicker.SelectedDate == null)
            {
                lbdob.Visible = true;             
            }  
            if(lbfirstname.Visible==false && lblastname.Visible==false && lbaddress.Visible==false && lbdob.Visible==false)
            {
                CreateUser();
            }
        }

        protected void CreateUser()
        {
            BussinessObject.CreateUser reg = new BussinessObject.CreateUser();

            reg.LastName = txtlastname.Text;
            reg.FirstName = txtfirstname.Text;
            reg.DesignationID = Convert.ToInt32(txtdesignation.SelectedValue);
            reg.Email = txtlastname.Text + "@printers.com";
            reg.UserName = txtfirstname.Text + txtlastname.Text;
            reg.Password = "123@Printers";
            reg.Address = txtaddress.Text;
            reg.DOB = (DateTime)RadDatePicker.SelectedDate;
            reg.CreatedDate = DateTime.Now;


            Bussinesslogic.UserBL objUBL = new Bussinesslogic.UserBL();
            int result = objUBL.UserRegistration(reg);
            if (result > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User has been created successfully')", true);
            }
        }

    }
}