<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Printers.aspx.cs" Inherits="CompanyPrinter.Printers" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <telerik:RadCodeBlock ID="RadCodeBlock2" runat="server">
        <style type="text/css">
            .orderText {
                font: normal 12px Arial,Verdana;
                margin-top: 6px;
            }
        </style>
    </telerik:RadCodeBlock>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
  <%--     <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>--%>
    <%--<telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />--%>
    <telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
        <script type="text/javascript">


            function ShowEditForm(id, rowIndex) {
                var grid = $find("<%= RadGrid1.ClientID %>");

                var rowControl = grid.get_masterTableView().get_dataItems()[rowIndex].get_element();
                grid.get_masterTableView().selectItem(rowControl, true);

                window.radopen("PrinterEdit.aspx?EngenPrintersID=" + id, "UserListDialog");
                return false;
            }
            function ShowInsertForm() {
                window.radopen("PrinterEdit.aspx", "UserListDialog");
                return false;
            }
            function refreshGrid(arg) {
                if (!arg) {
                    $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("Rebind");
                }
                else {
                    $find("<%= RadAjaxManager1.ClientID %>").ajaxRequest("RebindAndNavigate");
                }
            }
            function RowDblClick(sender, eventArgs) {
                window.radopen("PrinterEdit.aspx?EngenPrintersID=" + eventArgs.getDataKeyValue("EngenPrintersID"), "UserListDialog");
            }

      
        </script>
    </telerik:RadCodeBlock>
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server" OnAjaxRequest="RadAjaxManager1_AjaxRequest">
        <AjaxSettings>
            <telerik:AjaxSetting AjaxControlID="RadAjaxManager1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="gridLoadingPanel"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
            <telerik:AjaxSetting AjaxControlID="RadGrid1">
                <UpdatedControls>
                    <telerik:AjaxUpdatedControl ControlID="RadGrid1" LoadingPanelID="gridLoadingPanel"></telerik:AjaxUpdatedControl>
                </UpdatedControls>
            </telerik:AjaxSetting>
        </AjaxSettings>
    </telerik:RadAjaxManager>
    <telerik:RadAjaxLoadingPanel runat="server" ID="gridLoadingPanel"></telerik:RadAjaxLoadingPanel>
<div class="demo-container no-bg">
    <telerik:RadGrid RenderMode="Lightweight" OnItemCreated="RadGrid1_ItemCreated" ID="RadGrid1" runat="server"
        AllowPaging="True" Width="100%" DataSourceID="SqlDataSource1">
        <PagerStyle Mode="NumericPages"></PagerStyle>
        <MasterTableView AutoGenerateColumns="False" ClientDataKeyNames="EngenPrintersID"
            Width="100%" CommandItemDisplay="Top" PageSize="5" DataKeyNames="EngenPrintersID">
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

                                    <telerik:GridBoundColumn DataField="EngenPrintersID" DataType="System.Int32" FilterControlAltText="Filter EngenPrintersID column" HeaderText="EngenPrintersID" SortExpression="EngenPrintersID" UniqueName="EngenPrintersID" ReadOnly="True" Display="false">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="LastModificationDate" DataType="System.DateTime" FilterControlAltText="Filter LastModificationDate column" HeaderText="LastModificationDate" SortExpression="LastModificationDate" UniqueName="LastModificationDate">
                                    </telerik:GridBoundColumn>

                                    <telerik:GridBoundColumn DataField="PrinterMakeName" FilterControlAltText="Filter PrinterMakeName column" HeaderText="PrinterMakeName" SortExpression="PrinterMakeName" UniqueName="PrinterMakeName">
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
            <CommandItemTemplate>
                <a href="#" onclick="return ShowInsertForm();">Add New Record</a>
            </CommandItemTemplate>
        </MasterTableView>
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>

        <ClientSettings>
            <Selecting AllowRowSelect="true"></Selecting>
            <ClientEvents OnRowDblClick="RowDblClick"></ClientEvents>
        </ClientSettings>

<FilterMenu RenderMode="Lightweight"></FilterMenu>

<HeaderContextMenu RenderMode="Lightweight"></HeaderContextMenu>
    </telerik:RadGrid>
    </div>
    <telerik:RadWindowManager RenderMode="Lightweight" ID="RadWindowManager1" runat="server" EnableShadow="true">
        <Windows>
            <telerik:RadWindow RenderMode="Lightweight" ID="UserListDialog" runat="server" Title="Editing record" Height="380px"
                Width="393px" Left="150px" ReloadOnShow="true" ShowContentDuringLoad="false"
                Modal="true">
            </telerik:RadWindow>
        </Windows>
    </telerik:RadWindowManager>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>"
        SelectCommand="SELECT [PrinterName], [FolderToMonitor], [OutputType], [FileOutput], [Active], [CreatedDate], [LastModificationDate], [EngenPrintersID] FROM [Printers]"></asp:SqlDataSource>
    
</asp:Content>
