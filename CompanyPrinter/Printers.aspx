<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Printers.aspx.cs" Inherits="CompanyPrinter.Printers" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI.ComboBox" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'  media="screen" />
<style>
   body {
     margin:0;
      font-family: "Lato", sans-serif;
    }

    .sidebar {
      margin-top:0;
      margin-left:auto;
      margin-right:auto;
      padding: 0;
      width: 200px;
      background-color: #f1f1f1;
      position: fixed;
      height: 60%;
      overflow: auto;
      margin-top:0;
      padding-left: 0;
      padding-right: 0;
    }

    .sidebar a {
      display: block;
      color: black;
      padding: 16px;
      text-decoration: none;
    }
 
    .sidebar a.active {
      background-color: #90A4AE;
      color: white;
    }

    .sidebar a:hover:not(.active) {
      background-color: #263238;
      color: white;
    }

    div.content {
      margin-left: 200px;
      padding: 1px 16px;
      height: 1000px;
    }

    @media screen and (max-width: 700px) {
      .sidebar {
        width: 100%;
        height: auto;
        position: relative;
      }
      .sidebar a {float: left;}
      div.content {margin-left: 0;}
    }

    @media screen and (max-width: 400px) {
      .sidebar a {
        text-align: center;
        float: none;
      }
    }
    .card{
        margin:0 261px;
        padding:20px
    }
    #form1{
        margin-top:0;
    }
    .RadGrid .t-font-icon.rgIcon.rgEditIcon:before {
    content: "\f044";
    color: orange;
}

    .auto-style1 {
        margin-left: 22px;
    }
    .navbar{
        width:85%;
        background-color: #37474F;
        height: 52px;
        margin-top:0 ;
        margin-bottom:0;
        padding-bottom:0;
        padding-top: 0;
        border-radius:0
        
    }
    form1{
        margin-left:auto;
        margin-right:auto
    }

    .container{
        margin-left:200px;
    }
    .title1{
        color:white;
        text-align:center;
        padding-bottom:60px
    }
</style>

