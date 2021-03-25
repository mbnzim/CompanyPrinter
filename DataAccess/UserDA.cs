using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data; 
using System.Data.SqlClient; 
using System.Configuration;   
using BussinessObject;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace DataAccess
{
    public class UserDA
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["CompanyPrinterDB"].ToString());

        //======================================================Users==============================================
        public int AddNewUser(CreateUser reg)
        {
            try
            {
                string insertQuery = "insert into Users(LastName,FirstName,DesignationID,Email,UserName,Password,Address,DOB,CreatedDate)values (@lastname,@firstname,@designationid,@email,@username,@password,@address,@dob,@createddate)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@lastname", reg.LastName);
                cmd.Parameters.AddWithValue("@firstname", reg.FirstName);
                cmd.Parameters.AddWithValue("@designationid", reg.DesignationID);
                cmd.Parameters.AddWithValue("@email", reg.Email);
                cmd.Parameters.AddWithValue("@username", reg.UserName);
                cmd.Parameters.AddWithValue("@password", reg.Password);
                cmd.Parameters.AddWithValue("@address", reg.Address);
                cmd.Parameters.AddWithValue("@dob", reg.DOB);
                cmd.Parameters.AddWithValue("@createddate", reg.CreatedDate);
                con.Open();
                int Result = cmd.ExecuteNonQuery();
                cmd.Dispose();
                return Result;
            }
            catch
            {
                throw;
            }
        }

        public void displayAllUsers(GridView gridview)
        {
            con.Open();
            string displayQuery = "select * from Users";
            SqlCommand cmd = new SqlCommand(displayQuery, con);
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            gridview.DataSource = dt;
            gridview.DataBind();
            con.Close();
        }

        public int UpdateUser(String username, CreateUser registration)
        {
            try
            {
                con.Open();
                string updateQuery = "UPDATE Users SET LastName = @lastname,FirstName = @firstname,Email = @email,Password = @password,Address = @address,DOB = @dob Where UserName ='" + username + "'";
                SqlCommand cmd = new SqlCommand(updateQuery, con);
                cmd.Parameters.AddWithValue("@lastname", registration.LastName);
                cmd.Parameters.AddWithValue("@firstname", registration.FirstName);
                //cmd.Parameters.AddWithValue("@designationid", registration.DesignationID);
                cmd.Parameters.AddWithValue("@email", registration.Email);
                //cmd.Parameters.AddWithValue("@username", registration.UserName);
                cmd.Parameters.AddWithValue("@password", registration.Password);
                cmd.Parameters.AddWithValue("@address", registration.Address);
                cmd.Parameters.AddWithValue("@dob", registration.DOB);

                int Result = cmd.ExecuteNonQuery();
                cmd.Dispose();
                //Response.Write("alert('DATA UPDATED')");
                return Result;
            }
            catch
            {
                throw;
            }
        }


        public void deleteUser(String Username)
        {
            con.Open();
            string deleteQuery = "delete from Users Where UserName='" + Username + "'";
            SqlCommand cmd = new SqlCommand(deleteQuery, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        //======================================================Designations==============================================
        public int AddDesignation(Designation ObjDesignation) 
        {
            try
            {
                string insertQuery = "insert into Designations(DesignationName)values (@designationName)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);

                cmd.Parameters.AddWithValue("@designationName", ObjDesignation.DesignationName);
        
                con.Open();
                int Result = cmd.ExecuteNonQuery();
                cmd.Dispose();
                return Result;
            }
            catch
            {
                throw;
            }
        }

        public void displayDesignation(GridView gridview )
        {
            con.Open();
            string displayQuery = "select * from Designations";
            SqlCommand cmd = new SqlCommand(displayQuery, con);
            cmd.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            gridview.DataSource = dt;
            gridview.DataBind();
            con.Close();
        }


        public void deleteDesignation(String designationName)
        {
            try
            {
                con.Open();
                string deleteQuery = "delete from Designations Where DesignationName='" + designationName + "'";
                SqlCommand cmd = new SqlCommand(deleteQuery, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch
            {
                throw;
            }

        }

        //======================================================Printers==============================================
        public int AddPrinter(Printer printer)
        {
            try
            {
                string insertQuery = "insert into Printers(PrinterName,FolderToMonitor,OutputType,FileOutput,PrinterMakeID,Active,CreatedDate)values (@PrinterName,@FolderToMonitor,@OutputType,@FileOutput,@PrinterMakeID,@Active,@CreatedDate)";
                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@PrinterName", printer.PrinterName);
                cmd.Parameters.AddWithValue("@FolderToMonitor", printer.FolderToMonitor);
                cmd.Parameters.AddWithValue("@OutputType", printer.OutputType);
                cmd.Parameters.AddWithValue("@FileOutput", printer.FileOutput);
                cmd.Parameters.AddWithValue("@PrinterMakeID", printer.PrinterMakeID);
                cmd.Parameters.AddWithValue("@Active", printer.Active);
                cmd.Parameters.AddWithValue("@CreatedDate", printer.CreatedDate);

                con.Open();
                int Result = cmd.ExecuteNonQuery();
                cmd.Dispose();
                return Result;
            }
            catch
            {
                throw;
            }
        }
       
    }
}
