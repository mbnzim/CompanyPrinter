<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delete_popup.aspx.cs" Inherits="CompanyPrinter.Delete_popup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <telerik:RadLabel ID="txtprinter" Text="Delete Printers?" Font-Size="X-Large" runat="server"></telerik:RadLabel>
        <table>
            <tr>
                <td>
                    <telerik:RadLabel ID="lbprintername" Text="Printers" runat="server"></telerik:RadLabel>
                </td>         
            </tr>            
                 <tr>
           
                <td>
                    <telerik:RadButton ID="btnDeletePrinter" runat="server" Text="Delete" OnClick="btnDeletePrinter_Click" Height="21px"></telerik:RadButton>
                </td>
            </tr>

        </table>
        </div>
    </form>
</body>
</html>
