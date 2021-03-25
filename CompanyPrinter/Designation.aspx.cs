using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bussinesslogic;
using BussinessObject;
using DataAccess;

namespace CompanyPrinter
{
    public partial class Designation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            //BussinessObject.Designation ObjUBO = new BussinessObject.Designation();

            //ObjUBO.DesignationName = txtdesignation.Text;


            //UserBL objUBL = new UserBL();

            //int result = objUBL.SaveDesignation(ObjUBO);

            //var context = new ValidationContext(ObjUBO, serviceProvider: null, items: null);
            //var results = new List<ValidationResult>();
            //var isValid = Validator.TryValidateObject(ObjUBO, context, results, true);

            //if (!isValid)
            //{
            //    foreach (var validationResult in results)
            //    {
            //        Response.Write(validationResult.ErrorMessage.ToString());
            //    }

            //    return;
            //}

            //if (result > 0)
            //{
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data saved successfully')", true);

                if (txtdesignation.Text == "")
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Please Enter Designation Name')", true);
                }

                else
                {
                    BussinessObject.Designation ObjUBO = new BussinessObject.Designation();

                    ObjUBO.DesignationName = txtdesignation.Text;


                    UserBL objUBL = new UserBL();

                    int result = objUBL.SaveDesignation(ObjUBO);

                    if (result > 0)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Data saved successfully')", true);
                    }

                }

        }
        UserDA userDA = new UserDA();
        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            
            userDA.deleteDesignation(txtdesignation.Text);
        }

        protected void BtnDisplay_Click(object sender, EventArgs e)
        {
            userDA.displayDesignation(GridView1);
        }
    }
}