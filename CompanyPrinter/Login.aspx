<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CompanyPrinter.Login" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 572px;
        }
        .auto-style2 {
            width: 280px;
            padding-left:16px;
        }
        .auto-style3 {
            width: 522px;
        }
        .nav{
            background-color:#dc443c;
            height:50px;
            color:white;
            text-align:center
        }
        body{
            background-color:#f5f5f5;
            font-family: "Lato", sans-serif;
        }
    </style>
</head>
<body>

<form id="form1" runat="server" >
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br /><br /> <br /><br />
    <div style="margin: auto; overflow: auto;Width:522px">
        <div>   
          <telerik:RadCard ID="RadCard1" runat="server" Width="522px">
            <table class="auto-style3">
                <tr>
                    <td colspan="2" class="nav">
                          <telerik:RadLabel ID="RadLabel8" runat="server" Text="LOGIN" Width="200px" ForeColor="White" Font-Bold="true"  ></telerik:RadLabel> 
                        
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">
                        <br />
                        <telerik:RadLabel ID="RadLabel1" runat="server" Text="Username" Width="100px"></telerik:RadLabel>
                        
                    </td>
                    <td class="auto-style1">
                        <br />
                        <asp:TextBox ID="txtusername" Width="200px" runat="server"></asp:TextBox>
                        <asp:Label ID="lbusername" runat="server" Text="First Name Required" ForeColor="Red" Visible="False"></asp:Label>
                 </td>
                 </tr>
                       <tr>
                    <td class="auto-style2">
                            <telerik:RadLabel ID="RadLabel2" runat="server" Text="Password"></telerik:RadLabel>                  
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtpassword" Width="200px" runat="server"  TextMode="Password"></asp:TextBox >
                          <asp:Label ID="lbpassword" runat="server" Text="Last Name Required" ForeColor="Red" Visible="False"></asp:Label>
                    </td>
                </tr>
             
                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style1" >
                        <telerik:RadButton ID="LoginButton" runat="server" Text="Login" OnClick="LoginButton_Click" Font-Size="Small"></telerik:RadButton>
       
                    </td>
                </tr>
                
            </table>
              <br />
      </telerik:RadCard>
        </div>
    </div>
    </form>
</body>
</html>
