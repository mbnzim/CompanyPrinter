using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BussinessObject
{
    public class Document
    {

        public int printerID { get; set; }
        public int userID { get; set; }
        public string DocType { get; set; }
        public string DocUrl { get; set; }
        public DateTime CreatedDate { get; set; }



        public virtual Printer Printer { get; set; }
        public virtual CreateUser user { get; set; }
    }
}
