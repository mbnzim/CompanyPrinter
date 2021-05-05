<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="CompanyPrinter.WebForm1" %>

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
            background-color:#263238;
            height:50px;
            color:white;
            text-align:center
        }
        body{
            background-color:#CFD8DC;
            font-family: "Lato", sans-serif;
        }
    </style>
    <script src="Map.js"></script>
</head>
<body>
<%--     <script type='text/javascript'>
         function loadMapScenario() {
             var map;
             map = Microsoft.Maps.Map('#myMap', {});
             Microsoft.Maps.loadModule('Microsoft.Maps.AutoSuggest', {
                 callback: onLoad,
                 errorCallback: onError
             });
             function onLoad() {
                 var options = { maxResults: 5 };
                 var manager = new Microsoft.Maps.AutosuggestManager(options);
                 manager.attachAutosuggest('#txtaddress', '#searchBoxContainer', selectedSuggestion);
             }
             function onError(message) {
                 document.getElementById('printoutPanel').innerHTML = message;
             }
             function selectedSuggestion(suggestionResult) {
                 document.getElementById('printoutPanel').innerHTML =
                     'Suggestion: ' + suggestionResult.formattedSuggestion;
                     //'<br> Lat: ' + suggestionResult.location.latitude +
                     //'<br> Lon: ' + suggestionResult.location.longitude;
                 map.entities.clear();
                 //var push = new Microsoft.Maps.Pushpin(suggestionResult.location);
                 //map.entities.push(push);
                 map.setView({ bounds: suggestionResult.bestView });
             }
         }
     </script>--%>
  
     <script type='text/javascript' src='https://www.bing.com/api/maps/mapcontrol?key=AjwSRf95cl4Af4BJgEVNjx8mlfYrmfF0OdRQ1F1I8L5J9UXL9GALJN5G7PENgKlv&callback=loadMapScenario' async="async"></script>
<form id="form1" runat="server" >
          <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
    <br /><br /> <br /><br />
    <div style="margin: auto; overflow: auto;Width:522px">
        <div>   
          <telerik:RadCard ID="RadCard1" runat="server" Width="522px">
            <table class="auto-style3">
                <tr>
                    <td colspan="2" class="nav">
                          <telerik:RadLabel ID="RadLabel8" runat="server" Text="CREATE USER" Width="200px" ForeColor="White"  ></telerik:RadLabel> 
                        
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">
                        <br />
                        <telerik:RadLabel ID="RadLabel1" runat="server" Text="First Name" Width="100px"></telerik:RadLabel>
                        
                    </td>
                    <td class="auto-style1">
                        <br />
                        <asp:TextBox ID="txtfirstname" Width="200px" runat="server"></asp:TextBox>
                        <asp:Label ID="lbfirstname" runat="server" Text="First Name Required" ForeColor="Red" Visible="False"></asp:Label>
                    </td>
                </tr>
                       <tr>
                    <td class="auto-style2">
                            <telerik:RadLabel ID="RadLabel2" runat="server" Text="Last Name"></telerik:RadLabel>                  
                    </td>
                    <td class="auto-style1">
                        <asp:TextBox ID="txtlastname" Width="200px" runat="server"></asp:TextBox>
                          <asp:Label ID="lblastname" runat="server" Text="Last Name Required" ForeColor="Red" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                       <telerik:RadLabel ID="RadLabel3" runat="server" Text="Designation"></telerik:RadLabel>
                    </td>
                    <td class="auto-style1">
                        <telerik:RadComboBox ID="txtdesignation" runat="server" DataSourceID="SqlDataSource1" DataTextField="DesignationName" DataValueField="DesignationID"  Width="200px"></telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT * FROM [Designations]"></asp:SqlDataSource>
                    </td>
                </tr>
   
                 <tr>
                    <td class="auto-style2">
                        <telerik:RadLabel ID="RadLabel6" runat="server" Text="Address"></telerik:RadLabel>
                    </td>
                    <td class="auto-style1">
                        <div id='searchBoxContainer'><asp:TextBox ID="txtaddress" Width="200px" runat="server"></asp:TextBox></div>
                        <asp:Label ID="lbaddress" runat="server" Text="Address Required" ForeColor="Red" Visible="False"></asp:Label>
                          <div id='printoutPanel'></div>  
                       
                    </td>
                     
                </tr>
                <tr>
                    <td></td>
                    <td>
                         <div id='myMap' style='width: 350px; height: 300px;'></div>
                    </td>
                </tr>
                 <tr>
                    <td class="auto-style2">
                        <telerik:RadLabel ID="RadLabel7" runat="server" Text="Date Of Birth"></telerik:RadLabel>
                    </td>
                    <td class="auto-style1">
                        <telerik:RadDatePicker ID="RadDatePicker" runat="server"  Width="200px"></telerik:RadDatePicker>
                          <asp:Label ID="lbdob" runat="server" Text="Date Of Birth Required" ForeColor="Red" Visible="False"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2"></td>
                    <td class="auto-style1" >
                        <telerik:RadButton ID="CreateButton" runat="server" Text="Ceate User" OnClick="CreateButton_Click" ></telerik:RadButton>
       
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