</head>
<body>




 <form id="form1" runat="server">
     <script type="text/javascript">
         $(function () {
             $("#btnShowAddPrinter").click(function () {
                 $('#LoginModal').modal('show');
             });
         });
     </script>
     
    <div style="margin-top:0; padding-left: 200px; padding-right: 50px; overflow: auto;">
        <div>
            <div class="navbar">  
              <h3 class="title1">Pinters</h3>                                  
           </div>

          <div class="sidebar">
              <a class="active" href="#printers">Printers</a>
              <a href="#users">Users</a>
              <a href="#designation">Designations</a>
              <a href="#logout">Logout</a>
              </div>

            <div class="container">
            <div class="card">      
                  <telerik:RadCard ID="RadCard1" runat="server" Width="500px" >
                    <table>
                        <tr>
                            <td>
                                <telerik:RadLabel ID="RadLabel2" runat="server" Text="Printer Make" Font-Size="Small"></telerik:RadLabel>
                            </td>
                         <td class="auto-style1">
                        <telerik:RadComboBox ID="txtdesignation" runat="server" DataSourceID="SqlDataSource1" DataTextField="PrinterMake" DataValueField="PrinterMakeID"  Width="270px"></telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT * FROM [PrinterMake]"></asp:SqlDataSource>
                    </td>
                      </tr>
                        <tr>
                            <td>
                                <telerik:RadLabel ID="RadLabel3" runat="server" Text="Create TimeStap From" Font-Size="Small" Width="200px"></telerik:RadLabel>
                            </td>
                            <td>
                                   <telerik:RadDatePicker ID="timestapfrom" runat="server"  Width="270px"></telerik:RadDatePicker>
                            </td>
                        </tr>
                               <tr>
                            <td>
                                <telerik:RadLabel ID="RadLabel4" runat="server" Text="Create TimeStap To" Font-Size="Small" Width="200px"></telerik:RadLabel>
                            </td>
                            <td>
                                  <telerik:RadDatePicker ID="timestapto" runat="server"  Width="270px"></telerik:RadDatePicker>
                            </td>
                        </tr>
                        <tr>
                            <td> </td>
                            <td>
                                 <telerik:RadButton ID="btnShowAddPrinter" runat="server" Text="Add Printer"></telerik:RadButton>
                                <telerik:RadButton ID="RadButton2" runat="server" Text="Search"></telerik:RadButton>
                                <telerik:RadButton ID="RadButton3" runat="server" Text="Delete"></telerik:RadButton>
                                <telerik:RadButton ID="RadButton4" runat="server" Text="Clear"></telerik:RadButton>
                    
                            </td>
                        </tr>
                    </table>
                  </telerik:RadCard>     
                </div>
                  <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource2" Width="1016px"  AllowPaging="true" AllowMultiRowSelection="true" AllowFilteringByColumn= "true" CssClass="auto-style1">
                      <ClientSettings Selecting-AllowRowSelect="true">   </ClientSettings>
                      <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                          <Columns>
                              <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" />   
                              <telerik:GridBoundColumn DataField="PrinterName" FilterControlAltText="Filter PrinterName column" HeaderText="PrinterName" SortExpression="PrinterName" UniqueName="PrinterName">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="FolderToMonitor" FilterControlAltText="Filter FolderToMonitor column" HeaderText="FolderToMonitor" SortExpression="FolderToMonitor" UniqueName="FolderToMonitor">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="OutputType" FilterControlAltText="Filter OutputType column" HeaderText="OutputType" SortExpression="OutputType" UniqueName="OutputType">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="FileOutput" FilterControlAltText="Filter FileOutput column" HeaderText="FileOutput" SortExpression="FileOutput" UniqueName="FileOutput">
                              </telerik:GridBoundColumn>
                              <telerik:GridCheckBoxColumn DataField="Active"  DataType="System.Boolean" FilterControlAltText="Filter Active column" HeaderText="Active" SortExpression="Active" UniqueName="Active">
                              </telerik:GridCheckBoxColumn>
                              <telerik:GridBoundColumn DataField="CreatedDate" DataType="System.DateTime" FilterControlAltText="Filter CreatedDate column" HeaderText="CreatedDate" SortExpression="CreatedDate" UniqueName="CreatedDate">
                              </telerik:GridBoundColumn>
                             
                   <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Edit" FilterControlAltText="Filter EditColumn column"  HeaderText="Edit"
                      ImageUrl="Images/edit.png" Text="Edit" UniqueName="EditColumn" Resizable="false" ConfirmText="Edit record?">
                      <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>
                      <ItemStyle CssClass="ButtonColumn" />
                  </telerik:GridButtonColumn> 

                    <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" FilterControlAltText="Filter DeleteColumn column"  HeaderText="Delete"
                      ImageUrl="Images/delete.png" Text="Delete" UniqueName="DeleteColumn" Resizable="false" ConfirmText="Delete record?">
                      <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>
                      <ItemStyle CssClass="ButtonColumn" />
                  </telerik:GridButtonColumn>

                   <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Add" FilterControlAltText="Filter addColumn column"  HeaderText="Document"
                      ImageUrl="Images/add.png" Text="add" UniqueName="addColumn" Resizable="false" ConfirmText="add record?">
                      <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>
                      <ItemStyle CssClass="ButtonColumn" />
                  </telerik:GridButtonColumn>

                          </Columns>
                      </MasterTableView>
            </telerik:RadGrid>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT [PrinterName], [FolderToMonitor], [OutputType], [FileOutput], [Active], [CreatedDate] FROM [Printers]"></asp:SqlDataSource>
        </div>
    </div>   
<div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle"
    aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;</button>
                <h4 class="modal-title" id="ModalTitle">
                    Add Printer</h4>
            </div>

            <div class="modal-body">
                <label for="txtprintername"> Printer Name</label>
                <asp:TextBox ID="txtprintername" runat="server" CssClass="form-control" required />
                <br />

                <label for="txtfoldertomonitor"> Folder To Monitor</label>
                <asp:TextBox ID="txtfoldertomonitor" runat="server" CssClass="form-control"  required/>
                <br />

                <label for="txtoutputtype"> Out put Type</label>
                <asp:TextBox ID="txtoutputtype" runat="server" CssClass="form-control" required />
                <br />

                <label for="txtfileoutput"> File Ou tput</label>
                <asp:TextBox ID="txtfileoutput" runat="server" CssClass="form-control"  required/>
                <br />

                 <label for="txtprinterMake"> Printer Make</label>
                  <telerik:RadComboBox ID="cbprintermake" runat="server" DataSourceID="SqlDataSource3" DataTextField="PrinterMake" DataValueField="PrinterMakeID"  Width="200px"></telerik:RadComboBox>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT * FROM [PrinterMake]"></asp:SqlDataSource>
                <br />
                <br />
                <asp:RadioButton ID="radactive" runat="server"  text="Active" GroupName="rd"/>
                <asp:RadioButton ID="radinactive" runat="server"  text="Inactive" GroupName="rd"/>

                <div id="dvMessage" runat="server" visible="false" class="alert alert-danger">
                    <strong>Error!</strong>
                    <asp:Label ID="lblMessage" runat="server" />
                </div>
            </div>
            <div class="modal-footer">
                <asp:Button ID="btnSave" Text="Save" runat="server"  OnClick="SaveButton" Class="btn btn-primary" />
                <button type="button" class="btn btn-default" data-dismiss="modal">Clear</button>
            </div>
        </div>
    </div>
</div>

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
  </div>
</form>
</body>
</html>