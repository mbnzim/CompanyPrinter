using System;
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
        public int SaveDesignation(Designation objUserBL)  
        {
            try
            {
                UserDA objUserda = new UserDA();
                return objUserda.AddDesignation(objUserBL);  
            }
            catch
            {
                throw;
            }
        }

        public int UserRegistration(CreateUser reg)
        {
            try
            {
                UserDA userDA = new UserDA();
                return userDA.AddNewUser(reg);
            }
            catch
            {
                throw;
            }
        }
        public int UserUpdate(String username, CreateUser registration)
        {
            try
            {
                UserDA objUserda = new UserDA();
                CreateUser reg = new CreateUser();
                return objUserda.UpdateUser(username,registration);
            }
            catch
            {
                throw;
            }
        }

        public int SavePrinter(Printer printer)
        {
            try
            {
                UserDA userDA = new UserDA();
                return userDA.AddPrinter(printer);
            }
            catch
            {
                throw;
            }
        }
    }
        
    
}
