<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="refroledef.aspx.cs" Inherits="ubank.refroledef" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            height: 21px;
        }
        .auto-style2
        {
            height: 21px;
            width: 240px;
        }
        .auto-style3
        {
            width: 240px;
        }
        .auto-style4
        {
            height: 24px;
        }
        .auto-style5
        {
            height: 26px;
        }
        .auto-style7
        {
            height: 24px;
            width: 283px;
        }
        .auto-style8
        {
            width: 283px;
        }
        .auto-style9
        {
        }
        .auto-style10
        {
            height: 24px;
            width: 182px;
        }
        .auto-style11
        {
            width: 132px;
        }
        .auto-style12
        {
            height: 26px;
            width: 132px;
        }
        .auto-style13
        {
            width: 283px;
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td align="left" class="auto-style2" valign="top"></td>
            <td class="auto-style1"></td>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <td align="left" class="auto-style3" valign="top">
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SystemRole" DataValueField="SystemRoleID" Height="371px" Width="237px"></asp:ListBox>
                <asp:ListSearchExtender ID="ListBox1_ListSearchExtender" runat="server" Enabled="True" TargetControlID="ListBox1">
                </asp:ListSearchExtender>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT * FROM [RefSystemRole] WHERE ([SystemRoleID] &gt; @SystemRoleID) ORDER BY [SystemRole]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="SystemRoleID" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="left" valign="top">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="SystemRoleID" DataSourceID="SqlDataSource2" Height="357px" Width="657px" OnItemInserted ="InsertedRec" OnItemDeleted ="DeleteRec">
                    <EditItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td colspan="2" style="font-size: x-large; font-weight: bold; color: #808080; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0;">System Role Modification</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style11">SystemRoleID</td>
                                <td>
                                    <asp:Label ID="SystemRoleIDLabel1" runat="server" Text='<%# Eval("SystemRoleID") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style11">DivisionID</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource1Div" DataTextField="DivisionDesc" DataValueField="DivisionID" SelectedValue='<%# Bind("DivisionID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1Div" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [DivisionID], [DivisionDesc] FROM [RefDivision]"></asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style11">ProjectID</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1pro" DataTextField="ProjectDes" DataValueField="ProjectID" SelectedValue='<%# Bind("ProjectID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1pro" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ProjectID], [ProjectDes] FROM [RefProjects]"></asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style11">SystemRole</td>
                                <td>
                                    <asp:TextBox ID="SystemRoleTextBox" runat="server" Text='<%# Bind("SystemRole") %>' Width="306px" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="SystemRoleTextBox" ErrorMessage="System Role Name is Required" ValidationGroup="Update">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style11">IsSystemRoleActive</td>
                                <td>
                                    <asp:CheckBox ID="IsSystemRoleActiveCheckBox" runat="server" Checked='<%# Bind("IsSystemRoleActive") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style11">TranCode</td>
                                <td>
                                    <asp:TextBox ID="TranCodeTextBox" runat="server" Text='<%# Bind("TranCode") %>' Width="306px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style12">MaxNoOfSupRequired</td>
                                <td class="auto-style5">
                                    <asp:TextBox ID="MaxNoOfSupRequiredTextBox" runat="server" Text='<%# Bind("MaxNoOfSupRequired") %>' />
                                </td>
                                <td class="auto-style5"></td>
                            </tr>
                            <tr>
                                <td class="auto-style11">&nbsp;</td>
                                <td align="right" valign="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table style="width: 100%; height: 276px;">
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center">Select Role from the list
                                    <br />
                                    Or<br /> Click on
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" ValidationGroup="FormView" />
                                    &nbsp;to create new System Role</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style9" colspan="2" style="font-size: x-large; font-weight: bold; color: #808080; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0;">System Role Definition</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9">DivisionID</td>
                                <td class="auto-style8">
                                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource1Div" DataTextField="DivisionDesc" DataValueField="DivisionID" SelectedValue='<%# Bind("DivisionID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1Div" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [DivisionID], [DivisionDesc] FROM [RefDivision] WHERE ([IsDivisionActive] = @IsDivisionActive)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="True" Name="IsDivisionActive" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9">ProjectID</td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="ProjectIDTextBox" runat="server" Text='<%# Bind("ProjectID") %>' />
                                    <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource1Pro" DataTextField="ProjectDes" DataValueField="ProjectID" SelectedValue='<%# Bind("ProjectID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1Pro" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ProjectID], [ProjectDes] FROM [RefProjects] WHERE ([ProjectActive] = @ProjectActive)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="true" Name="ProjectActive" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style9">SystemRole</td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="SystemRoleTextBox" runat="server" Text='<%# Bind("SystemRole") %>' Width="145px" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="System Role is Required" ControlToValidate="SystemRoleTextBox">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="RequiredFieldValidator4_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style10">Is System Role Active?</td>
                                <td class="auto-style7">
                                    <asp:CheckBox ID="IsSystemRoleActiveCheckBox" runat="server" Checked='<%# Bind("IsSystemRoleActive") %>' />
                                </td>
                                <td class="auto-style4"></td>
                            </tr>
                            <tr>
                                <td class="auto-style9">TranCode</td>
                                <td class="auto-style8">
                                    <asp:TextBox ID="TranCodeTextBox" runat="server" Text='<%# Bind("TranCode") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style5">MaxNoOfSupRequired</td>
                                <td class="auto-style13">
                                    <asp:TextBox ID="MaxNoOfSupRequiredTextBox" runat="server" Text='<%# Bind("MaxNoOfSupRequired") %>' />
                                </td>
                                <td class="auto-style5"></td>
                            </tr>
                            <tr>
                                <td class="auto-style9">&nbsp;</td>
                                <td align="right" class="auto-style8" valign="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="InsertRec" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table style="width:93%;">
                            <tr>
                                <td colspan="3" style="font-size: x-large; font-weight: bold; color: #808080; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0;">System Role Definition/Modification</td>
                            </tr>
                            <tr>
                                <td>SystemRoleID</td>
                                <td>
                                    <asp:Label ID="SystemRoleIDLabel" runat="server" Text='<%# Eval("SystemRoleID") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>DivisionID</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceDiv" DataTextField="DivisionDesc" DataValueField="DivisionID" SelectedValue='<%# Bind("DivisionID") %>' Width="146px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceDiv" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [DivisionID], [DivisionDesc] FROM [RefDivision]"></asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">ProjectID</td>
                                <td class="auto-style1">
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceProject" DataTextField="ProjectDes" DataValueField="ProjectID" SelectedValue='<%# Bind("ProjectID") %>' Width="145px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSourceProject" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ProjectID], [ProjectDes] FROM [RefProjects]"></asp:SqlDataSource>
                                </td>
                                <td class="auto-style1"></td>
                            </tr>
                            <tr>
                                <td class="auto-style1">SystemRole</td>
                                <td class="auto-style1">
                                    <asp:Label ID="SystemRoleLabel" runat="server" Text='<%# Bind("SystemRole") %>' />
                                </td>
                                <td class="auto-style1"></td>
                            </tr>
                            <tr>
                                <td class="auto-style4">IsSystemRoleActive</td>
                                <td class="auto-style4">
                                    <asp:CheckBox ID="IsSystemRoleActiveCheckBox" runat="server" Checked='<%# Bind("IsSystemRoleActive") %>' Enabled="false" />
                                </td>
                                <td class="auto-style4"></td>
                            </tr>
                            <tr>
                                <td>TranCode</td>
                                <td>
                                    <asp:Label ID="TranCodeLabel" runat="server" Text='<%# Bind("TranCode") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>MaxNoOfSupRequired</td>
                                <td>
                                    <asp:Label ID="MaxNoOfSupRequiredLabel" runat="server" Text='<%# Bind("MaxNoOfSupRequired") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">&nbsp;</td>
                                <td align="right" style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" ValidationGroup="FormView" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" ValidationGroup="FormView"  OnClientClick="return confirm('Are you certain you want to Delete selected role?');"  />
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" ValidationGroup="FormView" />
                                </td>
                                <td style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">&nbsp;</td>
                            </tr>
                        </table>
                        <br />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" DeleteCommand="DELETE FROM [RefSystemRole] WHERE [SystemRoleID] = @SystemRoleID" InsertCommand="INSERT INTO [RefSystemRole] ([DivisionID], [ProjectID], [SystemRole], [IsSystemRoleActive], [TranCode], [MaxNoOfSupRequired]) VALUES (@DivisionID, @ProjectID, @SystemRole, @IsSystemRoleActive, @TranCode, @MaxNoOfSupRequired)" SelectCommand="SELECT * FROM [RefSystemRole] WHERE ([SystemRoleID] = @SystemRoleID)" UpdateCommand="UPDATE [RefSystemRole] SET [DivisionID] = @DivisionID, [ProjectID] = @ProjectID, [SystemRole] = @SystemRole, [IsSystemRoleActive] = @IsSystemRoleActive, [TranCode] = @TranCode, [MaxNoOfSupRequired] = @MaxNoOfSupRequired WHERE [SystemRoleID] = @SystemRoleID">
                    <DeleteParameters>
                        <asp:Parameter Name="SystemRoleID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DivisionID" Type="Decimal" />
                        <asp:Parameter Name="ProjectID" Type="Decimal" />
                        <asp:Parameter Name="SystemRole" Type="String" />
                        <asp:Parameter Name="IsSystemRoleActive" Type="Boolean" />
                        <asp:Parameter Name="TranCode" Type="String" />
                        <asp:Parameter Name="MaxNoOfSupRequired" Type="Decimal" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="SystemRoleID" PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DivisionID" Type="Decimal" />
                        <asp:Parameter Name="ProjectID" Type="Decimal" />
                        <asp:Parameter Name="SystemRole" Type="String" />
                        <asp:Parameter Name="IsSystemRoleActive" Type="Boolean" />
                        <asp:Parameter Name="TranCode" Type="String" />
                        <asp:Parameter Name="MaxNoOfSupRequired" Type="Decimal" />
                        <asp:Parameter Name="SystemRoleID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td align="left" class="auto-style3" valign="top">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
