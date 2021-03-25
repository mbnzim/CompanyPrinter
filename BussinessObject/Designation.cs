using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BussinessObject
{
    public class Designation
    {
        [Required(ErrorMessage ="Designation Name Required")]
        public string DesignationName { get; set; }
    }
}
