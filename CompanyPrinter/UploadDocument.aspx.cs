using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BussinessObject;
using DataAccess;
using Bussinesslogic;

namespace CompanyPrinter
{
    public partial class UploadDocument : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            UserDA userDA = new UserDA();
            if (RadUpload1.UploadedFiles.Count >0)
            {
                foreach(Telerik.Web.UI.UploadedFile doc in RadUpload1.UploadedFiles)
                {
                    byte[] docarray = new byte[doc.InputStream.Length];
                    doc.InputStream.Read(docarray,0,docarray.Length);
                    UserBL userBL = new UserBL();
                    Document document = new Document();
                    document.DocType = doc.GetExtension().ToString();
                    document.DocUrl = docarray;
                    document.userID = Convert.ToInt32(Session["UserLoginId"]);
                    document.printerID = Convert.ToInt32(Session["PrintersID"]);
                    document.CreatedDate = DateTime.Now;                 
                    userDA.UplaodDocs(document);
                }
            }
        }
    }
}