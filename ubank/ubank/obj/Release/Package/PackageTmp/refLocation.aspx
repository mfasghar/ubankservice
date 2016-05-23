<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="refLocation.aspx.cs" Inherits="ubank.refLocation" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 244px;
        }
        .auto-style2
        {
            width: 167px;
        }
        .auto-style3
        {
            height: 26px;
        }
        .auto-style4
        {
            height: 21px;
        }
        .auto-style5
        {
            width: 431px;
        }
        .auto-style6
        {
            width: 589px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
        <tr>
            <td align="left" class="auto-style1" valign="top">
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="LocationDes" DataValueField="LocationID" Height="384px" Width="243px"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LocationID], [LocationDes] FROM [RefLocation] WHERE ([LocationID] &gt; @LocationID) ORDER BY [LocationDes]">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="LocationID" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="left" valign="top" class="auto-style6">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="LocationID" DataSourceID="SqlDataSource2" Height="315px" Width="16px">
                    <EditItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td colspan="4" style="font-size: x-large; font-weight: bold; color: #808080; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0;">Location Definition/Modification</td>
                            </tr>
                            <tr>
                                <td>LocationID</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LocationIDLabel1" runat="server" Text='<%# Eval("LocationID") %>' />
                                </td>
                                <td>LocationDes</td>
                                <td>
                                    <asp:TextBox ID="LocationDesTextBox" runat="server" Text='<%# Bind("LocationDes") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Location Name is Required" ValidationGroup="Required">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>Branch Sequence</td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="BrSequenceTextBox" runat="server" Text='<%# Bind("BrSequence") %>' />
                                </td>
                                <td>BlockLocation</td>
                                <td>
                                    <asp:CheckBox ID="BlockLocationCheckBox" runat="server" Checked='<%# Bind("BlockLocation") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>PersonAName</td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="PersonANameTextBox" runat="server" Text='<%# Bind("PersonAName") %>' />
                                </td>
                                <td>PersonAEmail</td>
                                <td>
                                    <asp:TextBox ID="PersonAEmailTextBox" runat="server" Text='<%# Bind("PersonAEmail") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>PersonB</td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="PersonBTextBox" runat="server" Text='<%# Bind("PersonB") %>' />
                                </td>
                                <td>PersonBEmail</td>
                                <td>
                                    <asp:TextBox ID="PersonBEmailTextBox" runat="server" Text='<%# Bind("PersonBEmail") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>BranchAppServerIP</td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="BranchAppServerIPTextBox" runat="server" Text='<%# Bind("BranchAppServerIP") %>' />
                                </td>
                                <td>BranchAppServerName</td>
                                <td>
                                    <asp:TextBox ID="BranchAppServerNameTextBox" runat="server" Text='<%# Bind("BranchAppServerName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>BranchDBServerIP</td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="BranchDBServerIPTextBox" runat="server" Text='<%# Bind("BranchDBServerIP") %>' />
                                </td>
                                <td>BranchDBServerName</td>
                                <td>
                                    <asp:TextBox ID="BranchDBServerNameTextBox" runat="server" Text='<%# Bind("BranchDBServerName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>LocCoorName</td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LocCoorName") %>'></asp:TextBox>
                                </td>
                                <td>LocCoorPhoneNo</td>
                                <td>
                                    <asp:TextBox ID="LocCoorPhoneNoTextBox" runat="server" Text='<%# Bind("LocCoorPhoneNo") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>LocPhoneNo</td>
                                <td class="auto-style2">
                                    <asp:TextBox ID="LocPhoneNoTextBox" runat="server" Text='<%# Bind("LocPhoneNo") %>' />
                                </td>
                                <td>LocAddress</td>
                                <td>
                                    <asp:TextBox ID="LocAddressTextBox" runat="server" Text='<%# Bind("LocAddress") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>LocSendEmail</td>
                                <td class="auto-style2">
                                    <asp:CheckBox ID="LocSendEmailCheckBox" runat="server" Checked='<%# Bind("LocSendEmail") %>' />
                                </td>
                                <td>OraTNS</td>
                                <td>
                                    <asp:TextBox ID="OraTNSTextBox" runat="server" Text='<%# Bind("OraTNS") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">&nbsp;</td>
                                <td class="auto-style2" style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">&nbsp;</td>
                                <td style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">&nbsp;</td>
                                <td align="right" style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="Update" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td class="auto-style2">&nbsp;</td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <table style="width: 99%; height: 322px;">
                            <tr>
                                <td class="auto-style5">&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="center" class="auto-style5" valign="middle">Please select Location from the list
                                    <br />
                                    Or<br />Click on
                                    <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" ValidationGroup="FormView" />
                                    &nbsp;to create new location </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">&nbsp;</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td colspan="4" style="font-size: x-large; font-weight: bold; color: #808080; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0;">
                                    Location Definition</td>
                            </tr>
                            <tr>
                                <td>LocationID</td>
                                <td>
                                    <asp:TextBox ID="LocationIDTextBox" runat="server" Text='<%# Bind("LocationID") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="LocationIDTextBox" ErrorMessage="Location ID is required">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="RequiredFieldValidator5_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="RequiredFieldValidator5">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                                <td>LocationDes</td>
                                <td>
                                    <asp:TextBox ID="LocationDesTextBox" runat="server" Text='<%# Bind("LocationDes") %>' />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="LocationDesTextBox" ErrorMessage="Location Name is Required" ValidationGroup="Insert">*</asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender ID="RequiredFieldValidator4_ValidatorCalloutExtender" runat="server" Enabled="True" TargetControlID="RequiredFieldValidator4">
                                    </asp:ValidatorCalloutExtender>
                                </td>
                            </tr>
                            <tr>
                                <td>BrSequence</td>
                                <td>
                                    <asp:TextBox ID="BrSequenceTextBox" runat="server" Text='<%# Bind("BrSequence") %>' />
                                </td>
                                <td>BlockLocation</td>
                                <td>
                                    <asp:CheckBox ID="BlockLocationCheckBox" runat="server" Checked='<%# Bind("BlockLocation") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>PersonA</td>
                                <td>
                                    <asp:TextBox ID="PersonATextBox" runat="server" Text='<%# Bind("PersonA") %>' />
                                </td>
                                <td>PersonAName</td>
                                <td>
                                    <asp:TextBox ID="PersonANameTextBox" runat="server" Text='<%# Bind("PersonAName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>PersonAEmail</td>
                                <td>
                                    <asp:TextBox ID="PersonAEmailTextBox" runat="server" Text='<%# Bind("PersonAEmail") %>' />
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>PersonB</td>
                                <td>
                                    <asp:TextBox ID="PersonBTextBox" runat="server" Text='<%# Bind("PersonB") %>' />
                                </td>
                                <td>PersonBEmail</td>
                                <td>
                                    <asp:TextBox ID="PersonBEmailTextBox" runat="server" Text='<%# Bind("PersonBEmail") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>BranchAppServerIP</td>
                                <td>
                                    <asp:TextBox ID="BranchAppServerIPTextBox" runat="server" Text='<%# Bind("BranchAppServerIP") %>' />
                                </td>
                                <td>BranchAppServerName</td>
                                <td>
                                    <asp:TextBox ID="BranchAppServerNameTextBox" runat="server" Text='<%# Bind("BranchAppServerName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>BranchDBServerIP</td>
                                <td>
                                    <asp:TextBox ID="BranchDBServerIPTextBox" runat="server" Text='<%# Bind("BranchDBServerIP") %>' />
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>BranchDBServerName</td>
                                <td>
                                    <asp:TextBox ID="BranchDBServerNameTextBox" runat="server" Text='<%# Bind("BranchDBServerName") %>' />
                                </td>
                                <td>LocCoorName</td>
                                <td>
                                    <asp:TextBox ID="LocCoorNameTextBox" runat="server" Text='<%# Bind("LocCoorName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>LocCoorPhoneNo</td>
                                <td>
                                    <asp:TextBox ID="LocCoorPhoneNoTextBox" runat="server" Text='<%# Bind("LocCoorPhoneNo") %>' />
                                </td>
                                <td>LocPhoneNo</td>
                                <td>
                                    <asp:TextBox ID="LocPhoneNoTextBox" runat="server" Text='<%# Bind("LocPhoneNo") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>LocAddress</td>
                                <td>
                                    <asp:TextBox ID="LocAddressTextBox" runat="server" Text='<%# Bind("LocAddress") %>' />
                                </td>
                                <td>LocSendEmail</td>
                                <td>
                                    <asp:CheckBox ID="LocSendEmailCheckBox" runat="server" Checked='<%# Bind("LocSendEmail") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">OraTNS</td>
                                <td class="auto-style3">
                                    <asp:TextBox ID="OraTNSTextBox" runat="server" Text='<%# Bind("OraTNS") %>' />
                                </td>
                                <td class="auto-style3"></td>
                                <td class="auto-style3"></td>
                            </tr>
                            <tr>
                                <td style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">&nbsp;</td>
                                <td style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">&nbsp;</td>
                                <td style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">&nbsp;</td>
                                <td align="right" style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        &nbsp;
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td>
                                    <asp:Label ID="LocationIDLabel1" runat="server" Text='<%# Eval("LocationID") %>' />
                                </td>
                                <td class="auto-style2">&nbsp; </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>OraTNS</td>
                                <td class="auto-style2">&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="4" style="font-size: x-large; font-weight: bold; color: #808080; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0;">Location Definition/Modification<br />
                                    <asp:Label ID="LocationDesLabel" runat="server" Text='<%# Bind("LocationDes") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="BrSequenceLabel" runat="server" Text='<%# Bind("BrSequence") %>' />
                                </td>
                                <td class="auto-style2">
                                    <asp:CheckBox ID="BlockLocationCheckBox" runat="server" Checked='<%# Bind("BlockLocation") %>' Enabled="false" />
                                </td>
                                <td>BrSequence&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                <td>BlockLocation</td>
                            </tr>
                            <tr>
                            </tr>
                            <tr>
                                <td>PersonA</td>
                                <td class="auto-style2">
                                    <asp:Label ID="PersonALabel" runat="server" Text='<%# Bind("PersonA") %>' />
                                </td>
                                <td>PersonAName</td>
                                <td>
                                    <asp:Label ID="PersonANameLabel" runat="server" Text='<%# Bind("PersonAName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>PersonAEmail</td>
                                <td class="auto-style2">
                                    <asp:Label ID="PersonAEmailLabel" runat="server" Text='<%# Bind("PersonAEmail") %>' />
                                </td>
                                <td>&nbsp;</td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LocAddressLabel" runat="server" Text='<%# Bind("LocAddress") %>' />
                                </td>
                                <td>LocPhoneNo</td>
                                <td class="auto-style2">LocationID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                                <td>
                                    <asp:Label ID="LocPhoneNoLabel" runat="server" Text='<%# Bind("LocPhoneNo") %>' />
                                </td>
                                <td>LocAddress</td>
                            </tr>
                            <tr>
                                <td>PersonB</td>
                                <td class="auto-style2">
                                    <asp:Label ID="PersonBLabel" runat="server" Text='<%# Bind("PersonB") %>' />
                                </td>
                                <td>PersonBEmail</td>
                                <td>
                                    <asp:Label ID="PersonBEmailLabel" runat="server" Text='<%# Bind("PersonBEmail") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>BranchDBServerIP</td>
                                <td class="auto-style2">
                                    <asp:Label ID="BranchDBServerIPLabel" runat="server" Text='<%# Bind("BranchDBServerIP") %>' />
                                </td>
                                <td>BranchDBServerName</td>
                                <td>
                                    <asp:Label ID="BranchDBServerNameLabel" runat="server" Text='<%# Bind("BranchDBServerName") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>LocCoorName</td>
                                <td class="auto-style2">
                                    <asp:Label ID="LocCoorNameLabel" runat="server" Text='<%# Bind("LocCoorName") %>' />
                                </td>
                                <td>LocCoorPhoneNo</td>
                                <td>
                                    <asp:Label ID="LocCoorPhoneNoLabel" runat="server" Text='<%# Bind("LocCoorPhoneNo") %>' />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="BranchAppServerNameLabel" runat="server" Text='<%# Bind("BranchAppServerName") %>' />
                                </td>
                                <td>
                                    <asp:Label ID="OraTNSLabel" runat="server" Text='<%# Bind("OraTNS") %>' />
                                </td>
                                <td class="auto-style2">BranchAppServerIP</td>
                                <td class="auto-style4">
                                    <asp:Label ID="BranchAppServerIPLabel" runat="server" Text='<%# Bind("BranchAppServerIP") %>' />
                                </td>
                                <td class="auto-style4">BranchAppServerName</td>
                            </tr>
                            <tr>
                                <td style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">LocSendEmail</td>
                                <td class="auto-style2" style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">
                                    <asp:CheckBox ID="LocSendEmailCheckBox" runat="server" Checked='<%# Bind("LocSendEmail") %>' Enabled="false" />
                                </td>
                                <td style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">&nbsp;</td>
                                <td align="right" style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">&nbsp;</td>
                            </tr>
                            <tr>
                                <td style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">&nbsp;</td>
                                <td style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC" valign="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">&nbsp;</td>
                                <td style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">&nbsp;</td>
                                <td align="right" style="border-top-style: solid; border-top-width: thin; border-top-color: #CCCCCC">
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" ValidationGroup="FormView" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" ValidationGroup="FormView"  OnClientClick="return confirm('Are you certain you want to Delete selected Location?');"/>
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" ValidationGroup="FormView" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" DeleteCommand="DELETE FROM [RefLocation] WHERE [LocationID] = @LocationID" InsertCommand="INSERT INTO [RefLocation] ([LocationID], [LocationDes], [BrSequence], [BlockLocation], [PersonA], [PersonB], [PersonAName], [PersonAEmail], [PersonBEmail], [BranchAppServerIP], [BranchAppServerName], [BranchDBServerIP], [BranchDBServerName], [LocCoorName], [LocCoorPhoneNo], [LocPhoneNo], [LocAddress], [LocSendEmail], [OraTNS]) VALUES (@LocationID, @LocationDes, @BrSequence, @BlockLocation, @PersonA, @PersonB, @PersonAName, @PersonAEmail, @PersonBEmail, @BranchAppServerIP, @BranchAppServerName, @BranchDBServerIP, @BranchDBServerName, @LocCoorName, @LocCoorPhoneNo, @LocPhoneNo, @LocAddress, @LocSendEmail, @OraTNS)" SelectCommand="SELECT [LocationID], [LocationDes], [BrSequence], [BlockLocation], [PersonA], [PersonB], [PersonAName], [PersonAEmail], [PersonBEmail], [BranchAppServerIP], [BranchAppServerName], [BranchDBServerIP], [BranchDBServerName], [LocCoorName], [LocCoorPhoneNo], [LocPhoneNo], [LocAddress], [LocSendEmail], [OraTNS] FROM [RefLocation] WHERE ([LocationID] = @LocationID)" UpdateCommand="UPDATE [RefLocation] SET [LocationDes] = @LocationDes, [BrSequence] = @BrSequence, [BlockLocation] = @BlockLocation, [PersonA] = @PersonA, [PersonB] = @PersonB, [PersonAName] = @PersonAName, [PersonAEmail] = @PersonAEmail, [PersonBEmail] = @PersonBEmail, [BranchAppServerIP] = @BranchAppServerIP, [BranchAppServerName] = @BranchAppServerName, [BranchDBServerIP] = @BranchDBServerIP, [BranchDBServerName] = @BranchDBServerName, [LocCoorName] = @LocCoorName, [LocCoorPhoneNo] = @LocCoorPhoneNo, [LocPhoneNo] = @LocPhoneNo, [LocAddress] = @LocAddress, [LocSendEmail] = @LocSendEmail, [OraTNS] = @OraTNS WHERE [LocationID] = @LocationID">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="FormView1" Name="LocationID" PropertyName="SelectedValue" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LocationID" Type="Int32" />
                        <asp:Parameter Name="LocationDes" Type="String" />
                        <asp:Parameter Name="BrSequence" Type="Int32" />
                        <asp:Parameter Name="BlockLocation" Type="Boolean" />
                        <asp:Parameter Name="PersonA" Type="String" />
                        <asp:Parameter Name="PersonB" Type="String" />
                        <asp:Parameter Name="PersonAName" Type="String" />
                        <asp:Parameter Name="PersonAEmail" Type="String" />
                        <asp:Parameter Name="PersonBEmail" Type="String" />
                        <asp:Parameter Name="BranchAppServerIP" Type="String" />
                        <asp:Parameter Name="BranchAppServerName" Type="String" />
                        <asp:Parameter Name="BranchDBServerIP" Type="String" />
                        <asp:Parameter Name="BranchDBServerName" Type="String" />
                        <asp:Parameter Name="LocCoorName" Type="String" />
                        <asp:Parameter Name="LocCoorPhoneNo" Type="String" />
                        <asp:Parameter Name="LocPhoneNo" Type="String" />
                        <asp:Parameter Name="LocAddress" Type="String" />
                        <asp:Parameter Name="LocSendEmail" Type="Boolean" />
                        <asp:Parameter Name="OraTNS" Type="String" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="LocationID" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LocationDes" Type="String" />
                        <asp:Parameter Name="BrSequence" Type="Int32" />
                        <asp:Parameter Name="BlockLocation" Type="Boolean" />
                        <asp:Parameter Name="PersonA" Type="String" />
                        <asp:Parameter Name="PersonB" Type="String" />
                        <asp:Parameter Name="PersonAName" Type="String" />
                        <asp:Parameter Name="PersonAEmail" Type="String" />
                        <asp:Parameter Name="PersonBEmail" Type="String" />
                        <asp:Parameter Name="BranchAppServerIP" Type="String" />
                        <asp:Parameter Name="BranchAppServerName" Type="String" />
                        <asp:Parameter Name="BranchDBServerIP" Type="String" />
                        <asp:Parameter Name="BranchDBServerName" Type="String" />
                        <asp:Parameter Name="LocCoorName" Type="String" />
                        <asp:Parameter Name="LocCoorPhoneNo" Type="String" />
                        <asp:Parameter Name="LocPhoneNo" Type="String" />
                        <asp:Parameter Name="LocAddress" Type="String" />
                        <asp:Parameter Name="LocSendEmail" Type="Boolean" />
                        <asp:Parameter Name="OraTNS" Type="String" />
                        <asp:Parameter Name="LocationID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style6">&nbsp;</td>
        </tr>
    </table>
</asp:Content>
