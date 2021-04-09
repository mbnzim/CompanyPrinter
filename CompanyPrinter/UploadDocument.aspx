<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UploadDocument.aspx.cs" Inherits="CompanyPrinter.UploadDocument" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" id="telerikClientEvents1">

</script>
    <style type="text/css">
        .auto-style1 {
            width: 368px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadStyleSheetManager ID="RadStyleSheetManager1" runat="server">
        </telerik:RadStyleSheetManager>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            <telerik:RadLabel ID="RadLabel5" Text="Upload Document" runat="server"></telerik:RadLabel>
        <table class="auto-style1">
            <tr>
              
                <td>
                    <telerik:RadUpload ID="RadUpload1" runat="server" Width="423px" TargetFolder="~/Files"></telerik:RadUpload>
                   
                </td>
            </tr>
              
                 <tr>
                
                <td>
                    <telerik:RadButton ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click"></telerik:RadButton>
                </td>
            </tr>

        </table>
        </div>
    </form>
</body>
</html>
