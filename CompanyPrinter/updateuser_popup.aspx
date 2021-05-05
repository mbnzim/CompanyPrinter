<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="updateuser_popup.aspx.cs" Inherits="CompanyPrinter.updateuser_popup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: -1px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <telerik:RadLabel ID="RadLabel5" Text="Update User" runat="server"></telerik:RadLabel>
        <table>
              <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel4" Text="Username" runat="server"></telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadTextBox ID="txtusername" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel1" Text="First Name" runat="server"></telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadTextBox ID="txtfirstname" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel8" Text="Last Name" runat="server"></telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadTextBox ID="txtlastname" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
               <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel2" Text="Email" runat="server"></telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadTextBox ID="txtemail" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
                    
       
            <tr>
              <td class="auto-style2">
                 <telerik:RadLabel ID="RadLabel3" runat="server" Text="Designation"></telerik:RadLabel>
               </td>
                <td>
                    <telerik:RadComboBox ID="txtdesignation" runat="server" DataSourceID="SqlDataSource1" DataTextField="DesignationName" DataValueField="DesignationID" EmptyMessage="Select Designation"></telerik:RadComboBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT * FROM [Designations]"></asp:SqlDataSource>
                </td>
                </tr>
            <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel6" Text="Address" runat="server"></telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadTextBox ID="txtaddress" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
                   <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel9" Text="Password" runat="server"></telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadTextBox ID="txtpassword" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
               <%--  <tr>
                    <td class="auto-style2">
                        <telerik:RadLabel ID="RadLabel7" runat="server" Text="Date Of Birth"></telerik:RadLabel>
                    </td>
                    <td class="auto-style1">
                        <telerik:RadDatePicker ID="RadDatePicker" runat="server"  Width="200px"></telerik:RadDatePicker>
                          <asp:Label ID="lbdob" runat="server" Text="Date Of Birth Required" ForeColor="Red" Visible="False"></asp:Label>
                    </td>
                </tr>--%>
     
                <tr>
                <td></td>
                <td>
                    <telerik:RadButton ID="btnAddSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="auto-style1" Skin="Sunset"></telerik:RadButton>
                </td>
            </tr>

        </table>
        </div>
        </div>
    </form>
</body>
</html>
