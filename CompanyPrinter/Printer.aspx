<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="Printer.aspx.cs" Inherits="CompanyPrinter.Printer" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI.ComboBox" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        var disableAjax = false;
        function mngRequestStarted(ajaxManager, eventArgs) {
            if (disableAjax || eventArgs.get_eventTarget().indexOf("ExportToExcelButton") >= 0) {
                disableAjax = false;
                eventArgs.set_enableAjax(false);
            }
        }

        //Refresh fuction
     function refresh() {
            var masterTable = $find("<%=RadGrid1.ClientID%>").get_masterTableView();
            masterTable.rebind();
        }   

        function clearFilterExpressions() {
            var grid = $find("<%=RadGrid1.ClientID %>");
            var masterTableView = grid.get_masterTableView();
            masterTableView.clearFilter();
        }
      
    </script>

    <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
    <script src="popup.js"></script>
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css' media="screen" />

    <style>
        .userloggedin {
            margin-left: 80%;
        }
        .auto-style3 {
            margin: 0 261px;
            padding: 20px;
            width: 657px;
        }
    </style>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript" id="telerikClientEvents2">


        function addPrinterPopup_Close(sender, args) {
            refresh();
        }

        function updatePrinterPopup_Close(sender, args) {
            refresh();
        }

        function deletePrinterPopup_Close(sender, args) {
            refresh();
        }
      
            function RefreshGrid() {
                var masterTable = $find('#<%= RadGrid1.ClientID %>').get_masterTableView();
                masterTable.dataBind();
        }

        function assignDataSourceAndRefresh() {
            var masterTable = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
            masterTable.set_dataSource(JSON.stringify(SqlDataSource2));
            masterTable.dataBind();
            }

        function alertF() {
            alert('Coding');
        }

        function FirePageCommand() {
            var masterTable = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
            masterTable.fireCommand("Page", "Next");
        }

        function ClearItems1(result) {
            var masterTable = $find("<%= RadGrid1.ClientID %>").get_masterTableView();
            masterTable.set_dataSource(result["Data"]);
          
         masterTable.dataBind();
        }

        function RefreshGrid() {
           var masterTable = $find('#<%= RadGrid1.ClientID %>').get_masterTableView();
           masterTable.dataBind();
        }
    </script>
 </telerik:RadCodeBlock>
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

            <br />
            <br />
            <div style="margin-top: 0; padding-left: 0; padding-right: 50px; overflow: auto;">
             

                    <div class="container">                         
                        <div class="auto-style3">                        
                            <telerik:RadCard ID="RadCard1" runat="server" Width="500px">
                                <table>
                                    <tr>
                                        <td>
                                            <telerik:RadLabel ID="RadLabel2" runat="server" Text="Printer Make:" Font-Size="Small"></telerik:RadLabel>
                                        </td>
                                        <td class="auto-style1">
                                            <telerik:RadComboBox ID="txtprintermake" runat="server" DataSourceID="SqlDataSource1" DataTextField="PrinterMakeName" DataValueField="PrinterMakeID" Width="270px" EmptyMessage="Select Printer Make" Skin="Sunset"></telerik:RadComboBox>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT * FROM [PrinterMake]"></asp:SqlDataSource>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <telerik:RadLabel ID="RadLabel3" runat="server" Text="Date From:" Font-Size="Small" Width="200px"></telerik:RadLabel>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="timestapfrom" runat="server" Width="270px" Skin="Sunset"></telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <telerik:RadLabel ID="RadLabel4" runat="server" Text="Date To:" Font-Size="Small" Width="200px"></telerik:RadLabel>
                                        </td>
                                        <td>
                                            <telerik:RadDatePicker ID="timestapto" runat="server" Width="270px" Skin="Sunset"></telerik:RadDatePicker>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td>                              
                                            <telerik:RadButton ID="SearchButton" runat="server" OnClick="Search_Button" Text="Search" Skin="Sunset"></telerik:RadButton>
                                        </td>
                                    </tr>
                                </table>
                            </telerik:RadCard>                  
                            <telerik:RadLabel ID="lbsearchValidation" Text="- Date To must be greater then Date From" runat="server" ForeColor="Red" Visible="False"></telerik:RadLabel>
                            <br />
                            <telerik:RadLabel ID="lbDesignatationValidation" Text="- Please select Designation" runat="server" ForeColor="Red" Visible="False"></telerik:RadLabel>
                            </div>
                     </div>
                   </div>
                        <telerik:RadButton ID="btnAddPrinter" runat="server" Text="Add Printer" OnClick="AddPrinter_Click" Skin="Sunset"></telerik:RadButton>
                        <telerik:RadButton ID="btnDelete" runat="server" Text="Delete" OnClick="deletePrinter_Click" Skin="Sunset"></telerik:RadButton>
                        <telerik:RadButton ID="btnClear" runat="server" Text="Clear" OnClick="ClearPrinter_Click" Skin="Sunset"></telerik:RadButton>
                        <br />
                        <br />

                        <telerik:RadGrid ID="RadGrid1" runat="server"  OnItemCommand="RadGrid1_ItemCommand"
                            DataSourceID="SqlDataSource2" Width="100%"
                            AllowPaging="True"                    
                            AllowMultiRowSelection="True"
                            AllowFilteringByColumn="True"
                            CssClass="auto-style1" Skin="Sunset" style="margin-left: 0px">
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
                                    <telerik:GridBoundColumn DataField="EngenPrintersID" FilterControlAltText="Filter EngenPrintersID column" HeaderText="EngenPrintersID" SortExpression="EngenPrintersID" UniqueName="EngenPrintersID" DataType="System.Int32" ReadOnly="True" Display="false">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PrinterName" FilterControlAltText="Filter PrinterName column" HeaderText="PrinterName" SortExpression="PrinterName" UniqueName="PrinterName">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="FolderToMonitor" FilterControlAltText="Filter FolderToMonitor column" HeaderText="FolderToMonitor" SortExpression="FolderToMonitor" UniqueName="FolderToMonitor">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="OutputType" FilterControlAltText="Filter OutputType column" HeaderText="OutputType" SortExpression="OutputType" UniqueName="OutputType">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="FileOutput" FilterControlAltText="Filter FileOutput column" HeaderText="FileOutput" SortExpression="FileOutput" UniqueName="FileOutput">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="PrinterMakeID" FilterControlAltText="Filter PrinterMakeID column" HeaderText="PrinterMakeID" SortExpression="PrinterMakeID" UniqueName="PrinterMakeID" DataType="System.Int32" Display="false">
                                    </telerik:GridBoundColumn>
                                     <telerik:GridCheckBoxColumn DataField="Active" DataType="System.Boolean" FilterControlAltText="Filter Active column" HeaderText="Active" SortExpression="Active" UniqueName="Active">
                                    </telerik:GridCheckBoxColumn>
                                   
                                     <telerik:GridBoundColumn DataField="CreatedDate" DataType="System.DateTime" FilterControlAltText="Filter CreatedDate column" HeaderText="CreatedDate" SortExpression="CreatedDate" UniqueName="CreatedDate">
                                    </telerik:GridBoundColumn>

                                     <telerik:GridBoundColumn DataField="LastModificationDate" DataType="System.DateTime" FilterControlAltText="Filter LastModificationDate column" HeaderText="LastModificationDate" SortExpression="LastModificationDate" UniqueName="LastModificationDate">
                                    </telerik:GridBoundColumn>

                                     <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="EditPrinter" FilterControlAltText="Filter EditColumn column" HeaderText="Edit"
                                        ImageUrl="Images/edit.png" Text="Edit" UniqueName="EditColumn" Resizable="false" >
                                        <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>                                    
                                        <ItemStyle CssClass="ButtonColumn" />
                                    </telerik:GridButtonColumn>

                                    <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Upload" FilterControlAltText="Filter UploadColumn column" HeaderText="Document"
                                        ImageUrl="Images/add.png" Text="Upload" UniqueName="UploadColumn" Resizable="false">
                                        <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>
                                        <ItemStyle CssClass="ButtonColumn" />
                                    </telerik:GridButtonColumn>
                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>                        
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT * FROM [Printers] WHERE ([Status] = 1)"></asp:SqlDataSource>             
          
                <telerik:RadLabel ID="lbitemslist" runat="server"></telerik:RadLabel>
                <telerik:RadWindow ID="addPrinterPopup" runat="server" NavigateUrl="~/addprinter_pop.aspx" VisibleStatusbar="False" Width="359px" OnClientClose="addPrinterPopup_Close" Height="311px" Skin="Sunset"></telerik:RadWindow>
                <telerik:RadWindow ID="updatePrinterPopup" runat="server" NavigateUrl="~/updatePrinterspopup.aspx" VisibleStatusbar="False" Width="360px" OnClientClose="updatePrinterPopup_Close" Skin="Sunset"></telerik:RadWindow>
                <telerik:RadWindow ID="deletePrinterPopup" runat="server" NavigateUrl="Delete_popup.aspx" VisibleStatusbar="False" Width="666px" OnClientClose="deletePrinterPopup_Close" Skin="Sunset"></telerik:RadWindow>
                <telerik:RadWindow ID="uploadDocPopup" runat="server" NavigateUrl="UploadDocument.aspx" VisibleStatusbar="False" Width="498px" Skin="Sunset"></telerik:RadWindow>        
        </telerik:RadAjaxPanel>
     
    </div>
    <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
        <script type="text/javascript">
            function ClearFilters() {
                var grid = $find("<%= RadGrid1.ClientID %>");

                var masterTableView = grid.get_masterTableView();
                masterTableView.get_filterExpressions().clear();

                masterTableView.rebind();
            }
        </script>
    </telerik:RadCodeBlock>
</asp:Content>
