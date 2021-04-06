<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Documents.aspx.cs" Inherits="CompanyPrinter.Documents" %>





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

     .userloggedin{
            margin-left:80%;
        }
</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <telerik:RadAjaxLoadingPanel ID="rad1" runat="server" Transparency="25" />
   <div>
       <div class="userloggedin">
           <asp:Label ID="lbtxtusername" runat="server" Font-Size="X-Large" Text="username"></asp:Label>
       </div>
       <div class="title2">
            <telerik:RadLabel ID="RadLabel1" runat="server" Text="Documents" Font-Size="X-Large" Font-Bold="true"></telerik:RadLabel>
       </div>
       
    <telerik:RadAjaxPanel ID="radAjxPanelMain" runat="server" LoadingPanelID="rad1" ClientEvents-OnRequestStart="mngRequestStarted">
      
      
       
        <br /><br> <br /><br>    
        <div style="margin-top:0; padding-left: 0; padding-right: 50px; overflow: auto;">
        <div>
   
            <div class="auto-style3">
          <%--       <div class="creatuser">
             <telerik:RadButton ID="RadButton1" runat="server" Text="Add Designation" OnClick="RadButton1_Click"/> </div><br />--%>
                  <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="SqlDataSource2" Width="487px"  AllowPaging="True" AllowMultiRowSelection="True" AllowFilteringByColumn= "True" CssClass="auto-style1">
                      <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                      <ClientSettings Selecting-AllowRowSelect="true">
                          <Selecting AllowRowSelect="True" />
                      </ClientSettings>
                      <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                          <Columns>
                              <telerik:GridBoundColumn DataField="DocType" FilterControlAltText="Filter DocType column" HeaderText="DocType" SortExpression="DocType" UniqueName="DocType">
                              </telerik:GridBoundColumn>
                                <telerik:GridBoundColumn DataField="DocUrl" FilterControlAltText="Filter DocUrl column" HeaderText="DocUrl" SortExpression="DocUrl" UniqueName="DocUrl">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="CreatedDate" DataType="System.DateTime" FilterControlAltText="Filter CreatedDate column" HeaderText="CreatedDate" SortExpression="CreatedDate" UniqueName="CreatedDate">
                              </telerik:GridBoundColumn>

                 
                          </Columns>
                      </MasterTableView>
            </telerik:RadGrid>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT [DocType], [DocUrl], [CreatedDate] FROM [Documents]"></asp:SqlDataSource>
        </div>
       </div>
    </div>   
       </telerik:RadAjaxPanel>

   </div> 
</asp:Content>
