<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addusers.aspx.cs" Inherits="ubank.addeditdeleteuser" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style13
        {
            width: 240px;
        }
        .auto-style1
        {
            width: 236px;
        }
        .auto-style2
        {
            height: 21px;
        }
        .auto-style3
        {
            height: 34px;
        }
        .auto-style4
        {
            height: 21px;
            width: 103px;
        }
        .auto-style5
        {
            width: 103px;
        }
        .auto-style6
        {
            height: 34px;
            width: 103px;
        }
        .auto-style7
        {
            height: 26px;
        }
        .auto-style8
        {
            height: 24px;
        }
        .auto-style9
        {
            height: 38px;
        }
        .auto-style10
        {
        }
        .auto-style11
        {
            height: 26px;
            width: 208px;
        }
        .auto-style12
        {
            height: 21px;
        }
        .auto-style13
        {
            width: 208px;
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <table style="width:100%;">
        <tr>
            <td class="auto-style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="left" valign="top" class="auto-style1">
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" 
                    DataSourceID="SqlDataSource1List" DataTextField="UserName" 
                    DataValueField="UserID" Height="410px" Width="202px"></asp:ListBox>
                <asp:ListSearchExtender ID="ListBox1_ListSearchExtender" runat="server" 
                    Enabled="True" TargetControlID="ListBox1" PromptCssClass="SearchText">
                </asp:ListSearchExtender>
                <asp:SqlDataSource ID="SqlDataSource1List" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strConn %>" 
                    SelectCommand="SELECT [UserID], [UserName] FROM [UserManager]">
                </asp:SqlDataSource>
            </td>
            <td align="left" valign="top">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="UserID" DataSourceID="SqlDataSource1FormView" Width="593px">
                    <EditItemTemplate>
                        <table style="width:100%; height: 493px;">
                            <tr>
                                <td colspan="2" style="font-weight: bold; font-size: x-large; color: #CCCCCC; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC;" class="auto-style9">Rights Modification</td>
                                <td class="auto-style9" colspan="2" style="font-weight: bold; font-size: x-large; color: #CCCCCC; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC;">::
                                    <asp:Label ID="UserIDLabel1" runat="server" Text='<%# Eval("UserID") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td colspan="3">
                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="ErrorSummary" ForeColor="#FF3300" ValidationGroup="EditForm" />
                                </td>
                            </tr>
                            <tr>
                                <td>OrgID</td>
                                <td colspan="3">
                                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSourceEditOrg" DataTextField="OrganizationName" DataValueField="OrgID" SelectedValue='<%# Bind("OrgID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceEditOrg" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [OrgID], [OrganizationName] FROM [CompanySettings]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>UserName</td>
                                <td>
                                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' Width="20px" Wrap="False" ToolTip="Title" />
                                    .
                                    <asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' ToolTip="User Name" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TitleTextBox" ErrorMessage="Please Enter Title" ForeColor="#FF3300" ValidationGroup="EditForm">*</asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="UserNameTextBox" ErrorMessage="Please Enter User Name" ForeColor="#FF3300" ValidationGroup="EditForm">*</asp:RequiredFieldValidator>
                                </td>
                                <td>Employee id</td>
                                <td>
                                    <asp:TextBox ID="Employee_idTextBox" runat="server" Text='<%# Bind("Employee_id") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">LocationID</td>
                                <td class="auto-style7">
                                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSourceEditLocation" DataTextField="LocationDes" DataValueField="LocationID" SelectedValue='<%# Bind("LocationID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceEditLocation" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LocationID], [LocationDes] FROM [RefLocation] WHERE ([BlockLocation] = @BlockLocation) ORDER BY [LocationDes]">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="False" Name="BlockLocation" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td class="auto-style7">DivisionID</td>
                                <td class="auto-style7">
                                    <asp:DropDownList ID="DropDownList7" runat="server" DataSourceID="SqlDataSourceEditDiv" DataTextField="DivisionDesc" DataValueField="DivisionID" SelectedValue='<%# Bind("DivisionID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceEditDiv" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [DivisionID], [DivisionDesc] FROM [RefDivision] WHERE ([IsDivisionActive] = @IsDivisionActive) ORDER BY [DivisionDesc]">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="True" Name="IsDivisionActive" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>LevelID</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList8" runat="server" DataSourceID="SqlDataSourceEditLevel" DataTextField="LevelDesc" DataValueField="LevelID" SelectedValue='<%# Bind("LevelID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceEditLevel" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LevelID], [LevelDesc] FROM [RefUserLevel] WHERE ([IsLevelIDActive] = @IsLevelIDActive) ORDER BY [LevelID]">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="True" Name="IsLevelIDActive" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>PhoneNo</td>
                                <td>
                                    <asp:TextBox ID="PhoneNoTextBox" runat="server" Text='<%# Bind("PhoneNo") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>Description</td>
                                <td colspan="3">
                                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' Width="400px" />
                                </td>
                            </tr>
                            <tr>
                                <td>OrgEmail</td>
                                <td>
                                    <asp:TextBox ID="OrgEmailTextBox" runat="server" Text='<%# Bind("OrgEmail") %>' />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="OrgEmailTextBox" ErrorMessage="Org Email Address is not valid" ForeColor="#FF3300" ToolTip="Email Address is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="EditForm">*</asp:RegularExpressionValidator>
                                </td>
                                <td>OtherEmialAddress</td>
                                <td>
                                    <asp:TextBox ID="OtherEmialAddressTextBox" runat="server" Text='<%# Bind("OtherEmialAddress") %>' />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="OtherEmialAddressTextBox" ErrorMessage="Other Email Address is not valid" ForeColor="#FF3300" ToolTip="Email Address is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="EditForm">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>MgrEmailaddress</td>
                                <td>
                                    <asp:TextBox ID="MgrEmailaddressTextBox" runat="server" Text='<%# Bind("MgrEmailaddress") %>' />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="MgrEmailaddressTextBox" ErrorMessage="Other Email Address is not valid" ForeColor="#FF3300" ToolTip="Email Address is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="EditForm">*</asp:RegularExpressionValidator>
                                </td>
                                <td>CCEmail</td>
                                <td>
                                    <asp:TextBox ID="CCEmailTextBox" runat="server" Text='<%# Bind("CCEmail") %>' />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="CCEmailTextBox" ErrorMessage="CC Email Address is not valid" ForeColor="#FF3300" ToolTip="Email Address is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="EditForm">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">SendEmail</td>
                                <td class="auto-style8">
                                    <asp:CheckBox ID="SendEmailCheckBox" runat="server" Checked='<%# Bind("SendEmail") %>' />
                                </td>
                                <td class="auto-style8">Admin</td>
                                <td class="auto-style8">
                                    <asp:CheckBox ID="AdminCheckBox" runat="server" Checked='<%# Bind("Admin") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>AccountDisabled</td>
                                <td>
                                    <asp:CheckBox ID="AccountDisabledCheckBox" runat="server" Checked='<%# Bind("AccountDisabled") %>' />
                                </td>
                                <td>UserBlocked</td>
                                <td>
                                    <asp:CheckBox ID="UserBlockedCheckBox" runat="server" Checked='<%# Bind("UserBlocked") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2"></td>
                                <td class="auto-style2"></td>
                                <td class="auto-style2"></td>
                                <td align="right" class="auto-style2">
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="EditForm" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        &nbsp;
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table style="width: 100%;">
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center" valign="middle">Please select the user form list<br /> OR<br />
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Create New User" ValidationGroup="ViewForm" />
                                    <br />
                                    <br style="width: 100%" />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style9" colspan="4" style="font-weight: bold; font-size: x-large; color: #CCCCCC; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC;">New User Creation</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style10" colspan="3">
                                    <asp:ValidationSummary ID="ValidationSummary2" runat="server" CssClass="ErrorSummary" ForeColor="#FF3300" ValidationGroup="InsertForm" />
                                </td>
                            </tr>
                            <tr>
                                <td>OrgID</td>
                                <td class="auto-style10">
                                    <asp:DropDownList ID="DropDownList9" runat="server" DataSourceID="SqlDataSourceInserOrg" DataTextField="OrganizationName" DataValueField="OrgID" SelectedValue='<%# Bind("OrgID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceInserOrg" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [OrgID], [OrganizationName] FROM [CompanySettings]"></asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">LevelID</td>
                                <td class="auto-style11">
                                    <asp:DropDownList ID="DropDownList10" runat="server" DataSourceID="SqlDataSourceInsertLevel" DataTextField="LevelDesc" DataValueField="LevelID" SelectedValue='<%# Bind("LevelID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceInsertLevel" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LevelID], [LevelDesc] FROM [RefUserLevel] WHERE ([IsLevelIDActive] = @IsLevelIDActive)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="True" Name="IsLevelIDActive" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td class="auto-style7">&nbsp;</td>
                                <td class="auto-style7">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style7">UserName</td>
                                <td class="auto-style11">
                                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' ToolTip="Title i.e Mr. / Miss." Width="25px" />
                                    &nbsp;<asp:TextBox ID="UserNameTextBox" runat="server" Text='<%# Bind("UserName") %>' ToolTip="User Name" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TitleTextBox" ErrorMessage="Please Enter Title" ForeColor="#FF3300" ValidationGroup="InsertForm">*</asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="UserNameTextBox" ErrorMessage="Please Enter User Name" ForeColor="#FF3300" ValidationGroup="InsertForm">*</asp:RequiredFieldValidator>
                                </td>
                                <td class="auto-style7">UserID</td>
                                <td class="auto-style7">
                                    <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">Employee_id</td>
                                <td class="auto-style11">
                                    <asp:TextBox ID="Employee_idTextBox" runat="server" Text='<%# Bind("Employee_id") %>' />
                                </td>
                                <td class="auto-style7">Password</td>
                                <td class="auto-style7">
                                    <asp:TextBox ID="PasswordTextBox" runat="server" Text='<%# Bind("Password") %>' TextMode="Password" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style7">LocationID</td>
                                <td class="auto-style11">
                                    <asp:DropDownList ID="DropDownList11" runat="server" DataSourceID="SqlDataSourceInsertLocation" DataTextField="LocationDes" DataValueField="LocationID" SelectedValue='<%# Bind("LocationID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceInsertLocation" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LocationID], [LocationDes] FROM [RefLocation] WHERE ([BlockLocation] = @BlockLocation)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="False" Name="BlockLocation" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td class="auto-style7">DivisionID</td>
                                <td class="auto-style7">
                                    <asp:DropDownList ID="DropDownList12" runat="server" DataSourceID="SqlDataSourceInsertDiv" DataTextField="DivisionDesc" DataValueField="DivisionID" SelectedValue='<%# Bind("DivisionID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceInsertDiv" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [DivisionID], [DivisionDesc] FROM [RefDivision] WHERE ([IsDivisionActive] = @IsDivisionActive)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="True" Name="IsDivisionActive" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td>OrgEmail</td>
                                <td class="auto-style10">
                                    <asp:TextBox ID="OrgEmailTextBox" runat="server" Text='<%# Bind("OrgEmail") %>' />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="OrgEmailTextBox" ErrorMessage="Org Email Address is not valid" ForeColor="#FF3300" ToolTip="Email Address is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="InsertForm">*</asp:RegularExpressionValidator>
                                </td>
                                <td>OtherEmialAddress</td>
                                <td>
                                    <asp:TextBox ID="OtherEmialAddressTextBox" runat="server" Text='<%# Bind("OtherEmialAddress") %>' />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="OtherEmialAddressTextBox" ErrorMessage="Other Email Address is not valid" ForeColor="#FF3300" ToolTip="Email Address is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="InsertForm">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>MgrEmailaddress</td>
                                <td class="auto-style10">
                                    <asp:TextBox ID="MgrEmailaddressTextBox" runat="server" Text='<%# Bind("MgrEmailaddress") %>' />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="MgrEmailaddressTextBox" ErrorMessage="Other Email Address is not valid" ForeColor="#FF3300" ToolTip="Email Address is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="InsertForm">*</asp:RegularExpressionValidator>
                                </td>
                                <td>CCEmail</td>
                                <td>
                                    <asp:TextBox ID="CCEmailTextBox" runat="server" Text='<%# Bind("CCEmail") %>' />
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="CCEmailTextBox" ErrorMessage="CC Email Address is not valid" ForeColor="#FF3300" ToolTip="Email Address is not valid" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="InsertForm">*</asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>PhoneNo</td>
                                <td class="auto-style10">
                                    <asp:TextBox ID="PhoneNoTextBox" runat="server" Text='<%# Bind("PhoneNo") %>' />
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Description</td>
                                <td class="auto-style12" colspan="3">
                                    <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' Width="500px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">Admin</td>
                                <td class="auto-style13">
                                    <asp:CheckBox ID="AdminCheckBox" runat="server" Checked='<%# Bind("Admin") %>' />
                                </td>
                                <td class="auto-style2"></td>
                                <td class="auto-style2"></td>
                            </tr>
                            <tr>
                                <td>AccountDisabled</td>
                                <td class="auto-style10">
                                    <asp:CheckBox ID="AccountDisabledCheckBox" runat="server" Checked='<%# Bind("AccountDisabled") %>' />
                                </td>
                                <td>UserBlocked</td>
                                <td>
                                    <asp:CheckBox ID="UserBlockedCheckBox" runat="server" Checked='<%# Bind("UserBlocked") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>SendEmail</td>
                                <td class="auto-style10">
                                    <asp:CheckBox ID="SendEmailCheckBox" runat="server" Checked='<%# Bind("SendEmail") %>' />
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style2"></td>
                                <td class="auto-style13"></td>
                                <td class="auto-style2"></td>
                                <td align="right" class="auto-style2">&nbsp;<asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Save" ValidationGroup="InsertForm" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td align="char" class="auto-style2" colspan="4" style="font-weight: bold; font-size: x-large; color: #CCCCCC; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC;">User Defenition</td>
                            </tr>
                            <tr>
                                <td align="right" class="auto-style2" colspan="4">
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Create New User" ValidationGroup="ViewForm" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">OrgID</td>
                                <td class="auto-style2">
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceOrg" DataTextField="OrganizationName" DataValueField="OrgID" Height="16px" SelectedValue='<%# Bind("OrgID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceOrg" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [OrgID], [OrganizationName] FROM [CompanySettings]"></asp:SqlDataSource>
                                </td>
                                <td class="auto-style2"></td>
                                <td class="auto-style2"></td>
                            </tr>
                            <tr>
                                <td class="auto-style4">UserName</td>
                                <td>
                                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' />
                                    .
                                    <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
                                </td>
                                <td>UserID</td>
                                <td>
                                    <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">Employee_id</td>
                                <td>
                                    <asp:Label ID="Employee_idLabel" runat="server" Text='<%# Bind("Employee_id") %>' />
                                </td>
                                <td>LocationID</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceLocation" DataTextField="LocationDes" DataValueField="LocationID" SelectedValue='<%# Bind("LocationID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceLocation" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LocationID], [LocationDes] FROM [RefLocation]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">Description</td>
                                <td class="auto-style2" colspan="3">
                                    <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">OrgEmail</td>
                                <td>
                                    <asp:Label ID="OrgEmailLabel" runat="server" Text='<%# Bind("OrgEmail") %>' />
                                </td>
                                <td>OtherEmialAddress</td>
                                <td>
                                    <asp:Label ID="OtherEmialAddressLabel" runat="server" Text='<%# Bind("OtherEmialAddress") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">MgrEmailaddress</td>
                                <td>
                                    <asp:Label ID="MgrEmailaddressLabel" runat="server" Text='<%# Bind("MgrEmailaddress") %>' />
                                </td>
                                <td>CCEmail</td>
                                <td>
                                    <asp:Label ID="CCEmailLabel" runat="server" Text='<%# Bind("CCEmail") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">SendEmail</td>
                                <td>
                                    <asp:CheckBox ID="SendEmailCheckBox" runat="server" Checked='<%# Bind("SendEmail") %>' Enabled="false" />
                                </td>
                                <td>PhoneNo</td>
                                <td>
                                    <asp:Label ID="PhoneNoLabel" runat="server" Text='<%# Bind("PhoneNo") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">LevelID</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSourceLevel" DataTextField="LevelDesc" DataValueField="LevelID" SelectedValue='<%# Bind("LevelID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceLevel" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LevelID], [LevelDesc] FROM [RefUserLevel]"></asp:SqlDataSource>
                                </td>
                                <td>DivisionID</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1Division" DataTextField="DivisionDesc" DataValueField="DivisionID" SelectedValue='<%# Bind("DivisionID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1Division" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [DivisionID], [DivisionDesc] FROM [RefDivision]"></asp:SqlDataSource>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">Admin</td>
                                <td>
                                    <asp:CheckBox ID="AdminCheckBox" runat="server" Checked='<%# Bind("Admin") %>' Enabled="false" />
                                </td>
                                <td>AccountDisabled</td>
                                <td>
                                    <asp:CheckBox ID="AccountDisabledCheckBox" runat="server" Checked='<%# Bind("AccountDisabled") %>' Enabled="false" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style6">UserBlocked</td>
                                <td class="auto-style3">
                                    <asp:CheckBox ID="UserBlockedCheckBox" runat="server" Checked='<%# Bind("UserBlocked") %>' Enabled="false" />
                                </td>
                                <td class="auto-style3"></td>
                                <td align="right" class="auto-style3"></td>
                            </tr>
                            <tr>
                                <td align="right" colspan="4" style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Modify Privilege" ValidationGroup="ViewForm" />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4"></td>
                                <td class="auto-style2"></td>
                                <td class="auto-style2"></td>
                                <td class="auto-style2"></td>
                            </tr>
                        </table>
                        <asp:Label ID="PasswordLabel" runat="server" Text='<%# Bind("Password") %>' Visible="False" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" Visible="False" />
                        &nbsp;
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource1FormView" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" DeleteCommand="DELETE FROM [UserManager] WHERE [UserID] = @UserID" InsertCommand="INSERT INTO [UserManager] ([OrgID], [UserID], [UserName], [Password], [Description], [Admin], [Employee_id], [AccountDisabled], [UserBlocked], [LocationID], [OrgEmail], [OtherEmialAddress], [MgrEmailaddress], [SendEmail], [CCEmail], [PhoneNo], [Title], [LevelID], [DivisionID]) VALUES (@OrgID, @UserID, @UserName, @Password, @Description, @Admin, @Employee_id, @AccountDisabled, @UserBlocked, @LocationID, @OrgEmail, @OtherEmialAddress, @MgrEmailaddress, @SendEmail, @CCEmail, @PhoneNo, @Title, @LevelID, @DivisionID)" SelectCommand="SELECT [OrgID], [UserID], [UserName], [Password], [Description], [Admin], [Employee_id], [AccountDisabled], [UserBlocked], [LocationID], [OrgEmail], [OtherEmialAddress], [MgrEmailaddress], [SendEmail], [CCEmail], [PhoneNo], [Title], [LevelID], [DivisionID] FROM [UserManager] WHERE ([UserID] = @UserID)" UpdateCommand="UPDATE [UserManager] SET [OrgID] = @OrgID, [UserName] = @UserName,  [Description] = @Description, [Admin] = @Admin, [Employee_id] = @Employee_id, [AccountDisabled] = @AccountDisabled, [UserBlocked] = @UserBlocked, [LocationID] = @LocationID, [OrgEmail] = @OrgEmail, [OtherEmialAddress] = @OtherEmialAddress, [MgrEmailaddress] = @MgrEmailaddress, [SendEmail] = @SendEmail, [CCEmail] = @CCEmail, [PhoneNo] = @PhoneNo, [Title] = @Title, [LevelID] = @LevelID, [DivisionID] = @DivisionID WHERE [UserID] = @UserID">
                    <DeleteParameters>
                        <asp:Parameter Name="UserID" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="OrgID" Type="Decimal" />
                        <asp:Parameter Name="UserID" Type="String" />
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="Password" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Admin" Type="Boolean" />
                        <asp:Parameter Name="Employee_id" Type="String" />
                        <asp:Parameter Name="AccountDisabled" Type="Boolean" />
                        <asp:Parameter Name="UserBlocked" Type="Boolean" />
                        <asp:Parameter Name="LocationID" Type="Int32" />
                        <asp:Parameter Name="OrgEmail" Type="String" />
                        <asp:Parameter Name="OtherEmialAddress" Type="String" />
                        <asp:Parameter Name="MgrEmailaddress" Type="String" />
                        <asp:Parameter Name="SendEmail" Type="Boolean" />
                        <asp:Parameter Name="CCEmail" Type="String" />
                        <asp:Parameter Name="PhoneNo" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="LevelID" Type="Decimal" />
                        <asp:Parameter Name="DivisionID" Type="Decimal" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="UserID" PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="OrgID" Type="Decimal" />
                        <asp:Parameter Name="UserName" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="Admin" Type="Boolean" />
                        <asp:Parameter Name="Employee_id" Type="String" />
                        <asp:Parameter Name="AccountDisabled" Type="Boolean" />
                        <asp:Parameter Name="UserBlocked" Type="Boolean" />
                        <asp:Parameter Name="LocationID" Type="Int32" />
                        <asp:Parameter Name="OrgEmail" Type="String" />
                        <asp:Parameter Name="OtherEmialAddress" Type="String" />
                        <asp:Parameter Name="MgrEmailaddress" Type="String" />
                        <asp:Parameter Name="SendEmail" Type="Boolean" />
                        <asp:Parameter Name="CCEmail" Type="String" />
                        <asp:Parameter Name="PhoneNo" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="LevelID" Type="Decimal" />
                        <asp:Parameter Name="DivisionID" Type="Decimal" />
                        <asp:Parameter Name="UserID" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
   
</asp:Content>
