using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussinessObject;
using DataAccess;

namespace CompanyPrinter
{
    public partial class updateuser_popup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtdesignation.SelectedIndex = -1;

                txtusername.Text = Session["UserName"].ToString();
                txtlastname.Text =  Session["LastName"].ToString();
                txtfirstname.Text =  Session["FirstName"].ToString();
                txtemail.Text =  Session["Email"].ToString();
                txtaddress.Text =  Session["Address"].ToString();
                //txtpassword.Text = Session["Password"].ToString();
                //lbdob = (DateTime)Session["DOB"];
                //Session["CreatedDate"];

            }
         
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DateTime dob = (DateTime)Session["DOB"];
            DateTime createddate = (DateTime)Session["CreatedDate"];
            CreateUser user = new CreateUser();
            user.UserName = txtusername.Text;
            user.LastName = txtlastname.Text;
            user.FirstName = txtfirstname.Text;
            user.Email = txtemail.Text;
            user.Address = txtaddress.Text;
            user.Password = txtpassword.Text;
            user.DesignationID = 1;
            user.DOB = dob ;
            user.CreatedDate = createddate;

            UserDA userDA = new UserDA();
            userDA.UpdateUser(user.UserName, user);
        }
    }
}