﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BussinessObject
{
    public class Printer
    {
        public string PrinterName { get; set; } 
        public string FolderToMonitor { get; set; }
        public string OutputType { get; set; }
        public string FileOutput { get; set; }
        public Nullable<int> PrinterMakeID { get; set; }
        public byte Active { get; set; }
        public DateTime CreatedDate { get; set; }

        public virtual PrinterMake PrinterMake { get; set; }
    }
}
