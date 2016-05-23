<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="itthirdlevel.aspx.cs" Inherits="ubank.itthirdlevel" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .style15
        {
            width: 193px;
        }
        .style18
        {
            height: 26px;
            width: 320px;
        }
        .style16
        {
            height: 26px;
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
            width: 320px;
        }
        .style19
        {
            height: 21px;
        }
        .style25
        {
            width: 376px;
        }
        .style26
        {
        }
        .style27
        {
            width: 121px;
        }
        .style28
        {
            height: 26px;
            width: 121px;
        }
        .style29
        {
            height: 21px;
            width: 121px;
        }
        .style30
        {
            width: 320px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%; height: 767px;">
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
                    DataTextField="UserName" DataValueField="AppID" 
                    ></asp:ListBox>
                <asp:SqlDataSource ID="SqlDSListOfAppUnsup" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strConn %>" 
                    
                    
                    
                    SelectCommand="SELECT [AppID], [UserName] FROM [vReadyForITOperatio] WHERE ([AppLevel] = @AppLevel)">
                    <SelectParameters>
                        <asp:SessionParameter Name="AppLevel" SessionField="LevelID" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="left" valign="top">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSourceStatus" 
                    ForeColor="#333333" GridLines="None" Height="16px" PageSize="3" 
                    Width="627px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="UserName" HeaderText="Supervisor" 
                            SortExpression="UserName">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="LevelDesc" HeaderText="LevelDesc" 
                            SortExpression="LevelDesc">
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle Width="200px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" 
                            SortExpression="Status">
                        <HeaderStyle HorizontalAlign="Left" />
                        </asp:BoundField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" BorderColor="#CCCCCC" 
                        BorderStyle="Solid" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:strConn %>" 
                    
                    SelectCommand="SELECT UserName, LevelDesc, Status FROM ApplicationStatusForOops WHERE (AppID = @AppID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="AppID" 
                            PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="AppID" 
                    DataSourceID="SqlDataSource1VApplication" style="margin-right: 5px" 
                    OnItemUpdated = "CheckAndUpdateStatus"
                    DefaultMode="Edit" Height="429px" Width="303px" 
                                  
                    >
                    <EditItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td colspan="4" 
                                    
                                    style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC; " 
                                    class="style1">
                                    Processing of Application
                                </td>
                            </tr>
                            <tr>
                                <td class="style30" style="background-color: #FFFFFF">
                                    Application ID</td>
                                <td style="background-color: #FFFFFF">
                                    <asp:Label ID="AppIDLabel1" runat="server" Text='<%# Eval("AppID") %>' />
                                </td>
                                <td class="style27" style="background-color: #FFFFFF">
                                    UserRequestType</td>
                                <td style="background-color: #FFFFFF">
                                    <asp:TextBox ID="UserRequestTypeTextBox" runat="server" Height="22px" 
                                        Text='<%# Bind("UserRequestType") %>' Width="128px" ReadOnly="True" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style30" style="background-color: #FFFFFF">
                                    Location</td>
                                <td style="background-color: #FFFFFF">
                                    <asp:TextBox ID="LocationDesTextBox" runat="server" 
                                        Text='<%# Bind("LocationDes") %>' Width="130px" ReadOnly="True" />
                                </td>
                                <td class="style27" style="background-color: #FFFFFF">
                                    Division</td>
                                <td style="background-color: #FFFFFF">
                                    <asp:TextBox ID="DivisionDescTextBox" runat="server" 
                                        Text='<%# Bind("DivisionDesc") %>' ReadOnly="True" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style18" style="background-color: #FFFFFF">
                                    Applicant Name</td>
                                <td class="style16" style="background-color: #FFFFFF">
                                    <asp:TextBox ID="UserNameTextBox" runat="server" 
                                        Text='<%# Bind("UserName") %>' ReadOnly="True" />
                                </td>
                                <td class="style28" style="background-color: #FFFFFF">
                                    Employee ID</td>
                                <td class="style16" style="background-color: #FFFFFF">
                                    <asp:TextBox ID="EmpIDTextBox" runat="server" Text='<%# Bind("EmpID") %>' 
                                        Width="130px" ReadOnly="True" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style30" style="background-color: #FFFFFF">
                                    Email</td>
                                <td style="background-color: #FFFFFF">
                                    <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' 
                                        ReadOnly="True" />
                                </td>
                                <td class="style27" style="background-color: #FFFFFF">
                                    App Level</td>
                                <td style="background-color: #FFFFFF">
                                    <asp:TextBox ID="LevelDescTextBox" runat="server" 
                                        Text='<%# Bind("LevelDesc") %>' ReadOnly="True" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style30" style="background-color: #FFFFFF">
                                    Project</td>
                                <td style="background-color: #FFFFFF">
                                    <asp:TextBox ID="ProjectDesTextBox" runat="server" 
                                        Text='<%# Bind("ProjectDes") %>' ReadOnly="True" />
                                </td>
                                <td class="style27" style="background-color: #FFFFFF">
                                    Existing ID</td>
                                <td style="background-color: #FFFFFF">
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserExistingID") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style30" style="background-color: #FFFFFF">
                                    SystemRole</td>
                                <td style="background-color: #FFFFFF">
                                    <asp:TextBox ID="SystemRoleTextBox" runat="server" 
                                        Text='<%# Bind("SystemRole") %>' ReadOnly="True" />
                                </td>
                                <td class="style27" style="background-color: #FFFFFF">
                                    TranCode if any</td>
                                <td style="background-color: #FFFFFF">
                                    <asp:TextBox ID="TranCodeTextBox" runat="server" 
                                        Text='<%# Bind("TranCode") %>' ReadOnly="True" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style17" colspan="4" 
                                    style="background-color: #FFFFFF;">
                                    User Limits
                                </td>
                            </tr>
                            <tr>
                                <td class="style20" colspan="2" style="background-color: #FFFFFF">
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
                                                    Text='<%# Bind("UserLimitsDr") %>' ReadOnly="True" />
                                            </td>
                                            <td align="right">
                                                <asp:TextBox ID="UserLimitCrTextBox" runat="server" 
                                                    Text='<%# Bind("UserLimitCr") %>' ReadOnly="True" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td class="style20" colspan="2" style="background-color: #FFFFFF">
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
                                                    Text='<%# Bind("UserSupLimitDr") %>' ReadOnly="True" />
                                            </td>
                                            <td>
                                                <asp:TextBox ID="UserSupLimitCrTextBox" runat="server" 
                                                    Text='<%# Bind("UserSupLimitCr") %>' ReadOnly="True" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="style24" style="background-color: #FFFFFF">
                                    IBA Debit Limit</td>
                                <td class="style19" style="background-color: #FFFFFF">
                                    IBA Credit Limit</td>
                                <td class="style29" style="background-color: #FFFFFF">
                                    IBA Supersion Debit</td>
                                <td class="style19" style="background-color: #FFFFFF">
                                    IBA Supervsion Credit</td>
                            </tr>
                            <tr>
                                <td class="style30" style="background-color: #FFFFFF">
                                    <asp:TextBox ID="IBATranLimitDrTextBox" runat="server" 
                                        Text='<%# Bind("IBATranLimitDr") %>' ReadOnly="True" />
                                </td>
                                <td style="background-color: #FFFFFF">
                                    <asp:TextBox ID="IBATranLimitCrTextBox" runat="server" 
                                        Text='<%# Bind("IBATranLimitCr") %>' ReadOnly="True" />
                                </td>
                                <td class="style27" style="background-color: #FFFFFF">
                                    <asp:TextBox ID="IBATranSupLimitDrTextBox" runat="server" 
                                        Text='<%# Bind("IBATranSupLimitDr") %>' ReadOnly="True" />
                                </td>
                                <td style="background-color: #FFFFFF">
                                    <asp:TextBox ID="IBATranSupLimitCrTextBox" runat="server" 
                                        Text='<%# Bind("IBATranSupLimitCr") %>' ReadOnly="True" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style30" style="background-color: #FFFFFF">
                                    ODLimit</td>
                                <td style="background-color: #FFFFFF">
                                    <asp:TextBox ID="ODLimitTextBox" runat="server" Text='<%# Bind("ODLimit") %>' 
                                        ReadOnly="True" />
                                </td>
                                <td class="style27" style="background-color: #FFFFFF">
                                    &nbsp;</td>
                                <td style="background-color: #FFFFFF">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style25" colspan="4" 
                                    style="background-color: #FFFFFF;">
                                    Remarks</td>
                            </tr>
                            <tr>
                                <td class="style25" colspan="4" style="background-color: #FFFFFF">
                                    <asp:TextBox ID="RemarksTextBox" runat="server" Height="42px" 
                                        Text='<%# Bind("Remarks") %>' TextMode="Password" Width="601px" 
                                        ReadOnly="True" />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="style1" colspan="4" 
                                    
                                    style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #CCCCCC; ">
                                    IT Opps Remarks
                                </td>
                            </tr>
                            <tr>
                                <td class="style26" colspan="4">
                                    <asp:TextBox ID="txtITOppsRemarks" runat="server" Height="38px" 
                                        Text='<%# Bind("RemarksFromITOps") %>' TextMode="MultiLine" Width="593px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="txtITOppsRemarks" 
                                        ErrorMessage="Remarks are required from IT Operations" 
                                        ValidationGroup="Supervised">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender" 
                                        runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                                    </asp:ValidatorCalloutExtender>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td class="style30">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                                <td align="right" class="style27">
                                    <asp:LinkButton ID="cmdDecline" runat="server" Font-Bold="False" 
                                        onclick="LinkButton1_Click" ValidationGroup="Supervised">Decline</asp:LinkButton>
                                </td>
                                <td align="right">
                                    &nbsp;&nbsp;<asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                        CommandName="Update" Text="Task Completed" ValidationGroup="Supervised" 
                                        Font-Bold="False" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                        CausesValidation="False" CommandName="Cancel" Text="Cancel" 
                                        Visible="False" Font-Bold="False" />
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
                        <asp:TextBox ID="txtUserID" runat="server" Text='<%# Bind("OppsITUser") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        &nbsp;&nbsp;
                        <div style="color: #0099FF">
                            &nbsp;
                            <asp:Label ID="Label6" runat="server" 
                                Text="Application is not selected from the list" Width="543px"></asp:Label>
                        </div>
                        &nbsp;<div>
                            &nbsp;<asp:Label ID="Label5" runat="server" 
                                Text="Please select name of applicant from Application pending list for Supervise or Decline......." 
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
                        <asp:TextBox ID="UserRequestTypeTextBox0" runat="server" 
                            Text='<%# Bind("UserRequestType") %>' />
                        <br />
                        LocationDes:
                        <asp:TextBox ID="LocationDesTextBox0" runat="server" 
                            Text='<%# Bind("LocationDes") %>' />
                        <br />
                        DivisionDesc:
                        <asp:TextBox ID="DivisionDescTextBox0" runat="server" 
                            Text='<%# Bind("DivisionDesc") %>' />
                        <br />
                        LevelDesc:
                        <asp:TextBox ID="LevelDescTextBox0" runat="server" 
                            Text='<%# Bind("LevelDesc") %>' />
                        <br />
                        SystemRole:
                        <asp:TextBox ID="SystemRoleTextBox0" runat="server" 
                            Text='<%# Bind("SystemRole") %>' />
                        <br />
                        TranCode:
                        <asp:TextBox ID="TranCodeTextBox0" runat="server" 
                            Text='<%# Bind("TranCode") %>' />
                        <br />
                        ProjectDes:
                        <asp:TextBox ID="ProjectDesTextBox0" runat="server" 
                            Text='<%# Bind("ProjectDes") %>' />
                        <br />
                        UserRequestTypeID:
                        <asp:TextBox ID="UserRequestTypeIDTextBox0" runat="server" 
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
                        <asp:TextBox ID="SystemRoleIDTextBox0" runat="server" 
                            Text='<%# Bind("SystemRoleID") %>' />
                        <br />
                        UserName:
                        <asp:TextBox ID="UserNameTextBox0" runat="server" 
                            Text='<%# Bind("UserName") %>' />
                        <br />
                        EmpID:
                        <asp:TextBox ID="EmpIDTextBox0" runat="server" Text='<%# Bind("EmpID") %>' />
                        <br />
                        UserLimitsDr:
                        <asp:TextBox ID="UserLimitsDrTextBox0" runat="server" 
                            Text='<%# Bind("UserLimitsDr") %>' />
                        <br />
                        Email:
                        <asp:TextBox ID="EmailTextBox0" runat="server" Text='<%# Bind("Email") %>' />
                        <br />
                        UserLimitCr:
                        <asp:TextBox ID="UserLimitCrTextBox0" runat="server" 
                            Text='<%# Bind("UserLimitCr") %>' />
                        <br />
                        UserSupLimitDr:
                        <asp:TextBox ID="UserSupLimitDrTextBox0" runat="server" 
                            Text='<%# Bind("UserSupLimitDr") %>' />
                        <br />
                        UserSupLimitCr:
                        <asp:TextBox ID="UserSupLimitCrTextBox0" runat="server" 
                            Text='<%# Bind("UserSupLimitCr") %>' />
                        <br />
                        ODLimit:
                        <asp:TextBox ID="ODLimitTextBox0" runat="server" 
                            Text='<%# Bind("ODLimit") %>' />
                        <br />
                        IBATranLimitDr:
                        <asp:TextBox ID="IBATranLimitDrTextBox0" runat="server" 
                            Text='<%# Bind("IBATranLimitDr") %>' />
                        <br />
                        IBATranLimitCr:
                        <asp:TextBox ID="IBATranLimitCrTextBox0" runat="server" 
                            Text='<%# Bind("IBATranLimitCr") %>' />
                        <br />
                        IBATranSupLimitDr:
                        <asp:TextBox ID="IBATranSupLimitDrTextBox0" runat="server" 
                            Text='<%# Bind("IBATranSupLimitDr") %>' />
                        <br />
                        IBATranSupLimitCr:
                        <asp:TextBox ID="IBATranSupLimitCrTextBox0" runat="server" 
                            Text='<%# Bind("IBATranSupLimitCr") %>' />
                        <br />
                        Remarks:
                        <asp:TextBox ID="RemarksTextBox0" runat="server" 
                            Text='<%# Bind("Remarks") %>' />
                        <br />
                        AppLevel:
                        <asp:TextBox ID="AppLevelTextBox0" runat="server" 
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
                    SelectCommand="SELECT AppID, UserRequestType, LocationDes, DivisionDesc, LevelDesc, SystemRole, TranCode, ProjectDes, UserRequestTypeID, LocationID, DivisionID, ProjectID, SystemRoleID, UserName, EmpID, UserLimitsDr, Email, UserLimitCr, UserSupLimitDr, UserSupLimitCr, ODLimit, IBATranLimitDr, IBATranLimitCr, IBATranSupLimitDr, IBATranSupLimitCr, Remarks, AppLevel, UserID, IsSupervised, IsDecline, IsClosed,UserExistingID, @RemarksFromITOps AS RemarksFromITOps, @OppsITUser AS OppsITUser FROM vApplication WHERE (AppID = @AppID)" 
                    
                    
                    
                    
                    UpdateCommand="UPDATE vApplication SET IsClosed = 1, AppLevel = 99, OppsITUser = @OppsITUser, RemarksFromITOps = @RemarksFromITOps WHERE (AppID = @AppID)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue=" " Name="RemarksFromITOps" />
                        <asp:SessionParameter DefaultValue="" Name="OppsITUser" SessionField="UserID" />
                        <asp:ControlParameter ControlID="ListBox1" DefaultValue="" Name="AppID" 
                            PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="OppsITUser" />
                        <asp:Parameter Name="RemarksFromITOps" />
                        <asp:Parameter Name="AppID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        
    </table>
</asp:Content>
