using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bussinesslogic;

namespace CompanyPrinter
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
    
        }
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CompanyPrinterDB"].ToString());
        protected void LoginButton_Click(object sender, EventArgs e)
        {
                
            con.Open();
            string UserLoginQuery = "select Count(*) from Users Where UserName='" + txtusername.Text+ "' AND Password='"+ txtpassword.Text+"'";
            SqlCommand cmd = new SqlCommand(UserLoginQuery, con);
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
          
            if (dt.Rows[0][0].ToString() == "1")
            {
                UserBL userBL = new UserBL();
                Session["User"] = txtusername.Text;
                Session["UserLoginId"] = userBL.getUserId(txtusername.Text);
                Response.Redirect("Printer.aspx");
            }
            else {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Username or Password is incorrect')", true);

            }
            con.Close();      
        }
    }
}