<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="userleveldef.aspx.cs" Inherits="ubank.WebForm1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            height: 288px;
        }
        .auto-style2
        {
            height: 288px;
            width: 214px;
        }
        .auto-style3
        {
            width: 214px;
        }
        .auto-style4
        {
            height: 24px;
        }
        .auto-style5
        {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td align="left" class="auto-style2" valign="top">
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="LevelDesc" DataValueField="LevelID" Height="284px" Width="211px"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LevelID], [IsLevelIDActive], [LevelDesc] FROM [RefUserLevel] ORDER BY [LevelDesc]"></asp:SqlDataSource>
            </td>
            <td align="left" class="auto-style1" valign="top">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="LevelID" DataSourceID="SqlDataSource2" Height="107px" style="margin-left: 57px" Width="154px">
                    <EditItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td>LevelID</td>
                                <td>
                                    <asp:Label ID="LevelIDLabel1" runat="server" Text='<%# Eval("LevelID") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>LevelDesc</td>
                                <td>
                                    <asp:TextBox ID="LevelDescTextBox" runat="server" Height="23px" Text='<%# Bind("LevelDesc") %>' Width="235px" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="LevelDescTextBox" ErrorMessage="Please Enter Leave Description" ValidationGroup="Update">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="RequiredFieldValidator3_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="RequiredFieldValidator3">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>IsLevelIDActive</td>
                                <td>
                                    <asp:CheckBox ID="IsLevelIDActiveCheckBox" runat="server" Checked='<%# Bind("IsLevelIDActive") %>' />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="right">
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        No Record is selected from the list<br /> Or
                        <br />
                        Click
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                        &nbsp;to create new Level
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td>LevelID</td>
                                <td>
                                    <asp:TextBox ID="LevelIDTextBox" runat="server" Text='<%# Bind("LevelID") %>' />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Leave ID is required" ValidationGroup="Insert" ControlToValidate="LevelIDTextBox">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="RequiredFieldValidator4_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>LevelDesc</td>
                                <td>
                                    <asp:TextBox ID="LevelDescTextBox0" runat="server" Text='<%# Bind("LevelDesc") %>' />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Level description is required " ValidationGroup="Insert" ControlToValidate="LevelDescTextBox">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="RequiredFieldValidator5_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">IsLevelIDActive</td>
                                <td class="auto-style4">
                                    <asp:CheckBox ID="IsLevelIDActiveCheckBox0" runat="server" Checked='<%# Bind("IsLevelIDActive") %>' />
                                </td>
                                <td class="auto-style4">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style5"></td>
                                <td align="right" class="auto-style5">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td class="auto-style5"></td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        LevelID:
                        <asp:Label ID="LevelIDLabel" runat="server" Text='<%# Eval("LevelID") %>' />
                        <br />
                        LevelDesc:
                        <asp:Label ID="LevelDescLabel" runat="server" Text='<%# Bind("LevelDesc") %>' />
                        <br />
                        IsLevelIDActive:
                        <asp:CheckBox ID="IsLevelIDActiveCheckBox1" runat="server" Checked='<%# Bind("IsLevelIDActive") %>' Enabled="false" />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you certain you want to Delete User Level?');"/>
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" DeleteCommand="DELETE FROM RefUserLevel WHERE (LevelID = @levelid)" SelectCommand="SELECT * FROM [RefUserLevel] WHERE ([LevelID] = @LevelID)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="FormView1" Name="levelid" PropertyName="SelectedValue" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="LevelID" PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
