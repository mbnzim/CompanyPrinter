﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addprinter_pop.aspx.cs" Inherits="CompanyPrinter.addprinter_pop" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 29px;
        }
        .auto-style2 {
            left: 0px;
            top: -1px;
            height: 15px;
            width: 78px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div>
            <telerik:RadLabel ID="RadLabel5" Text="Add Printer"  Font-Size="Larger" runat="server" Font-Bold="True"></telerik:RadLabel>
        <fieldset class="rdfFieldset rdfBorders">
        <table>
            <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel1" Text="Printer Name" runat="server"></telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadTextBox ID="txtprintername1" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
               <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel2" Text="Folder To Monitor" runat="server"></telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadTextBox ID="txtfoldertomonitor1" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel3" Text="Out put Type" runat="server"></telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadTextBox ID="txtoutputtype1" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
                 <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel6" Text="File Ou tput" runat="server"></telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadTextBox ID="txtfileoutput1" runat="server"></telerik:RadTextBox>
                </td>
            </tr>
               <tr>
                <td>
                    <telerik:RadLabel ID="RadLabel4" Text="Printer Make" runat="server"></telerik:RadLabel>
                </td>
                <td>
                    <telerik:RadComboBox ID="cbprintermake1" runat="server" DataSourceID="SqlDataSource1" DataTextField="PrinterMakeName" DataValueField="PrinterMakeID"></telerik:RadComboBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT * FROM [PrinterMake]"></asp:SqlDataSource>
                </td>
            </tr>
              <tr>
                  <td></td>
                <td>
                <asp:RadioButton ID="radactive" runat="server"  text="Active" GroupName="rd"/>
                <asp:RadioButton ID="radinactive" runat="server"  text="Inactive" GroupName="rd"/>
                </td>
            </tr>
                 <tr>
                <td class="auto-style1"></td>
                <td class="auto-style1">
                    <telerik:RadButton ID="btnAddPrinter" runat="server" Text="Save" OnClick="btnAddPrinter_Click" CssClass="auto-style2"></telerik:RadButton>
                </td>
            </tr>

        </table>
        </fieldset>
        </div>
    </form>
</body>
</html>
