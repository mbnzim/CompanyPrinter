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

         <div class="userloggedin">
           <asp:Label ID="lbtxtusername" runat="server" Font-Size="X-Large" Text="username"></asp:Label>
       </div>
       <div class="title2">
            <telerik:RadLabel ID="RadLabel1" runat="server" Text="Users" Font-Size="X-Large" Font-Bold="true"></telerik:RadLabel>
       </div>
       
    <telerik:RadAjaxPanel ID="radAjxPanelMain" runat="server" LoadingPanelID="rad1" ClientEvents-OnRequestStart="mngRequestStarted" Width="100%">
      
      
       
        <br /><br> 
      <%--  <div style="margin-top:0; padding-left: 0; padding-right: 50px; overflow: auto;">--%>
                 
            <br /><br><br /><br>
            <%--<div class="container">--%>
             <div class="search">
                  <telerik:RadButton ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click" Skin="Sunset"></telerik:RadButton>
                 <telerik:RadTextBox ID="txtusername"  runat="server" DisplayText="Username"></telerik:RadTextBox>           
             <%--</div>--%>
                <%--</div>--%>
                 <br />

                
              <div class="creatuser">
                  <br />
                <telerik:RadButton ID="btnCreateuser" runat="server" Text="Created User" OnClick="RadButton1_Click" Skin="Sunset"/> 
               <%--  <telerik:RadButton ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click" Skin="Sunset" /> 
                <telerik:RadButton ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" Skin="Sunset" /> --%>
               <telerik:RadButton ID="btnClear" runat="server" OnClick="ClearPrinter_Click" Text="Clear" Skin="Sunset" /> 
                <br />
              </div>  
              </div><br />
                  <telerik:RadGrid ID="userRd" runat="server" OnItemCommand="UserOnItemCommand" DataSourceID="SqlDataSource2" Width="100%"  AllowPaging="True" AllowMultiRowSelection="True" AllowFilteringByColumn= "True" CssClass="auto-style1" Skin="Sunset">
                      <GroupingSettings CollapseAllTooltip="Collapse all groups"  />
                      <ExportSettings>
                          <Pdf PageWidth="">
                          </Pdf>
                      </ExportSettings>
                     <ClientSettings Selecting-AllowRowSelect="true">
                      <Selecting AllowRowSelect="True" />
                      </ClientSettings>
                      <MasterTableView AutoGenerateColumns="False" DataSourceID="SqlDataSource2" DataKeyNames="UserID">
                          <Columns>
                               <telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" /> 
                              <telerik:GridBoundColumn DataField="UserID" FilterControlAltText="Filter UserID column" HeaderText="UserID" SortExpression="UserID" UniqueName="UserID" DataType="System.Int32" ReadOnly="True" Display="false">
                              </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="FirstName" FilterControlAltText="Filter FirstName column" HeaderText="FirstName" SortExpression="FirstName" UniqueName="FirstName">
                               </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="LastName" FilterControlAltText="Filter LastName column" HeaderText="LastName" SortExpression="LastName" UniqueName="LastName">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="UserName" FilterControlAltText="Filter UserName column" HeaderText="UserName" SortExpression="UserName" UniqueName="UserName">
                              </telerik:GridBoundColumn>
                               <telerik:GridBoundColumn DataField="DesignationName" FilterControlAltText="Filter DesignationName column" HeaderText="DesignationName" SortExpression="DesignationName" UniqueName="DesignationName">
                              </telerik:GridBoundColumn>
                              <telerik:GridBoundColumn DataField="Address" FilterControlAltText="Filter Address column" HeaderText="Address" SortExpression="Address" UniqueName="Address">
                              </telerik:GridBoundColumn>
                              
                               <telerik:GridBoundColumn DataField="Email" FilterControlAltText="Filter Email column" HeaderText="Email" SortExpression="Email" UniqueName="Email">
                               </telerik:GridBoundColumn>
                              
                              <telerik:GridBoundColumn DataField="DOB" FilterControlAltText="Filter DOB column" HeaderText="DOB" SortExpression="DOB" UniqueName="DOB" DataType="System.DateTime">
                              </telerik:GridBoundColumn>
                                     
                              <telerik:GridBoundColumn DataField="CreatedDate" FilterControlAltText="Filter CreatedDate column" HeaderText="CreatedDate" SortExpression="CreatedDate" UniqueName="CreatedDate" DataType="System.DateTime">
                              </telerik:GridBoundColumn>

                             
                              <telerik:GridBoundColumn DataField="LastModificationDate" DataType="System.DateTime" FilterControlAltText="Filter LastModificationDate column" HeaderText="LastModificationDate" SortExpression="LastModificationDate" UniqueName="LastModificationDate">
                              </telerik:GridBoundColumn>

                                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="EditUser" FilterControlAltText="Filter EditColumn column" HeaderText="Edit" ImageUrl="Images/edit.png" Text="Edit" UniqueName="EditColumn" Resizable="false" >
                                        <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>                            
                                        <ItemStyle CssClass="ButtonColumn" />
                                    </telerik:GridButtonColumn>

                                <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="DeleteUser" FilterControlAltText="Filter DeleteColumn column" HeaderText="Delete" ImageUrl="Images/delete.png" Text="Delete" UniqueName="DeleteColumn" Resizable="false" >
                                        <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>                            
                                        <ItemStyle CssClass="ButtonColumn" />
                                    </telerik:GridButtonColumn>
                             
                               <telerik:GridButtonColumn ButtonType="ImageButton" CommandName="Profile" FilterControlAltText="Filter UserProfileColumn column" HeaderText="Profile" ImageUrl="Images/profile.png" Text="Profile" UniqueName="ProfileColumn" Resizable="false" >
                                        <HeaderStyle CssClass="rgHeader ButtonColumnHeader"></HeaderStyle>                            
                                        <ItemStyle CssClass="ButtonColumn" />
                                    </telerik:GridButtonColumn>

                          </Columns>
                      </MasterTableView>
            </telerik:RadGrid>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="GetAlltherUsers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        
       
     
         </telerik:RadAjaxPanel>
       <telerik:RadWindow ID="userupdatepopup" runat="server" NavigateUrl="updateuser_popup.aspx" VisibleStatusbar="False" Height="334px" Width="318px" Skin="Sunset"></telerik:RadWindow>

</asp:Content>

