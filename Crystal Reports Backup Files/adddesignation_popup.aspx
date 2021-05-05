<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adddesignation_popup.aspx.cs" Inherits="CompanyPrinter.adddesignation_popup" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <telerik:RadLabel ID="RadLabel5" Text="Add Designation" runat="server"></telerik:RadLabel>
        <table>
            <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel1" Text="Designation Name" runat="server"></telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadTextBox ID="txtdesignationname1" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
              
                 <tr>
                <td></td>
                <td>
                    <telerik:RadButton ID="btnAddDesignation" runat="server" Text="Save" OnClick="btnAddDesignation_Click"></telerik:RadButton>
                </td>
            </tr>

        </table>
        </div>
    </form>
</body>
</html>