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
       <div>
       <div class="userloggedin">
           <asp:Label ID="txtusername" runat="server" Font-Size="X-Large" Text="username"></asp:Label>
       </div>   
       <div class="title2">
            <telerik:RadLabel ID="RadLabel1" runat="server" Text="Printers" Font-Size="X-Large" Font-Bold="true"></telerik:RadLabel>
       </div>  
      
    <telerik:RadAjaxPanel ID="radAjxPanelMain" runat="server" LoadingPanelID="rad1" ClientEvents-OnRequestStart="mngRequestStarted">
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
                        <telerik:RadComboBox ID="txtprintermake" runat="server" DataSourceID="SqlDataSource1" DataTextField="PrinterMake" DataValueField="PrinterMakeID"  Width="270px" EmptyMessage="Select Printer Make"></telerik:RadComboBox>
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
                <telerik:RadButton ID="btnUpdate" runat="server" Text="Update" OnClick="UpdatePrinter_Click"></telerik:RadButton>
                <telerik:RadButton ID="btnDelete" runat="server" Text="Delete" OnClick="deletePrinter_Click"></telerik:RadButton>
                <telerik:RadButton ID="btnDocument" runat="server" Text="Documents" OnClick="document_Click"></telerik:RadButton>
                
                <br /><br />
                  <telerik:RadGrid ID="RadGrid1" runat="server" 
                      DataSourceID="SqlDataSource2" Width="1016px"  
                      AllowPaging="True" 
                      AllowMultiRowSelection="True" 
                      AllowFilteringByColumn= "True" 
                      CssClass="auto-style1"> 
                      <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                      <ExportSettings>
                          <Pdf PageWidth="">
                          </Pdf>
                      </ExportSettings>
                      <ClientSettings Selecting-AllowRowSelect="true">
                      <Selecting AllowRowSelect="True" />
                      </ClientSettings>
                      <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="EngenPrintersID">
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
                              
                                <%--<telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Delete" Text="Delete" UniqueName="DeleteColumn"/>--%>

                               <telerik:GridBoundColumn DataField="EngenPrintersID" DataType="System.Int32" FilterControlAltText="Filter EngenPrintersID column" HeaderText="EngenPrintersID" SortExpression="EngenPrintersID" UniqueName="EngenPrintersID" ReadOnly="True" Display="False" >
                               </telerik:GridBoundColumn>

                               <telerik:GridBoundColumn DataField="LastModificationDate" DataType="System.DateTime" FilterControlAltText="Filter LastModificationDate column" HeaderText="LastModificationDate" SortExpression="LastModificationDate" UniqueName="LastModificationDate">
                               </telerik:GridBoundColumn>

                              <%--<telerik:GridBoundColumn DataField="PrinterMakeID" DataType="System.Int32" FilterControlAltText="Filter PrinterMakeID column" HeaderText="Printer Make" SortExpression="PrinterMakeID" UniqueName="PrinterMakeID">
                              </telerik:GridBoundColumn>--%>
                              <%--   <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Add" FilterControlAltText="Filter addColumn column"  HeaderText="Document"
                                  ImageUrl="Images/add.png" Text="add" UniqueName="addColumn" Resizable="false" ConfirmText="add record?">
                                  <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>
                                  <ItemStyle CssClass="ButtonColumn" />
                              </telerik:GridButtonColumn>--%>

                          </Columns>
                      </MasterTableView>
            </telerik:RadGrid>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT [PrinterName], [FolderToMonitor], [OutputType], [FileOutput], [Active], [CreatedDate], [EngenPrintersID], [LastModificationDate], [PrinterMakeID] FROM [Printers]"></asp:SqlDataSource>
        </div>
        </div> 
      <telerik:RadLabel ID="lbitemslist" runat="server"></telerik:RadLabel>
      <telerik:RadWindow ID="addPrinterPopup" runat="server" NavigateUrl="~/addprinter_pop.aspx" VisibleStatusbar="False" Width="359px"></telerik:RadWindow>
     <telerik:RadWindow ID="updatePrinterPopup" runat="server" NavigateUrl="~/updatePrinterspopup.aspx" VisibleStatusbar="False" Width="360px"></telerik:RadWindow>
     <telerik:RadWindow ID="deletePrinterPopup" runat="server" NavigateUrl="Delete_popup.aspx" VisibleStatusbar="False" Width="360px"></telerik:RadWindow>
     <telerik:RadWindow ID="uploadDocPopup" runat="server" NavigateUrl="UploadDocument.aspx" VisibleStatusbar="False" Width="498px"></telerik:RadWindow>
        </div>     
       </telerik:RadAjaxPanel>      
   </div> 
</asp:Content>
