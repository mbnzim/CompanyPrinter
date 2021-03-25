<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="CompanyPrinter.Users" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<style>
   body {
     margin:0;
      font-family: "Lato", sans-serif;
    }

    .sidebar {
      margin-left:auto;
      margin-right:auto;
      padding: 0;
      width: 200px;
      background-color: #f1f1f1;
      position: fixed;
      height: 40%;
      overflow: auto;
    }

    .sidebar a {
      display: block;
      color: black;
      padding: 16px;
      text-decoration: none;
    }
 
    .sidebar a.active {
      background-color: #37474F;
      color: white;
    }

    .sidebar a:hover:not(.active) {
      background-color: #555;
      color: white;
    }

    div.content {
      margin-left: 200px;
      padding: 1px 16px;
      height: 1000px;
    }

    @media screen and (max-width: 700px) {
      .sidebar {
        width: 100%;
        height: auto;
        position: relative;
      }
      .sidebar a {float: left;}
      div.content {margin-left: 0;}
    }

    @media screen and (max-width: 400px) {
      .sidebar a {
        text-align: center;
        float: none;
      }
    }

    #form1{
        margin-top:0;
    }
</style>
</head>
<body>
    <div class="sidebar">
  <a class="active" href="#printers">Printers</a>
  <a href="#users">Users</a>
  <a href="#designation">Designations</a>
  <a href="#logout">Logout</a>
</div>
    <form id="form1" runat="server">
       
    <div style="margin-top:0; padding-left: 200px; padding-right: 50px; overflow: auto;">
        <div>
            <table style="width: 63%; margin-top:0" >
                <tr>
                    <td colspan="2" style="background-color: #37474F; height: 48px;margin-top:0 ;  padding-top: 0;color: White;" align="center">
                        All Users 
                    </td>
                </tr>
                <tr>
                    <td>
                        UserName
                    </td>
                    <td>
                        <asp:TextBox ID="txtusername" Width="200px" runat="server"></asp:TextBox>
 
                    </td>
                </tr>
                
                <tr>
                    <td></td>
                    <td >
                         <asp:Button ID="BtnAdd" runat="server" Width="100px" Text="Add" OnClick="BtnUAdd_Click" />
                        <asp:Button ID="BtnUpdate" runat="server" Width="100px" Text="Update" OnClick="BtnUpdate_Click" />
                        <asp:Button ID="BtnDelete" runat="server" Width="100px" Text="Delete" OnClick="BtnDelete_Click" />
                         <asp:Button ID="BtnDisplay" runat="server" Width="100px" Text="Display" OnClick="BtnDisplay_Click" />
                        <asp:Button ID="BtnDesignation" runat="server" Width="143px" Text="Add Designation" OnClick="BtnDesignation_Click" />
                    </td>
                 
                </tr>
                <tr>
                    <td></td>
                    <td>
                      <br />

                         <asp:GridView ID="GridView1" runat="server"></asp:GridView>

                    </td>
                </tr>
            </table>
          
        </div>
    </div>
  
    </form>
</body>
</html>
