<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Delete_popup.aspx.cs" Inherits="CompanyPrinter.Delete_popup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: -1px;
            height: 26px;
        }
        .auto-style2 {
            height: 31px;
        }
    </style>
</head>
<body style="height: 177px">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <telerik:RadLabel ID="txtprinter" Text="Are you Sure you want to delete Printer(s)?" Font-Size="X-Large" runat="server"></telerik:RadLabel>
        <table>
            <tr>
                <td>
                    <telerik:RadGrid ID="rdDelete" runat="server"></telerik:RadGrid>
                </td>         
            </tr>            
                 <tr>
           
                <td class="auto-style2">
                    <telerik:RadButton ID="btnDeletePrinter" runat="server" Text="Delete" OnClick="btnDeletePrinter_Click" CssClass="auto-style1"></telerik:RadButton>
                </td>
            </tr>

        </table>
        </div>
    </form>
</body>
</html>
