using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CompanyPrinter
{
    public partial class UpdateUser : System.Web.UI.Page
    {
        BussinessObject.CreateUser reg = new BussinessObject.CreateUser();
        protected void Page_Load(object sender, EventArgs e)
        {
            txtusername.Text = (string)Session["User"];

            //txtlastname.Text = "Mlu";
            //txtfirstname.Text = "Nzim";
            //txtemail.Text = "mbnzin@gmail.com";
            //txtpassword.Text = "123";
            //txtaddress.Text = "147 Ohlange Inanda";
            //RadDatePicker.SelectedDate = DateTime.Now;

        }

        protected void RegisterBtnSave_Click(object sender, EventArgs e)
        {
         

            String dateofbirth = RadDatePicker.SelectedDate.ToString();
            DateTime date1 = DateTime.Parse(dateofbirth);
            String date = date1.ToString("dd/MM/yyyy");

            DateTime datetime = DateTime.ParseExact(date, "dd/MM/yyyy", null);
            datetime = Convert.ToDateTime(datetime, System.Globalization.CultureInfo.GetCultureInfo("hi-IN").DateTimeFormat);


            reg.LastName = txtlastname.Text;
            reg.FirstName = txtfirstname.Text;   
            reg.Email = txtemail.Text;
            reg.UserName = (string)Session["User"];
            reg.Password = txtpassword.Text;
            reg.Address = txtaddress.Text;
            reg.DOB = datetime;


            Bussinesslogic.UserBL objUBL = new Bussinesslogic.UserBL();
            int result = objUBL.UserUpdate(reg.UserName, reg);
            if (result > 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data saved successfully')", true);
            }
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {

        }
    }
}