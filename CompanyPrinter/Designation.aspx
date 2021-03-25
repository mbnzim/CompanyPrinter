<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Designation.aspx.cs" Inherits="CompanyPrinter.Designation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <form id="form1" runat="server">
    <div style="margin: 0px auto; padding-left: 370px; padding-right: 30px; overflow: auto;">
        <div>
            <table width="50%">
                <tr>
                    <td colspan="2" style="background-color: black; height: 30px; color: White;" align="center">
                        Designation 
                    </td>
                </tr>
                <tr>
                    <td>
                        Designation
                    </td>
                    <td>
                        <asp:TextBox ID="txtdesignation" Width="200px" runat="server"></asp:TextBox>
 
                    </td>
                </tr>
                
                <tr>
                    <td></td>
                    <td >
                        <asp:Button ID="BtnSave" runat="server" Width="100px" Text="Save" OnClick="BtnSave_Click" />
                        <asp:Button ID="BtnDelete" runat="server" Width="100px" Text="Delete" OnClick="BtnDelete_Click" />
                         <asp:Button ID="BtnDisplay" runat="server" Width="100px" Text="Display" OnClick="BtnDisplay_Click" />
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
