<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrinterEdit.aspx.cs" Inherits="CompanyPrinter.PrinterEdit" %>
<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <style>
        body {
            font: 14px/1.4 Helvetica, Arial, sans-serif;
        }
 
        button.RadButton span.rbIcon {
            vertical-align: sub;
        }
 
        .rdfLabel.rdfBlock {
            margin-top: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">      
    <div>
            <script type="text/javascript">

                function CloseAndRebind(args) {
                    GetRadWindow().BrowserWindow.refreshGrid(args);
                    GetRadWindow().close();
                }

                function GetRadWindow() {
                    var oWindow = null;
                    if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
                    else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow; //IE (and Moz as well)

                    return oWindow;
                }

                function CancelEdit() {
                    GetRadWindow().close();
                }
            </script>
    <%--    <telerik:RadScriptManager Runat="server"></telerik:RadScriptManager>--%>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server">
                <Scripts>
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.Core.js" />
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQuery.js" />
                    <asp:ScriptReference Assembly="Telerik.Web.UI" Name="Telerik.Web.UI.Common.jQueryInclude.js" />
                </Scripts>
            </telerik:RadScriptManager>
            <br />
            <br />
            <telerik:RadDataForm RenderMode="Lightweight" runat="server" ID="RadDataForm1" DataSourceID="SqlDataSource1" 
               
                DataKeyNames="EngenPrintersID" OnItemCommand="RadDataForm1_ItemCommand" OnPreRender="RadDataForm1_PreRender" Skin="Material">
                <LayoutTemplate>
                    <div class="RadDataForm RadDataForm_<%# Container.Skin %> rdfLeftAligned rdfInlineBlock" style="width: 362px;">
                        <div id="itemPlaceholder" runat="server" class="rdfLeftAligned"></div>
                    </div>
                </LayoutTemplate>
                <ItemTemplate></ItemTemplate>
                <EditItemTemplate>
                    <fieldset class="rdfFieldset rdfBorders">
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="PrinterLabel" CssClass="rdfLabel rdfBlock" Text="Printer Name:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="PrinterNameTextBox1" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("PrinterName") %>' MaxLength="10" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ControlToValidate="PrinterNameTextBox1"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="LastNameLabel" CssClass="rdfLabel rdfBlock" Text="FolderToMonitor:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="FolderToMonitorTextBox1" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("FolderToMonitor") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator2" ControlToValidate="FolderToMonitorTextBox1"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="TitleLabel" CssClass="rdfLabel rdfBlock" Text="OutputType:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="OutputTypeTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("OutputType") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator3" ControlToValidate="OutputTypeTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                         <div class="rdfRow">
                            <asp:Label runat="server" ID="Label4" CssClass="rdfLabel rdfBlock" Text="FileOutput:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="FileOutputTextBox1" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("FileOutput") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator7" ControlToValidate="FileOutputTextBox1"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="Label5" CssClass="rdfLabel rdfBlock" Text="Title:"></asp:Label>
                                 <telerik:RadComboBox ID="cbprintermake1"  runat="server" DataSourceID="SqlDataSource1" DataTextField="PrinterMake" 
                                     RenderMode="Lightweight" WrapperCssClass="rdfFieldValue" MaxLength="20" Width="214px"  DataValueField="PrinterMakeID"></telerik:RadComboBox>
                                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT * FROM [PrinterMake]"></asp:SqlDataSource>
                             </div>               
                         <%--  <div class="rdfRow">
                            <asp:Label runat="server" ID="Label8" CssClass="rdfLabel rdfBlock" Text="FileOutput:"></asp:Label>
                                <asp:RadioButton ID="radactive" runat="server"  text="Active" GroupName="rd"/>
                                  <asp:RadioButton ID="radinactive" runat="server"  text="Inactive" GroupName="rd"/>
                        </div>--%>
                        <div class="rdfRow" style="float: right; padding-right: 10px;">
                            <telerik:RadButton RenderMode="Lightweight" runat="server" ID="ButtonUpdate" Text="Update" CommandName="Update"
                                Skin="<%# Container.OwnerDataForm.Skin %>">
                                <Icon PrimaryIconCssClass="rbOk"></Icon>
                            </telerik:RadButton>
                            <telerik:RadButton RenderMode="Lightweight" runat="server" ID="ButtonCancel" Text="Cancel" CommandName="Cancel"
                                CausesValidation="false" Skin="<%# Container.OwnerDataForm.Skin %>">
                                <Icon PrimaryIconCssClass="rbCancel"></Icon>
                            </telerik:RadButton>
                        </div>
                    </fieldset>
                </EditItemTemplate>
                <InsertItemTemplate>
                     <fieldset class="rdfFieldset rdfBorders">
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="PrinterLabel" CssClass="rdfLabel rdfBlock" Text="Printer Name:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="PrinterNameTextBox1" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("PrinterName") %>' MaxLength="10" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator1" ControlToValidate="PrinterNameTextBox1"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow">
                            <%--<a href="Desinations.aspx">Desinations.aspx</a>--%>
                            <asp:Label runat="server" ID="LastNameLabel" CssClass="rdfLabel rdfBlock" Text="FolderToMonitor:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="FolderToMonitorTextBox1" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("FolderToMonitor") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator2" ControlToValidate="FolderToMonitorTextBox1"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                        <div class="rdfRow">
                            <asp:Label runat="server" ID="TitleLabel" CssClass="rdfLabel rdfBlock" Text="OutputType:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="OutputTypeTextBox" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("OutputType") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator3" ControlToValidate="OutputTypeTextBox"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                             <div class="rdfRow">
                            <asp:Label runat="server" ID="Label4" CssClass="rdfLabel rdfBlock" Text="FileOutput:"></asp:Label>
                            <telerik:RadTextBox RenderMode="Lightweight" runat="server" ID="FileOutputTextBox1" WrapperCssClass="rdfFieldValue"
                                Text='<%# Bind("FileOutput") %>' MaxLength="20" Width="214px" />
                            <asp:RequiredFieldValidator ForeColor="Red" runat="server" ID="RequiredFieldValidator7" ControlToValidate="FileOutputTextBox1"
                                ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>                        

                             <div class="rdfRow">
                            <asp:Label runat="server" ID="Label5" CssClass="rdfLabel rdfBlock" Text="Printer Make:"></asp:Label>
                                 <telerik:RadComboBox ID="cbprintermake1"  runat="server" DataSourceID="SqlDataSource1" DataTextField="PrinterMake" DataValueField="PrinterMakeID"
                                     SelectedValue='<%# Bind("PrinterMakeID") %>'  RenderMode="Lightweight" WrapperCssClass="rdfFieldValue" MaxLength="20" Width="214px"></telerik:RadComboBox>
                                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>" SelectCommand="SELECT * FROM [PrinterMake]"></asp:SqlDataSource>               
                              </div>                                  
                   <%--       <div class="rdfRow">
                           <asp:Label runat="server" ID="Label8" CssClass="rdfLabel rdfBlock" Text="FileOutput:"></asp:Label>       
                            <asp:RadioButton ID="radactive" runat="server"  text="Active" GroupName="rd"/>
                            <asp:RadioButton ID="radinactive" runat="server"  text="Inactive" GroupName="rd"/>             
                        </div>--%>
                        <div class="rdfRow" style="float: right; padding-right: 10px;">
                            <telerik:RadButton RenderMode="Lightweight" runat="server" ID="ButtonUpdate" Text="Update" CommandName="Update"
                                Skin="<%# Container.OwnerDataForm.Skin %>">
                                <Icon PrimaryIconCssClass="rbOk"></Icon>
                            </telerik:RadButton>
                            <telerik:RadButton RenderMode="Lightweight" runat="server" ID="ButtonCancel" Text="Cancel" CommandName="Cancel"
                                CausesValidation="false" Skin="<%# Container.OwnerDataForm.Skin %>">
                                <Icon PrimaryIconCssClass="rbCancel"></Icon>
                            </telerik:RadButton>
                        </div>
                    </fieldset>
                </InsertItemTemplate>
            </telerik:RadDataForm>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CompanyPrinterDB %>"
                InsertCommand="INSERT INTO Printers(PrinterName, FolderToMonitor, OutputType, FileOutput, PrinterMakeID, Active, Status, CreatedDate, LastModificationDate) VALUES (@PrinterName, @FolderToMonitor, @OutputType, @FileOutput, @PrinterMakeID, @Active, @Status, @CreatedDate, @LastModificationDate)"
                SelectCommand="SELECT [EngenPrintersID], [PrinterName], [FolderToMonitor], [OutputType], [FileOutput], [Active], [CreatedDate], [LastModificationDate] FROM [Printers]  Where ([EngenPrintersID]=@EngenPrintersID)"
                UpdateCommand="UPDATE Printers SET PrinterName=@PrinterName, FolderToMonitor=@FolderToMonitor, OutputType=@OutputType, FileOutput=@FileOutput, PrinterMakeID= 1, Active=1,Status=1,CreatedDate='2021-04-14', LastModificationDate='2021-04-14' Where EngenPrintersID =@EngenPrintersID;">
         <%--       <InsertParameters>
                    <asp:Parameter Name="PrinterName" Type="String"  DefaultValue="" ConvertEmptyStringToNull="false"/>
                    <asp:Parameter Name="FolderToMonitor" Type="String"  DefaultValue="" ConvertEmptyStringToNull="false"/>
                    <asp:Parameter Name="OutputType" Type="String"  DefaultValue="" ConvertEmptyStringToNull="false"/>
                    <asp:Parameter Name="FileOutput" Type="String"  DefaultValue="" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="PrinterMakeID" Type="Int32" />
                    <asp:Parameter Name="Active" Type="Boolean" />
                    <asp:Parameter Name="Status" Type="Boolean" />
                    <asp:Parameter Name="CreatedDate" Type="DateTime" />
                    <asp:Parameter Name="LastModificationDate" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                
                    <asp:Parameter Name="PrinterName" Type="String"  DefaultValue="" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="FolderToMonitor" Type="String"  DefaultValue="" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="OutputType" Type="String"  DefaultValue="" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="FileOutput" Type="String"   DefaultValue="" ConvertEmptyStringToNull="false"/>
                    <asp:Parameter Name="EngenPrintersID" />
                </UpdateParameters>--%>
                 <InsertParameters>
                     <asp:Parameter Name="PrinterName" />
                     <asp:Parameter Name="FolderToMonitor" />
                     <asp:Parameter Name="OutputType" />
                     <asp:Parameter Name="FileOutput" />
                     <asp:Parameter Name="PrinterMakeID" />
                     <asp:Parameter Name="Active" />
                     <asp:Parameter Name="Status" />
                     <asp:Parameter Name="CreatedDate" />
                     <asp:Parameter Name="LastModificationDate" />
                </InsertParameters>
             
                <UpdateParameters>
                    <asp:Parameter Name="PrinterName" />
                    <asp:Parameter Name="FolderToMonitor" />
                    <asp:Parameter Name="OutputType" />
                    <asp:Parameter Name="FileOutput" />
                    <asp:Parameter Name="PrinterMakeID" />
                    <asp:Parameter Name="EngenPrintersID" />
                </UpdateParameters>
                    <SelectParameters>
                    <asp:QueryStringParameter Name="EngenPrintersID" QueryStringField="EngenPrintersID" Type="Int32" DefaultValue="0" />               
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
