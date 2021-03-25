﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccess; 
using BussinessObject;   

namespace Bussinesslogic
{
    public class UserBL
    {
        //===============================Users==============================
        public int UserRegistration(CreateUser reg)
        {
            try
            {
                UserDA userDA = new UserDA();
                return userDA.AddNewUser(reg);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public int UserUpdate(String username, CreateUser registration)
        {
            try
            {
                UserDA objUserda = new UserDA();
                CreateUser reg = new CreateUser();
                return objUserda.UpdateUser(username, registration);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        //===============================Designations========================
        public int SaveDesignation(Designation designation)
        {
            try
            {
                UserDA objUserda = new UserDA();
                return objUserda.AddDesignation(designation);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        //===============================Printers==============================
        public int SavePrinter(Printer printer)
        {
            try
            {
                UserDA userDA = new UserDA();
                return userDA.AddPrinter(printer);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        //===============================PrinterMake==============================

        //===============================Documents==============================

    }
}
