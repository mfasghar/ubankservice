<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="idsecondlevel.aspx.cs" Inherits="ubank.idsecondlevel" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style15
        {
            width: 193px;
        }
        .style16
        {
            height: 26px;
        }
        .style17
        {
        }
        .style18
        {
            height: 26px;
            width: 137px;
        }
        .style19
        {
            height: 21px;
        }
        .style20
        {
            height: 39px;
        }
        .style22
        {
            width: 133px;
        }
        .style24
        {
            height: 21px;
            width: 137px;
        }
        .style25
        {
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td class="style15">
                Pending Requests</td>
            <td>
                <asp:Label ID="lblmsg" runat="server" Font-Size="Small" ForeColor="#FF3300"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style15" valign="top">
                <asp:ListBox ID="ListBox1" runat="server" Height="544px" Width="217px" 
                    AutoPostBack="True" DataSourceID="SqlDSListOfAppUnsup" 
                    DataTextField="ApplicanttName" DataValueField="AppID" 
                    >
                </asp:ListBox>
                <asp:SqlDataSource ID="SqlDSListOfAppUnsup" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strConn %>" 
                    
                    
                    SelectCommand="SELECT AppID, ApplicanttName FROM ListOfPendingApps WHERE  (UserID = @UserID) AND (IsClosed = @IsClosed) AND (IsSupervised = @IsSupervised) AND (AppLevel = LevelID - 1)">
                    <SelectParameters>
                        <asp:SessionParameter Name="UserID" SessionField="UserID" Type="String" />
                        <asp:Parameter DefaultValue="False" Name="IsClosed" Type="Boolean" />
                        <asp:Parameter DefaultValue="False" Name="IsSupervised" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="left" valign="top">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceStatus" 
                    ForeColor="#333333" GridLines="None" Height="131px" PageSize="3" Width="637px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="LevelDesc" HeaderText="Level" 
                            SortExpression="LevelDesc">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Supervisors" HeaderText="Supervisors" 
                            SortExpression="Supervisors">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="250px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" 
                            SortExpression="Status">
                        <HeaderStyle HorizontalAlign="Left" />
                        <ItemStyle Width="150px" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strConn %>" 
                    SelectCommand="SELECT [LevelDesc], [Supervisors], [Status] FROM [ApplicationStatus] WHERE ([AppID] = @AppID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="AppID" 
                            PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="AppID" 
                    DataSourceID="SqlDataSource1VApplication" style="margin-right: 5px" 
                    DefaultMode="Edit" Height="429px" 
                    OnItemUpdated = "CheckAndUpdateStatus" 
                    OnPreRender = "FormView1_PreRender"
                    
                    >
                    <EditItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td colspan="4" 
                                    
                                    style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC; font-weight: bold;" 
                                    class="style1">
                                    Supervison of Application
                                </td>
                            </tr>
                            <tr>
                                <td class="style25">
                                    Application ID</td>
                                <td>
                                    <asp:Label ID="AppIDLabel1" runat="server" Text='<%# Eval("AppID") %>' />
                                </td>
                                <td>
                                    UserRequestType</td>
                                <td>
                                    <asp:TextBox ID="UserRequestTypeTextBox" runat="server" Height="22px" 
                                        Text='<%# Bind("UserRequestType") %>' Width="128px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style25">
                                    Location</td>
                                <td>
                                    <asp:TextBox ID="LocationDesTextBox" runat="server" 
                                        Text='<%# Bind("LocationDes") %>' />
                                </td>
                                <td>
                                    Division</td>
                                <td>
                                    <asp:TextBox ID="DivisionDescTextBox" runat="server" 
                                        Text='<%# Bind("DivisionDesc") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="style18">
                                    Applicant Name</td>
                                <td class="style16">
                                    <asp:TextBox ID="UserNameTextBox" runat="server" 
                                        Text='<%# Bind("UserName") %>' />
                                </td>
                                <td class="style16">
                                    Employee ID</td>
                                <td class="style16">
                                    <asp:TextBox ID="EmpIDTextBox" runat="server" Text='<%# Bind("EmpID") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="style25">
                                    Email</td>
                                <td>
                                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                </td>
                                <td>
                                    App Level</td>
                                <td>
                                    <asp:TextBox ID="LevelDescTextBox" runat="server" 
                                        Text='<%# Bind("LevelDesc") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="style25">
                                    Project</td>
                                <td>
                                    <asp:TextBox ID="ProjectDesTextBox" runat="server" 
                                        Text='<%# Bind("ProjectDes") %>' />
                                </td>
                                <td>
                                    Existing ID</td>
                                <td>
                                    <asp:TextBox ID="txtExistingID" runat="server" 
                                        Text='<%# Bind("UserExistingID") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style25">
                                    SystemRole</td>
                                <td>
                                    <asp:TextBox ID="SystemRoleTextBox" runat="server" 
                                        Text='<%# Bind("SystemRole") %>' />
                                </td>
                                <td>
                                    TranCode if any</td>
                                <td>
                                    <asp:TextBox ID="TranCodeTextBox" runat="server" 
                                        Text='<%# Bind("TranCode") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="style17" colspan="4" 
                                    style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; font-weight: bold;">
                                    User Limits
                                </td>
                            </tr>
                            <tr>
                                <td class="style20" colspan="2">
                                    <table style="width:100%;">
                                        <tr>
                                            <td>
                                                Debit Limit</td>
                                            <td>
                                                Credit Limit</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:TextBox ID="UserLimitsDrTextBox" runat="server" 
                                                    Text='<%# Bind("UserLimitsDr") %>' />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserLimitCrTextBox" runat="server" 
                                                    Text='<%# Bind("UserLimitCr") %>' />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="style20" colspan="2">
                                    <table style="width:100%;">
                                        <tr>
                                            <td class="style22">
                                                Supervision Dr Limit</td>
                                            <td>
                                                SupervisionCredit Limit</td>
                                        </tr>
                                        <tr>
                                            <td class="style22">
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
                                <td class="style24">
                                    IBA Debit Limit</td>
                                <td class="style19">
                                    IBA Credit Limit</td>
                                <td class="style19">
                                    IBA Supersion Debit</td>
                                <td class="style19">
                                    IBA Supervsion Credit</td>
                            </tr>
                            <tr>
                                <td class="style25">
                                    <asp:TextBox ID="IBATranLimitDrTextBox" runat="server" 
                                        Text='<%# Bind("IBATranLimitDr") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="IBATranLimitCrTextBox" runat="server" 
                                        Text='<%# Bind("IBATranLimitCr") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="IBATranSupLimitDrTextBox" runat="server" 
                                        Text='<%# Bind("IBATranSupLimitDr") %>' />
                                </td>
                                <td>
                                    <asp:TextBox ID="IBATranSupLimitCrTextBox" runat="server" 
                                        Text='<%# Bind("IBATranSupLimitCr") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="style25">
                                    ODLimit</td>
                                <td>
                                    <asp:TextBox ID="ODLimitTextBox" runat="server" Text='<%# Bind("ODLimit") %>' />
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style25" colspan="4" 
                                    style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC">
                                    Remarks</td>
                            </tr>
                            <tr>
                                <td class="style25" colspan="4">
                                    <asp:TextBox ID="RemarksTextBox" runat="server" Height="68px" 
                                        Text='<%# Bind("Remarks") %>' TextMode="MultiLine" Width="599px" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style25">
                                    Decline Reason</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td align="right">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style25" colspan="4">
                                    <asp:TextBox ID="txtDeclineReason" runat="server" TextMode="MultiLine" 
                                        Width="596px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="txtDeclineReason" ErrorMessage="Please enter decline reason" 
                                        ValidationGroup="DeclineReason">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender" 
                                        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="style25">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td align="right">
                                    &nbsp;<asp:LinkButton ID="cmdDecline" runat="server" CommandName="Decline" 
                                        onclick="cmdDecline_Click" 
                                        OnClientClick="return confirm('Are you certain you want to Decline this Application?');" 
                                        ValidationGroup="DeclineReason">Decline</asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                        CommandName="Update" Text="Update" ValidationGroup="Supervised" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </td>
                            </tr>
                        </table>
                        <asp:TextBox ID="UserRequestTypeIDTextBox" runat="server" 
                            Text='<%# Bind("UserRequestTypeID") %>' Height="21px" Visible="False" 
                            Width="16px" />
                        <asp:TextBox ID="SystemRoleIDTextBox" runat="server" 
                            Text='<%# Bind("SystemRoleID") %>' Height="24px" Visible="False" 
                            Width="17px" />
                        <asp:TextBox ID="AppLevelTextBox" runat="server" 
                            Text='<%# Bind("AppLevel") %>' Height="17px" Visible="False" 
                            Width="16px" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        &nbsp;&nbsp;
                        <div style="color: #0099FF">
                            <asp:Label ID="Label6" runat="server" 
                                Text="No Application is selected from the list" Width="543px"></asp:Label>
                        </div>
                        &nbsp;<div>
                            &nbsp;<asp:Label ID="Label5" runat="server" 
                                Text="Please select name of applicant from Application pending list to Supervise of Decline......." 
                                Width="543px"></asp:Label>
                        </div>
                        <br />
&nbsp;
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        AppID:
                        <asp:TextBox ID="AppIDTextBox" runat="server" Text='<%# Bind("AppID") %>' />
                        <br />
                        UserRequestType:
                        <asp:TextBox ID="UserRequestTypeTextBox" runat="server" 
                            Text='<%# Bind("UserRequestType") %>' />
                        <br />
                        LocationDes:
                        <asp:TextBox ID="LocationDesTextBox" runat="server" 
                            Text='<%# Bind("LocationDes") %>' />
                        <br />
                        DivisionDesc:
                        <asp:TextBox ID="DivisionDescTextBox" runat="server" 
                            Text='<%# Bind("DivisionDesc") %>' />
                        <br />
                        LevelDesc:
                        <asp:TextBox ID="LevelDescTextBox" runat="server" 
                            Text='<%# Bind("LevelDesc") %>' />
                        <br />
                        SystemRole:
                        <asp:TextBox ID="SystemRoleTextBox" runat="server" 
                            Text='<%# Bind("SystemRole") %>' />
                        <br />
                        TranCode:
                        <asp:TextBox ID="TranCodeTextBox" runat="server" 
                            Text='<%# Bind("TranCode") %>' />
                        <br />
                        ProjectDes:
                        <asp:TextBox ID="ProjectDesTextBox" runat="server" 
                            Text='<%# Bind("ProjectDes") %>' />
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
                        <asp:TextBox ID="EmpIDTextBox" runat="server" Text='<%# Bind("EmpID") %>' />
                        <br />
                        UserLimitsDr:
                        <asp:TextBox ID="UserLimitsDrTextBox" runat="server" 
                            Text='<%# Bind("UserLimitsDr") %>' />
                        <br />
                        Email:
                        <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
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
                        <asp:TextBox ID="ODLimitTextBox" runat="server" Text='<%# Bind("ODLimit") %>' />
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
                        <asp:TextBox ID="RemarksTextBox" runat="server" Text='<%# Bind("Remarks") %>' />
                        <br />
                        AppLevel:
                        <asp:TextBox ID="AppLevelTextBox" runat="server" 
                            Text='<%# Bind("AppLevel") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                            CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        AppID:
                        <asp:Label ID="AppIDLabel" runat="server" Text='<%# Eval("AppID") %>' />
                        <br />
                        UserRequestType:
                        <asp:Label ID="UserRequestTypeLabel" runat="server" 
                            Text='<%# Bind("UserRequestType") %>' />
                        <br />
                        LocationDes:
                        <asp:Label ID="LocationDesLabel" runat="server" 
                            Text='<%# Bind("LocationDes") %>' />
                        <br />
                        DivisionDesc:
                        <asp:Label ID="DivisionDescLabel" runat="server" 
                            Text='<%# Bind("DivisionDesc") %>' />
                        <br />
                        LevelDesc:
                        <asp:Label ID="LevelDescLabel" runat="server" Text='<%# Bind("LevelDesc") %>' />
                        <br />
                        SystemRole:
                        <asp:Label ID="SystemRoleLabel" runat="server" 
                            Text='<%# Bind("SystemRole") %>' />
                        <br />
                        TranCode:
                        <asp:Label ID="TranCodeLabel" runat="server" Text='<%# Bind("TranCode") %>' />
                        <br />
                        ProjectDes:
                        <asp:Label ID="ProjectDesLabel" runat="server" 
                            Text='<%# Bind("ProjectDes") %>' />
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
                        UserLimitsDr:
                        <asp:Label ID="UserLimitsDrLabel" runat="server" 
                            Text='<%# Bind("UserLimitsDr") %>' />
                        <br />
                        Email:
                        <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
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

                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource1VApplication" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strConn %>" 
                    SelectCommand="SELECT * FROM [vApplication] WHERE ([AppID] = @AppID) and userid = @userid" 
                    
                    UpdateCommand="UPDATE vApplication SET IsSupervised = @IsSupervised WHERE (AppID = @AppID) AND (UserID = @UserID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="AppID" 
                            PropertyName="SelectedValue" Type="Decimal" />
                        <asp:SessionParameter Name="userid" SessionField="UserID" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter DefaultValue="1" Name="IsSupervised" />
                        <asp:Parameter Name="AppID" />
                        <asp:SessionParameter DefaultValue="" Name="UserID" SessionField="UserID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>
</asp:Content>
