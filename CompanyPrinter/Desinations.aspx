<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Desinations.aspx.cs" Inherits="CompanyPrinter.Desinations" %>



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
 .creatuser{
     margin-left:0;
 }
    .auto-style3 {
        margin-left: 200px;
        width: 500px;
    }
</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadAjaxLoadingPanel ID="rad1" runat="server" Transparency="25" />
   <div>
       <div class="title2">
            <telerik:RadLabel ID="RadLabel1" runat="server" Text="Designations" Font-Size="X-Large" Font-Bold="true"></telerik:RadLabel>
       </div>
       
    <telerik:RadAjaxPanel ID="radAjxPanelMain" runat="server" LoadingPanelID="rad1" ClientEvents-OnRequestStart="mngRequestStarted">
      
      
       
        <br /><br>
        <div style="margin-top:0; padding-left: 0; padding-right: 50px; overflow: auto;">
        <div>
   
            <div class="auto-style3">
                 <div class="creatuser">
             <telerik:RadButton ID="RadButton1" runat="server" Text="Add Designation" OnClick="RadButton1_Click"/> </div><br />
                  <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource2" Width="487px"  AllowPaging="True" AllowMultiRowSelection="True" AllowFilteringByColumn= "True" CssClass="auto-style1">
                      <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                      <ClientSettings Selecting-AllowRowSelect="true">
                          <Selecting AllowRowSelect="True" />
                      </ClientSettings>
                      <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                          <Columns>
                              <telerik:GridBoundColumn DataField="DesignationName" FilterControlAltText="Filter DesignationName column" HeaderText="DesignationName" SortExpression="DesignationName" UniqueName="DesignationName">
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

                 
                          </Columns>
                      </MasterTableView>
            </telerik:RadGrid>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT [DesignationName] FROM [Designations]"></asp:SqlDataSource>
        </div>
       </div>
    </div>   
       </telerik:RadAjaxPanel>

   </div> 
</asp:Content>

