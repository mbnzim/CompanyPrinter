<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="User.aspx.cs" Inherits="CompanyPrinter.User" %>

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
    <script src="popup.js"></script>
    <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'  media="screen" />

<style>
 .creatuser{
    margin-left:0;
 }
 .search{
     margin-left:0;
 }

  .userloggedin{
     margin-left:80%;
  }
  
</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
         <div class="userloggedin">
           <asp:Label ID="lbtxtusername" runat="server" Font-Size="X-Large" Text="username"></asp:Label>
       </div>
       <div class="title2">
            <telerik:RadLabel ID="RadLabel1" runat="server" Text="Users" Font-Size="X-Large" Font-Bold="true"></telerik:RadLabel>
       </div>
       
    <telerik:RadAjaxPanel ID="radAjxPanelMain" runat="server" LoadingPanelID="rad1" ClientEvents-OnRequestStart="mngRequestStarted">
      
      
       
        <br /><br> 
        <div style="margin-top:0; padding-left: 0; padding-right: 50px; overflow: auto;">
        <div>
           
            <br /><br><br /><br>
            <div class="container">
             <div class="search">
                  <telerik:RadButton ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click"></telerik:RadButton>
                 <telerik:RadTextBox ID="txtusername"  runat="server" DisplayText="Username"></telerik:RadTextBox>           
             </div>
                 <br />
              <div class="creatuser">
                <telerik:RadButton ID="btnCreateuser" runat="server" Text="Created User" OnClick="RadButton1_Click"/> 
                 <telerik:RadButton ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" /> 
                <telerik:RadButton ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" /> 
               <telerik:RadButton ID="btnClear" runat="server" Text="Clear" /> 
                <br />
              
              </div><br />
                  <telerik:RadGrid ID="userRd" runat="server" DataSourceID="SqlDataSource2" Width="1016px"  AllowPaging="True" AllowMultiRowSelection="True" AllowFilteringByColumn= "True" CssClass="auto-style1">
                      <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                      <ExportSettings>
                          <Pdf PageWidth="">
                          </Pdf>
                      </ExportSettings>
                     <ClientSettings Selecting-AllowRowSelect="true">
                      <Selecting AllowRowSelect="True" />
                      </ClientSettings>
                      <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                          <Columns>
                               <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" /> 
                              <telerik:GridBoundColumn DataField="LastName" FilterControlAltText="Filter LastName column" HeaderText="LastName" SortExpression="LastName" UniqueName="LastName">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="FirstName" FilterControlAltText="Filter FirstName column" HeaderText="FirstName" SortExpression="FirstName" UniqueName="FirstName">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="Email" FilterControlAltText="Filter Email column" HeaderText="Email" SortExpression="Email" UniqueName="Email">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter UserName column" HeaderText="UserName" SortExpression="UserName" UniqueName="UserName">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="Address" FilterControlAltText="Filter Address column" HeaderText="Address" SortExpression="Address" UniqueName="Address">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="DOB" DataType="System.DateTime" FilterControlAltText="Filter DOB column" HeaderText="DOB" SortExpression="DOB" UniqueName="DOB">
                              </telerik:GridBoundColumn>
                            <%--   <telerik:GridBoundColumn DataField="UserID" DataType="System.Int32" FilterControlAltText="Filter UserID column" HeaderText="UserID" ReadOnly="True" SortExpression="UserID" UniqueName="UserID" Visible="False">
                              </telerik:GridBoundColumn>--%>
                              <telerik:GridBoundColumn DataField="CreatedDate" DataType="System.DateTime" FilterControlAltText="Filter CreatedDate column" HeaderText="CreatedDate" SortExpression="CreatedDate" UniqueName="CreatedDate">
                              </telerik:GridBoundColumn>
                              
                              <telerik:GridBoundColumn DataField="Password" FilterControlAltText="Filter Password column" HeaderText="Password" SortExpression="Password" UniqueName="Password" Display="false">
                              </telerik:GridBoundColumn>
                                     
                              <telerik:GridBoundColumn DataField="LastModificationDate" FilterControlAltText="Filter LastModificationDate column" HeaderText="LastModificationDate" SortExpression="LastModificationDate" UniqueName="LastModificationDate" DataType="System.DateTime">
                              </telerik:GridBoundColumn>

                             
                              <telerik:GridBoundColumn DataField="DesignationID" DataType="System.Int32" FilterControlAltText="Filter DesignationID column" HeaderText="DesignationID" SortExpression="DesignationID" UniqueName="DesignationID" Display="false">
                              </telerik:GridBoundColumn>


                              <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="EditPrinter" FilterControlAltText="Filter EditColumn column" HeaderText="Edit" ImageUrl="Images/edit.png" Text="Edit" UniqueName="EditColumn" Resizable="false" >
                                        <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>                            
                                        <ItemStyle CssClass="ButtonColumn" />
                                    </telerik:GridButtonColumn>

                                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="DeletePrinter" FilterControlAltText="Filter DeleteColumn column" HeaderText="Delete" ImageUrl="Images/delete.png" Text="Delete" UniqueName="DeleteColumn" Resizable="false" >
                                        <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>                            
                                        <ItemStyle CssClass="ButtonColumn" />
                                    </telerik:GridButtonColumn>
                             
                          </Columns>
                      </MasterTableView>
            </telerik:RadGrid>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT [LastName], [FirstName], [Email], [UserName], [Address], [DOB], [CreatedDate], [Password], [LastModificationDate], [DesignationID] FROM [Users]"></asp:SqlDataSource>
        </div>
       </div>
    </div>   
         </telerik:RadAjaxPanel>
       <telerik:RadWindow ID="userupdatepopup" runat="server" NavigateUrl="updateuser_popup.aspx" VisibleStatusbar="False" Height="334px" Width="318px"></telerik:RadWindow>
   </div> 
</asp:Content>

