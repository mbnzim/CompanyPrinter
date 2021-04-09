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
    public partial class UploadDocument : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if(RadUpload1.UploadedFiles.Count >0)
            {
                foreach(Telerik.Web.UI.UploadedFile doc in RadUpload1.UploadedFiles)
                {
                    Document document = new Document();
                    document.DocType = doc.GetExtension().ToString();
                    document.DocUrl = @"\\Files\" + doc.FileName.ToString();
                    document.userID = 1;
                    document.printerID = 1;
                    document.CreatedDate = DateTime.Now;

                    UserDA userDA = new UserDA();
                    userDA.UplaodDocs(document);
                }
            }
        }
    }
}