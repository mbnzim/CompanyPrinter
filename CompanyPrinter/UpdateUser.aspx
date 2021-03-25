<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateUser.aspx.cs" Inherits="CompanyPrinter.UpdateUser" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

<form id="form1" runat="server">
          <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <div style="margin: 0px auto; padding-left: 370px; padding-right: 30px; overflow: auto;">
        <div>
            <table width="50%">
                <tr>
                    <td colspan="2" style="background-color: black; height: 30px; color: White;" align="center">
                        Update User 
                    </td>
                </tr>
                 <tr>
                    <td>
                        Username
                    </td>
                    <td>
                        <asp:Label ID="txtusername" runat="server" Text="Label"></asp:Label>
                       <%-- <asp:TextBox ID="txtusername" Width="200px" runat="server"></asp:TextBox>--%>
                    </td>
                </tr>
                <tr>
                    <td>
                        First Name
                    </td>
                    <td>
                        <asp:TextBox ID="txtfirstname" Width="200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                       <tr>
                    <td>
                        Last Name
                    </td>
                    <td>
                        <asp:TextBox ID="txtlastname" Width="200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
       
                <tr>
                    <td>
                        Email
                    </td>
                    <td>
                        <asp:TextBox ID="txtemail" Width="200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
               
                 <tr>
                    <td>
                        Password
                    </td>
                    <td>
                        <asp:TextBox ID="txtpassword" Width="200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
       
                 <tr>
                    <td>
                        Address
                    </td>
                    <td>
                        <asp:TextBox ID="txtaddress" Width="200px" runat="server"></asp:TextBox>
                    </td>
                </tr>
                 <tr>
                    <td>
                        Date Of Birth
                    </td>
                    <td>
                        <telerik:RadDatePicker ID="RadDatePicker" runat="server"></telerik:RadDatePicker>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td >
                        <asp:Button ID="BtnSave" runat="server" Width="100px" Text="Save" OnClick="RegisterBtnSave_Click" />
                          <asp:Button ID="BtnCancel" runat="server" Width="100px" Text="Cancel" OnClick="BtnCancel_Click" />
                    
                    </td>
                </tr>
                
            </table>
        </div>
    </div>
    </form>
</body>
</html>
