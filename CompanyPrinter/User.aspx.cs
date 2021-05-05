using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataAccess;
using Telerik.Web.UI;
using Bussinesslogic;

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
            userDA.searchUser(userRd, txtusername.Text);
        }


        protected void ClearPrinter_Click(object sender, EventArgs e)
        {
            userRd.DataSourceID = "SqlDataSource2";

        }

        protected void UserOnItemCommand(object sender, GridCommandEventArgs e)
        {
            string commandName = e.CommandName;

            if (e.CommandName == "EditUser")
            {
                string UserID = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["UserID"].ToString();
                e.Item.Selected = true;

                foreach (Telerik.Web.UI.GridDataItem printerVal in userRd.SelectedItems)
                {
                    //Session["UserID"] = Convert.ToString(printerVal["UserID"].Text);
                    Session["Userid"] = Convert.ToUInt32(UserID);
                    Session["UserName"] = Convert.ToString(printerVal["UserName"].Text);
                    Session["LastName"] = Convert.ToString(printerVal["LastName"].Text);
                    Session["FirstName"] = Convert.ToString(printerVal["FirstName"].Text);
                    Session["Email"] = Convert.ToString(printerVal["Email"].Text);
                    Session["Address"] = Convert.ToString(printerVal["Address"].Text);
                    Session["DOB"] = Convert.ToDateTime(printerVal["DOB"].Text);
                    Session["CreatedDate"] = Convert.ToDateTime(printerVal["CreatedDate"].Text);

                }
                string script = "function f(){Open('" + userupdatepopup.ClientID + "'); Sys.Application.remove_load(f);}Sys.Application.add_load(f);";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "key", script, true);

            }
            else if (e.CommandName == "DeleteUser")
            {
                string Userid = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["UserID"].ToString();

            }
            else if (e.CommandName == "Profile")
            {
                string id = e.Item.OwnerTableView.DataKeyValues[e.Item.ItemIndex]["UserID"].ToString();
                int userid = Convert.ToInt32(id);

                UserBL userBL = new UserBL();
                Session["useridsession"]= userBL.getUsername(userid);

                Response.Redirect("NewReport.aspx");
                

            }
        }
       
    }
}