<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="idrequestaddView.aspx.cs" Inherits="ubank.idrequestaddView" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style15
        {
            height: 21px;
        }
        .style16
        {
            height: 22px;
        }
        .style30
        {
            height: 26px;
        }
        .style31
        {
            height: 16px;
        }
        .style32
        {
            width: 58px;
        }
        .style33
        {
            height: 22px;
            width: 58px;
        }
        .style34
        {
            height: 16px;
            width: 58px;
        }
        .style35
        {
            height: 21px;
            width: 58px;
        }
    </style>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblMessageLabel" runat="server" Font-Size="X-Small" 
                            ForeColor="#FF3300"></asp:Label>
    <asp:FormView ID="FormView1" runat="server" 
        DataSourceID="SqlDataSource1FormView" DefaultMode="Insert" 
        OnItemInserted="ItemInserted" DataKeyNames="AppID" OnItemInserting="frmAsset_ItemInserting" 
        style="margin-right: 11px" 
        >
        <EditItemTemplate>
            AppID:
            <asp:Label ID="AppIDLabel1" runat="server" Text='<%# Eval("AppID") %>' />
            <br />
            UserRequestTypeID:
            <asp:TextBox ID="UserRequestTypeIDTextBox" runat="server" 
                Text='<%# Bind("UserRequestTypeID") %>' />
            <br />
            LocationID:
            <asp:TextBox ID="LocationIDTextBox" runat="server" 
                Text='<%# Bind("LocationID") %>' />
            <br />
            DivisionID:
            <asp:TextBox ID="DivisionIDTextBox" runat="server" 
                Text='<%# Bind("DivisionID") %>' />
            <br />
            ProjectID:
            <asp:TextBox ID="ProjectIDTextBox" runat="server" 
                Text='<%# Bind("ProjectID") %>' />
            <br />
            SystemRoleID:
            <asp:TextBox ID="SystemRoleIDTextBox" runat="server" 
                Text='<%# Bind("SystemRoleID") %>' />
            <br />
            UserName:
            <asp:TextBox ID="UserNameTextBox" runat="server" 
                Text='<%# Bind("UserName") %>' />
            <br />
            EmpID:
            <asp:TextBox ID="EmpIDTextBox" runat="server" 
                Text='<%# Bind("EmpID") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            UserLimitsDr:
            <asp:TextBox ID="UserLimitsDrTextBox" runat="server" 
                Text='<%# Bind("UserLimitsDr") %>' />
            <br />
            UserLimitCr:
            <asp:TextBox ID="UserLimitCrTextBox" runat="server" 
                Text='<%# Bind("UserLimitCr") %>' />
            <br />
            UserSupLimitDr:
            <asp:TextBox ID="UserSupLimitDrTextBox" runat="server" 
                Text='<%# Bind("UserSupLimitDr") %>' />
            <br />
            UserSupLimitCr:
            <asp:TextBox ID="UserSupLimitCrTextBox" runat="server" 
                Text='<%# Bind("UserSupLimitCr") %>' />
            <br />
            ODLimit:
            <asp:TextBox ID="ODLimitTextBox" runat="server" 
                Text='<%# Bind("ODLimit") %>' />
            <br />
            IBATranLimitDr:
            <asp:TextBox ID="IBATranLimitDrTextBox" runat="server" 
                Text='<%# Bind("IBATranLimitDr") %>' />
            <br />
            IBATranLimitCr:
            <asp:TextBox ID="IBATranLimitCrTextBox" runat="server" 
                Text='<%# Bind("IBATranLimitCr") %>' />
            <br />
            IBATranSupLimitDr:
            <asp:TextBox ID="IBATranSupLimitDrTextBox" runat="server" 
                Text='<%# Bind("IBATranSupLimitDr") %>' />
            <br />
            IBATranSupLimitCr:
            <asp:TextBox ID="IBATranSupLimitCrTextBox" runat="server" 
                Text='<%# Bind("IBATranSupLimitCr") %>' />
            <br />
            Remarks:
            <asp:TextBox ID="RemarksTextBox" runat="server" 
                Text='<%# Bind("Remarks") %>' />
            <br />
            AppLevel:
            <asp:TextBox ID="AppLevelTextBox" runat="server" 
                Text='<%# Bind("AppLevel") %>' />
            <br />
            AppDate:
            <asp:TextBox ID="AppDateTextBox" runat="server" 
                Text='<%# Bind("AppDate") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td colspan="3">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                            Font-Size="X-Small" ForeColor="#FF3300" ValidationGroup="InsertApp" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Request Type</td>
                    <td>
                        <asp:DropDownList ID="UserRequestTypeIDTextBox" runat="server" 
                            DataSourceID="SqlDataSource1" DataTextField="UserRequestType" 
                            DataValueField="UserRequestTypeID" Height="25px" 
                            SelectedValue='<%# Bind("UserRequestTypeID") %>' style="margin-right: 0px" 
                            Width="336px" 
                            onselectedindexchanged="UserRequestTypeIDTextBox_SelectedIndexChanged" AutoPostBack="True"  
                           >
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:strConn %>" 
                            SelectCommand="SELECT [UserRequestTypeID], [UserRequestType] FROM [RefUserRequestType] WHERE ([IsUserRequestTypeActive] = @IsUserRequestTypeActive) ORDER BY [UserRequestTypeID]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="True" Name="IsUserRequestTypeActive" 
                                    Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="UserRequestTypeIDTextBox" 
                            ErrorMessage="Please Select Request Type from the list" ForeColor="#FF3300" 
                            InitialValue="0" ValidationGroup="InsertApp">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style32">
                        App Date</td>
                    <td>
                        <asp:TextBox ID="AppDateTextBox" runat="server" Text='<%# Bind("AppDate") %>' 
                            ReadOnly="True" />
                    </td>
                </tr>
                <tr>
                    <td>
                        Branch</td>
                    <td>
                        <asp:DropDownList ID="cmbBranch" runat="server" 
                            DataSourceID="SqlDataSourceBranches" DataTextField="LocationDes" 
                            DataValueField="LocationID" Height="25px" 
                            SelectedValue='<%# Bind("LocationID") %>' Width="336px">
                        </asp:DropDownList>
                        <asp:ListSearchExtender ID="cmbBranch_ListSearchExtender" runat="server" 
                            Enabled="True" TargetControlID="cmbBranch">
                        </asp:ListSearchExtender>
                        <asp:SqlDataSource ID="SqlDataSourceBranches" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:strConn %>" 
                            SelectCommand="SELECT [LocationID], [LocationDes] FROM [RefLocation] WHERE ([BlockLocation] = @BlockLocation) ORDER BY [LocationID]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="False" Name="BlockLocation" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="cmbBranch" ErrorMessage="Select Branch from list" 
                            ForeColor="#FF3300" InitialValue="0" ValidationGroup="InsertApp">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style32">
                        <asp:Label ID="Label8" runat="server" Text="Division"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="cmbDivision" runat="server" 
                            DataSourceID="SqlDataSourceDivision" DataTextField="DivisionDesc" 
                            DataValueField="DivisionID" Height="25px" 
                            SelectedValue='<%# Bind("DivisionID") %>' Width="336px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceDivision" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:strConn %>" 
                            SelectCommand="SELECT [DivisionID], [DivisionDesc] FROM [RefDivision] WHERE ([IsDivisionActive] = @IsDivisionActive) ORDER BY [DivisionID]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="True" Name="IsDivisionActive" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="cmbDivision" ErrorMessage="Select Division from list" 
                            ForeColor="#FF3300" InitialValue="0" ValidationGroup="InsertApp">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style16">
                        <asp:Label ID="Label6" runat="server" Text="User Name"></asp:Label>
                    </td>
                    <td class="style16">
                        <asp:TextBox ID="UserNameTextBox" runat="server" 
                            Text='<%# Bind("UserName") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="UserNameTextBox" ErrorMessage="Please enter your name" 
                            ForeColor="#FF3300" ValidationGroup="InsertApp">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style33">
                        EmpID</td>
                    <td class="style16">
                        <asp:TextBox ID="EmpIDTextBox" runat="server" Text='<%# Bind("EmpID") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style31">
                        Email</td>
                    <td class="style31">
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="EmailTextBox" ErrorMessage="Please enter email address" 
                            ForeColor="#FF3300" ValidationGroup="InsertApp">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="EmailTextBox" ErrorMessage="Email Address is not valid" 
                            ForeColor="#FF3300" ToolTip="Email Address is not valid" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ValidationGroup="InsertApp">*</asp:RegularExpressionValidator>
                    </td>
                    <td class="style34">
                        Existing ID</td>
                    <td class="style31">
                        <asp:TextBox ID="txtUserExistingID" runat="server" 
                            Text='<%# Bind("UserExistingID") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="txtUserExistingID" ErrorMessage="Please enter Existing ID" 
                            ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style15">
                        <asp:Label ID="Label9" runat="server" Text="Application"></asp:Label>
                    </td>
                    <td class="style15">
                        <asp:DropDownList ID="cmdProjectID" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSourceApplicatioin" DataTextField="ProjectDes" 
                            DataValueField="ProjectID" Height="25px" 
                            SelectedValue='<%# Bind("ProjectID") %>' Width="336px">
                            <asp:ListItem>PIBAS</asp:ListItem>
                            <asp:ListItem>Sybase</asp:ListItem>
                            <asp:ListItem>UBPS</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceApplicatioin" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:strConn %>" 
                            SelectCommand="SELECT [ProjectID], [ProjectDes] FROM [RefProjects] WHERE ([ProjectActive] = @ProjectActive) ORDER BY [ProjectID]">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="True" Name="ProjectActive" Type="Boolean" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td class="style35">
                    </td>
                    <td class="style15">
                    </td>
                </tr>
                <tr>
                    <td>
                        System Role</td>
                    <td>
                        <asp:DropDownList ID="cmbSystemRoleID" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSourceSystemRoles" DataTextField="SystemRole" 
                            DataValueField="SystemRoleID" Height="25px" Width="333px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceSystemRoles" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:strConn %>" 
                            SelectCommand="SELECT [SystemRoleID], [SystemRole] FROM [RefSystemRole] WHERE (([DivisionID] = @DivisionID) AND ([IsSystemRoleActive] = @IsSystemRoleActive) AND ([ProjectID] = @ProjectID)) ORDER BY [SystemRoleID]">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cmbDivision" DefaultValue="0" 
                                    Name="DivisionID" PropertyName="SelectedValue" Type="Decimal" />
                                <asp:Parameter DefaultValue="True" Name="IsSystemRoleActive" Type="Boolean" />
                                <asp:ControlParameter ControlID="cmdProjectID" DefaultValue="0" 
                                    Name="ProjectID" PropertyName="SelectedValue" Type="Decimal" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="cmbSystemRoleID" ErrorMessage="Select System Role" 
                            ForeColor="#FF3300" ValidationGroup="InsertApp">*</asp:RequiredFieldValidator>
                    </td>
                    <td class="style32">
                        Tran. Code List</td>
                    <td>
                        <asp:ListBox ID="ListBox1" runat="server" 
                            DataSourceID="SqlDataSourceSystemRolsTranList" DataTextField="TranCode" 
                            DataValueField="TranCode" style="margin-left: 0px" Width="273px" 
                            Height="45px">
                        </asp:ListBox>
                        <asp:SqlDataSource ID="SqlDataSourceSystemRolsTranList" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:strConn %>" 
                            SelectCommand="SELECT [TranCode] FROM [RefSystemRole] WHERE (([SystemRoleID] = @SystemRoleID) AND ([DivisionID] = @DivisionID) AND ([ProjectID] = @ProjectID))">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cmbSystemRoleID" Name="SystemRoleID" 
                                    PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="cmbDivision" Name="DivisionID" 
                                    PropertyName="SelectedValue" Type="Decimal" />
                                <asp:ControlParameter ControlID="cmdProjectID" Name="ProjectID" 
                                    PropertyName="SelectedValue" Type="Decimal" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td class="style15">
                        Limits</td>
                    <td class="style15">
                        <table style="width:100%;">
                            <tr>
                                <td class="style15">
                                    Debit</td>
                                <td class="style15">
                                    Credit</td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    <asp:TextBox ID="UserLimitsDrTextBox" runat="server" 
                                        Text='<%# Bind("UserLimitsDr") %>' />
                                </td>
                                <td class="style15">
                                    <asp:TextBox ID="UserLimitCrTextBox" runat="server" 
                                        Text='<%# Bind("UserLimitCr") %>' />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="style35">
                        Supervion Limits</td>
                    <td class="style15">
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    Debit</td>
                                <td>
                                    Credit</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="UserSupLimitDrTextBox" runat="server" 
                                        Text='<%# Bind("UserSupLimitDr") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="UserSupLimitCrTextBox" runat="server" 
                                        Text='<%# Bind("UserSupLimitCr") %>' />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        IBA Tran. Limits</td>
                    <td>
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    Debit</td>
                                <td>
                                    Credit</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="IBATranLimitDrTextBox" runat="server" 
                                        Text='<%# Bind("IBATranLimitDr") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="IBATranLimitCrTextBox" runat="server" 
                                        Text='<%# Bind("IBATranLimitCr") %>' />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td class="style32">
                        &nbsp;</td>
                    <td>
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    Debit</td>
                                <td>
                                    Credit</td>
                            </tr>
                            <tr>
                                <td class="style30">
                                    <asp:TextBox ID="IBATranSupLimitDrTextBox" runat="server" 
                                        Text='<%# Bind("IBATranSupLimitDr") %>' />
                                </td>
                                <td class="style30">
                                    <asp:TextBox ID="IBATranSupLimitCrTextBox" runat="server" 
                                        Text='<%# Bind("IBATranSupLimitCr") %>' />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        ODLimit</td>
                    <td>
                        <asp:TextBox ID="ODLimitTextBox" runat="server" Text='<%# Bind("ODLimit") %>' />
                    </td>
                    <td class="style32">
                        Remarks</td>
                    <td>
                        <asp:TextBox ID="RemarksTextBox" runat="server" Height="25px" 
                            Text='<%# Bind("Remarks") %>' Width="327px" TextMode="MultiLine" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="txtUserExistingID" ErrorMessage="Please enter remarks incase of Limit Enhancement" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td class="style32">
                        &nbsp;</td>
                    <td align="right">
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Submit Application" ValidationGroup="InsertApp" OnClick="InsertButton_Click" 
                            />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" 
                            onclick="InsertCancelButton_Click" />
                    </td>
                </tr>
            </table>
        </InsertItemTemplate>
        <ItemTemplate>
            AppID:
            <asp:Label ID="AppIDLabel" runat="server" Text='<%# Eval("AppID") %>' />
            <br />
            UserRequestTypeID:
            <asp:Label ID="UserRequestTypeIDLabel" runat="server" 
                Text='<%# Bind("UserRequestTypeID") %>' />
            <br />
            LocationID:
            <asp:Label ID="LocationIDLabel" runat="server" 
                Text='<%# Bind("LocationID") %>' />
            <br />
            DivisionID:
            <asp:Label ID="DivisionIDLabel" runat="server" 
                Text='<%# Bind("DivisionID") %>' />
            <br />
            ProjectID:
            <asp:Label ID="ProjectIDLabel" runat="server" Text='<%# Bind("ProjectID") %>' />
            <br />
            SystemRoleID:
            <asp:Label ID="SystemRoleIDLabel" runat="server" 
                Text='<%# Bind("SystemRoleID") %>' />
            <br />
            UserName:
            <asp:Label ID="UserNameLabel" runat="server" Text='<%# Bind("UserName") %>' />
            <br />
            EmpID:
            <asp:Label ID="EmpIDLabel" runat="server" Text='<%# Bind("EmpID") %>' />
            <br />
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            UserLimitsDr:
            <asp:Label ID="UserLimitsDrLabel" runat="server" 
                Text='<%# Bind("UserLimitsDr") %>' />
            <br />
            UserLimitCr:
            <asp:Label ID="UserLimitCrLabel" runat="server" 
                Text='<%# Bind("UserLimitCr") %>' />
            <br />
            UserSupLimitDr:
            <asp:Label ID="UserSupLimitDrLabel" runat="server" 
                Text='<%# Bind("UserSupLimitDr") %>' />
            <br />
            UserSupLimitCr:
            <asp:Label ID="UserSupLimitCrLabel" runat="server" 
                Text='<%# Bind("UserSupLimitCr") %>' />
            <br />
            ODLimit:
            <asp:Label ID="ODLimitLabel" runat="server" Text='<%# Bind("ODLimit") %>' />
            <br />
            IBATranLimitDr:
            <asp:Label ID="IBATranLimitDrLabel" runat="server" 
                Text='<%# Bind("IBATranLimitDr") %>' />
            <br />
            IBATranLimitCr:
            <asp:Label ID="IBATranLimitCrLabel" runat="server" 
                Text='<%# Bind("IBATranLimitCr") %>' />
            <br />
            IBATranSupLimitDr:
            <asp:Label ID="IBATranSupLimitDrLabel" runat="server" 
                Text='<%# Bind("IBATranSupLimitDr") %>' />
            <br />
            IBATranSupLimitCr:
            <asp:Label ID="IBATranSupLimitCrLabel" runat="server" 
                Text='<%# Bind("IBATranSupLimitCr") %>' />
            <br />
            Remarks:
            <asp:Label ID="RemarksLabel" runat="server" Text='<%# Bind("Remarks") %>' />
            <br />
            AppLevel:
            <asp:Label ID="AppLevelLabel" runat="server" Text='<%# Bind("AppLevel") %>' />
            <br />

            AppDate:
            <asp:Label ID="AppDateLabel" runat="server" Text='<%# Bind("AppDate") %>' />
            <br />
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
                CommandName="New" Text="New" />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1FormView" runat="server" OnInserted="SQLDBItemInserted"
        ConnectionString="<%$ ConnectionStrings:strConn %>" 
        InsertCommand="INSERT INTO Application(UserRequestTypeID, LocationID, DivisionID, ProjectID, SystemRoleID, UserName, EmpID, Email, UserLimitsDr, UserLimitCr, UserSupLimitDr, UserSupLimitCr, ODLimit, IBATranLimitDr, IBATranLimitCr, IBATranSupLimitDr, IBATranSupLimitCr, Remarks, AppLevel, AppDate, UserExistingID) VALUES (@UserRequestTypeID, @LocationID, @DivisionID, @ProjectID, @SystemRoleID, @UserName, @EmpID, @Email, @UserLimitsDr, @UserLimitCr, @UserSupLimitDr, @UserSupLimitCr, @ODLimit, @IBATranLimitDr, @IBATranLimitCr, @IBATranSupLimitDr, @IBATranSupLimitCr, @Remarks, 1, @AppDate, @UserExistingID) SELECT @AppId = SCOPE_IDENTITY()" 
        SelectCommand="SELECT * FROM [Application]">
        <InsertParameters>
            <asp:Parameter Name="UserRequestTypeID" />
            <asp:Parameter Name="LocationID" />
            <asp:Parameter Name="DivisionID" />
            <asp:Parameter Name="ProjectID" />
            <asp:Parameter Name="SystemRoleID" />
            <asp:Parameter Name="UserName" />
            <asp:Parameter Name="EmpID" />
            <asp:Parameter Name="Email" />
            <asp:Parameter Name="UserLimitsDr" />
            <asp:Parameter Name="UserLimitCr" />
            <asp:Parameter Name="UserSupLimitDr" />
            <asp:Parameter Name="UserSupLimitCr" />
            <asp:Parameter Name="ODLimit" />
            <asp:Parameter Name="IBATranLimitDr" />
            <asp:Parameter Name="IBATranLimitCr" />
            <asp:Parameter Name="IBATranSupLimitDr" />
            <asp:Parameter Name="IBATranSupLimitCr" />
            <asp:Parameter Name="Remarks" />
            <asp:Parameter Name="AppDate" />
            <asp:Parameter Name="UserExistingID" />
            <asp:Parameter Name="AppId" Direction="Output" Type="Int64" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>
