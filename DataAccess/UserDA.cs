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
                con.Open();
                SqlCommand cmd = new SqlCommand("dbo.AddNewUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@lastname", reg.LastName);
                cmd.Parameters.AddWithValue("@firstname", reg.FirstName);
                cmd.Parameters.AddWithValue("@designationid", reg.DesignationID);
                cmd.Parameters.AddWithValue("@email", reg.Email);
                cmd.Parameters.AddWithValue("@username", reg.UserName);
                cmd.Parameters.AddWithValue("@password", reg.Password);
                cmd.Parameters.AddWithValue("@address", reg.Address);
                cmd.Parameters.AddWithValue("@dob", reg.DOB);
                cmd.Parameters.AddWithValue("@createddate", reg.CreatedDate);
                cmd.Parameters.AddWithValue("@LastModificationDate", reg.LastModificationDate);

                int Result = cmd.ExecuteNonQuery();
                cmd.Dispose();
                return Result;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public int UpdateUser(String username, CreateUser registration)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("dbo.UpdateUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", username);
                cmd.Parameters.AddWithValue("@lastname", registration.LastName);
                cmd.Parameters.AddWithValue("@firstname", registration.FirstName);
                cmd.Parameters.AddWithValue("@designationID", registration.DesignationID);
                cmd.Parameters.AddWithValue("@email", registration.Email);
                cmd.Parameters.AddWithValue("@password", registration.Password);
                cmd.Parameters.AddWithValue("@address", registration.Address);
                cmd.Parameters.AddWithValue("@dob", registration.DOB);
                cmd.Parameters.AddWithValue("@createddate", registration.CreatedDate);
                cmd.Parameters.AddWithValue("@LastModificationDate", registration.LastModificationDate);

                int Result = cmd.ExecuteNonQuery();
                cmd.Dispose();
                return Result;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public void searchUser(RadGrid radGrid, string username)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("dbo.searchUser", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@username", username);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                radGrid.DataSourceID = null;
                radGrid.DataSource = dt;
                radGrid.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public void deleteUser(String Username)
        {
            try
            {
                con.Open();
                string deleteQuery = "delete from Users Where UserName='" + Username + "'";
                SqlCommand cmd = new SqlCommand(deleteQuery, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }catch(Exception ex)
            {
                throw ex;
            }
        }
     


        //======================================================Designations==============================================
        public int AddDesignation(Designation ObjDesignation) 
        {
            try
            {
                SqlCommand cmd = new SqlCommand("dbo.AddDesignation", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@designationName", ObjDesignation.DesignationName);     
                con.Open();
                int Result = cmd.ExecuteNonQuery();
                cmd.Dispose();
                return Result;
            }
            catch(Exception ex)
            {
                throw ex;
            }
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
            catch(Exception ex)
            {
                throw ex;
            }

        }

        //======================================================Printers==============================================
        public int AddPrinter(Printer printer)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("dbo.AddPrinters", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PrinterName", printer.PrinterName);
                cmd.Parameters.AddWithValue("@FolderToMonitor", printer.FolderToMonitor);
                cmd.Parameters.AddWithValue("@OutputType", printer.OutputType);
                cmd.Parameters.AddWithValue("@FileOutput", printer.FileOutput);
                cmd.Parameters.AddWithValue("@PrinterMakeID", printer.PrinterMakeID);
                cmd.Parameters.AddWithValue("@Active", printer.Active);
                cmd.Parameters.AddWithValue("@Status", printer.Status);
                cmd.Parameters.AddWithValue("@CreatedDate", printer.CreatedDate);
                cmd.Parameters.AddWithValue("@LastModificationDate", printer.LastModificationDate);
                int Result = cmd.ExecuteNonQuery();
                cmd.Dispose();
                return Result;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        public void searchPrinters(RadGrid radGrid, int printermakeID, DateTime timefrom, DateTime timeto)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("dbo.searchPrinters", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@printermakeid", printermakeID);
                cmd.Parameters.AddWithValue("@timefrom ", timefrom);
                cmd.Parameters.AddWithValue("@timeto", timeto);
                cmd.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                radGrid.DataSourceID = null;
                radGrid.DataSource = dt;
                radGrid.DataBind();
                con.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public int UpdatePrinter(PrinterUpdate printer,int printid)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("dbo.UpdatePrinters", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@PrintersID", printid);
                cmd.Parameters.AddWithValue("@PrinterName",printer.PrinterName);
                cmd.Parameters.AddWithValue("@FolderToMonitor", printer.FolderToMonitor);
                cmd.Parameters.AddWithValue("@OutputType", printer.OutputType);
                cmd.Parameters.AddWithValue("@FileOutput", printer.FileOutput);
                cmd.Parameters.AddWithValue("@PrinterMakeID", printer.PrinterMakeID);
                cmd.Parameters.AddWithValue("@Active", printer.Active);
                cmd.Parameters.AddWithValue("@Status", printer.Status);
                cmd.Parameters.AddWithValue("@CreatedDate", printer.CreatedDate);
                cmd.Parameters.AddWithValue("@LastModificationDate", printer.LastModificationDate);
                int Result = cmd.ExecuteNonQuery();
                cmd.Dispose();
                return Result;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
