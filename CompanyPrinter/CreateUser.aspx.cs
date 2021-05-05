using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;

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
                Response.Redirect("User.aspx");
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
            reg.LastModificationDate = DateTime.Now;


            Bussinesslogic.UserBL objUBL = new Bussinesslogic.UserBL();
            int result = objUBL.UserRegistration(reg);
            if (result > 0)
            {
               
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User has been created successfully')", true);
            }
            //Send Email
            MailMessage Msg = new MailMessage();
            Msg.From = new MailAddress("companyprintez@gmail.com", "Admin");// Sender details here, replace with valid value
            Msg.Subject = ("New Registration"); // subject of email
            Msg.To.Add(reg.Email); //Add Email id, to which we will send email
            Msg.Body = ("Dear" + reg.FirstName + '\n' + "You have been registered on the Company Printers employee system.Your login details are as follows:" + '\n' + '\n' + "Username" + reg.UserName + '\n' + reg.Password + '\n' + '\n' + "Kind Regards" + '\n' + "Admin");
            Msg.IsBodyHtml = true;
            Msg.Priority = MailPriority.High;



            SmtpClient smtp = new SmtpClient();
            smtp.UseDefaultCredentials = false; // to get rid of error "SMTP server requires a secure connection"
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.Credentials = new System.Net.NetworkCredential("mbnzim@gmail.com", "MrFeather123456");// replace with valid value
            smtp.EnableSsl = true;
            smtp.Timeout = 20000;



            //smtp.Send(Msg);
        }

    }
}