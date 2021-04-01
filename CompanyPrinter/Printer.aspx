﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Printer.aspx.cs" Inherits="CompanyPrinter.Printer" %>

<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI.ComboBox" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var disableAjax = false;
        function mngRequestStarted(ajaxManager, eventArgs) {
            if (disableAjax || eventArgs.get_eventTarget().indexOf("ExportToExcelButton") >= 0) {
                disableAjax = false;
                eventArgs.set_enableAjax(false);
            }
        }

        </script>
     <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'  media="screen" />

    <style>
        .userloggedin{
            margin-left:80%;
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <telerik:RadAjaxLoadingPanel ID="rad1" runat="server" Transparency="25" />
       <div>
       <div class="userloggedin">
           <asp:Label ID="txtusername" runat="server" Font-Size="X-Large" Text="username"></asp:Label>
       </div>
        

       <div class="title2">
            <telerik:RadLabel ID="RadLabel1" runat="server" Text="Printers" Font-Size="X-Large" Font-Bold="true"></telerik:RadLabel>
       </div>  
      
    <telerik:RadAjaxPanel ID="radAjxPanelMain" runat="server" LoadingPanelID="rad1" ClientEvents-OnRequestStart="mngRequestStarted">
     <%--         <script type="text/javascript">
                  $(function () {
                      $("#btnShowLogin").click(function () {
                          $('#LoginModal').modal('show');
                      });
                  });
              </script>--%>
        <script src="popup.js"></script>
        <br/><br/>
        <div style="margin-top:0; padding-left: 0; padding-right: 50px; overflow: auto;">
        <div>
           
            <div class="container">
                  
               <%--  <telerik:RadLabel ID="lbusername" Text="Username" runat="server"></telerik:RadLabel>--%>
                 <div class="card">          
                  <telerik:RadCard ID="RadCard1" runat="server" Width="500px" >
                    <table>
                        <tr>
                            <td>
                                <telerik:RadLabel ID="RadLabel2" runat="server" Text="Printer Make" Font-Size="Small"></telerik:RadLabel>
                            </td>
                         <td class="auto-style1">
                        <telerik:RadComboBox ID="txtprintermake" runat="server" DataSourceID="SqlDataSource1" DataTextField="PrinterMake" DataValueField="PrinterMakeID"  Width="270px"></telerik:RadComboBox>
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
                              
                                <%--<telerik:RadButton ID="btnShowAddPrinter" runat="server" Text="Add Printer"></telerik:RadButton>--%>
                                <telerik:RadButton ID="SearchButton" runat="server" OnClick="Search_Button" Text="Search"></telerik:RadButton>                         
                                <telerik:RadButton ID="RadButton4" runat="server" Text="Clear"></telerik:RadButton>                   
                            </td>
                        </tr>
                    </table>
                  </telerik:RadCard>     
                </div>      
                  <%--<input type = "button" id="btnShowLogin" value = "Add Printer" />--%>
              <%--<telerik:RadButton id="btnShowLogin1" runat="server" Text="Add Printer"></telerik:RadButton>--%>
                <telerik:RadButton ID="btnAddPrinter" runat="server" Text="Add Printer" OnClick="AddPrinter_Click"></telerik:RadButton>
                   <telerik:RadButton ID="btnDelete" runat="server" Text="Delete" OnClick="deletePrinter_Click"></telerik:RadButton>
                      <br /><br />
                  <telerik:RadGrid ID="RadGrid1" runat="server" 
                      DataSourceID="SqlDataSource2" Width="1016px"  
                      AllowPaging="True" 
                      AllowMultiRowSelection="True" 
                      AllowFilteringByColumn= "True" 
                      CssClass="auto-style1"> 
                      <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                      <ClientSettings Selecting-AllowRowSelect="true">
                      <Selecting AllowRowSelect="True" />
                      </ClientSettings>
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
                              <telerik:GridCheckBoxColumn DataField="Active" DataType="System.Boolean" FilterControlAltText="Filter Active column" HeaderText="Active" SortExpression="Active" UniqueName="Active">
                              </telerik:GridCheckBoxColumn>
                              <telerik:GridBoundColumn DataField="CreatedDate" DataType="System.DateTime" FilterControlAltText="Filter CreatedDate column" HeaderText="CreatedDate" SortExpression="CreatedDate" UniqueName="CreatedDate">
                              </telerik:GridBoundColumn>
                              <telerik:GridButtonColumn ButtonType="ImageButton"  CommandName="Edit" FilterControlAltText="Filter EditColumn column"  HeaderText="Edit"
                                  ImageUrl="Images/edit.png" Text="Edit" UniqueName="EditColumn" Resizable="false" ConfirmText="Edit record?">
                                  <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>
                                  <ItemStyle CssClass="ButtonColumn"  />
                              </telerik:GridButtonColumn> 

                             <%--<telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" FilterControlAltText="Filter DeleteColumn column"  HeaderText="Delete"
                                  ImageUrl="Images/delete.png" Text="Delete" UniqueName="DeleteColumn" Resizable="false" ConfirmText="Delete record?">
                                  <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>
                                  <ItemStyle CssClass="ButtonColumn" />
                              </telerik:GridButtonColumn>--%>

                               <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Add" FilterControlAltText="Filter addColumn column"  HeaderText="Document"
                                  ImageUrl="Images/add.png" Text="add" UniqueName="addColumn" Resizable="false" ConfirmText="add record?">
                                  <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>
                                  <ItemStyle CssClass="ButtonColumn" />
                              </telerik:GridButtonColumn>
                              
                                <%--<telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" Text="Delete" UniqueName="DeleteColumn"/>--%>

                          </Columns>
                      </MasterTableView>
            </telerik:RadGrid>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT [PrinterName], [FolderToMonitor], [OutputType], [FileOutput], [Active], [CreatedDate] FROM [Printers]"></asp:SqlDataSource>
        </div>
        </div> 
      <telerik:RadWindow ID="addPrinterPopup" runat="server" NavigateUrl="~/addprinter_pop.aspx"></telerik:RadWindow>
    </div>     
       <%-- <div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="ModalTitle" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            &times;</button>
                        <h4 class="modal-title" id="ModalTitle">  Add Printer</h4> </div>

            <div class="modal-body">
                <label for="txtprintername"> Printer Name</label>
                <asp:TextBox ID="txtprintername" runat="server" CssClass="form-control" placeholder="Enter Username" />
                <br />

                <label for="txtfoldertomonitor"> Folder To Monitor</label>
                  <asp:TextBox ID="txtfoldertomonitor" runat="server" CssClass="form-control" placeholder="Enter Username" />
                <br />

                <label for="txtoutputtype"> Out put Type</label>
                    <asp:TextBox ID="txtoutputtype" runat="server" CssClass="form-control" placeholder="Enter Username"/>
                <br />

                <label for="txtfileoutput"> File Ou tput</label>
                <asp:TextBox ID="txtfileoutput" runat="server" CssClass="form-control" placeholder="Enter Username"/>
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
                    <asp:Button ID="btnSave" Text="Save" runat="server"  OnClick="SaveButton" Class="btn btn-primary"  data-dismiss="modal" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Clear</button>
                </div>
              </div>
             </div>
          </div>--%>
       </telerik:RadAjaxPanel>      
   </div> 
</asp:Content>
