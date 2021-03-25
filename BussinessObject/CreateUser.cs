using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BussinessObject
{
    public class CreateUser
    {
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public Nullable<int> DesignationID { get; set; }
        public string Email { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Address { get; set; }
        public DateTime DOB { get; set; }
        public DateTime CreatedDate { get;set;}

        public virtual Designation Designation { get; set; }
    }
}
