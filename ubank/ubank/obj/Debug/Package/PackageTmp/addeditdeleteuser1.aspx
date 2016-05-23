<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="addeditdeleteuser1.aspx.cs" Inherits="ubank.addusers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style15
        {
        }
        .style19
        {
            height: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div align="center">
                <table style="width: 90%;">
                    <tr>
                        <td class="style7">
                            &nbsp;</td>
                        <td colspan="3" align="left">
                            <asp:label id="lblmsg" runat="server" 
                                Width="600px">To edit any user type user id  and press "Load button"</asp:label>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            <asp:label id="lblUserID" runat="server" ForeColor="Purple" 
                                BackColor="Transparent" style="right: 586px;" Width="50px">User ID</asp:label>
                        </td>
                        <td class="style4" colspan="2" align="left">
                            <asp:textbox id="txtUserID" runat="server" ForeColor="Purple" Font-Bold="True" 
                                BorderStyle="Solid" 
                                style="POSITION: relative; top: -1px; left: 2px; height: 21px; width: 166px;"></asp:textbox>
            <asp:Button ID="cmdLoadList" runat="server" TabIndex="1" Text="::" Width="33px" 
                                style="margin-left: 9px" onclick="cmdLoadList_Click" 
                                ValidationGroup="UserAdd" />
                            <asp:button id="cmdLoad" runat="server" Width="43px" Text="Load" tabIndex="1" 
                                ValidationGroup="UserAdd"></asp:button>
                        </td>
                        <td class="style5">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style7">
                            <asp:label id="lblUserName" runat="server" ForeColor="Purple" Height="24px" 
                                Width="72px" BackColor="Transparent">User Name</asp:label>
			            </td>
                        <td class="style4" align="left">
                            <asp:textbox id="txtUserName" runat="server" ForeColor="Purple" 
                                Font-Bold="True" Width="168px" BorderStyle="Solid" tabIndex="2"></asp:textbox>
                        </td>
                        <td class="style3" align="left">
                            <asp:label id="Label1" runat="server" ForeColor="Purple" Height="24px" 
                                Width="56px" BackColor="Transparent">Password</asp:label>
                        </td>
                        <td class="style5" align="left">
                            <asp:textbox id="txtPassword" runat="server" ForeColor="Purple" 
                                Font-Bold="True" Width="168px" TextMode="Password" BorderStyle="Solid" 
                                tabIndex="3"></asp:textbox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
			<asp:label id="Label2" runat="server" BackColor="Transparent" Width="127px" Height="24px" 
                                ForeColor="Purple">Email Address (Org)</asp:label>
			            </td>
                        <td class="style4" align="left">
			<asp:textbox id="txtOrgEmail" runat="server" Width="168px" Font-Bold="True" ForeColor="Purple" 
                                BorderStyle="Solid" tabIndex="4" MaxLength="50"></asp:textbox>
			            </td>
                        <td class="style3" align="left">
			<asp:label id="Label6" runat="server" BackColor="Transparent" Width="118px" Height="24px" 
                                ForeColor="Purple">Mgr Email Address</asp:label>
			            </td>
                        <td class="style5" align="left">
			<asp:textbox id="txtMgrEmailaddress" runat="server" Width="168px" Font-Bold="True" 
                                ForeColor="Purple" BorderStyle="Solid" tabIndex="5" MaxLength="260"></asp:textbox>
			            </td>
                    </tr>
                    <tr>
                        <td class="style7">
			<asp:label id="Label4" runat="server" BackColor="Transparent" Width="127px" Height="24px" 
                                ForeColor="Purple">Other Email Address</asp:label>
			            </td>
                        <td class="style4" align="left">
			<asp:textbox id="txtOtherEmialAddress" runat="server" Width="168px" Font-Bold="True" 
                                ForeColor="Purple" BorderStyle="Solid" tabIndex="6" MaxLength="260"></asp:textbox>
			            </td>
                        <td class="style3" align="left">
			<asp:label id="Label7" runat="server" BackColor="Transparent" Width="88px" Height="24px" 
                                ForeColor="Purple">Send CC To</asp:label>
			            </td>
                        <td class="style5" align="left">
			<asp:textbox id="txtEmailCC" runat="server" Width="168px" Font-Bold="True" ForeColor="Purple" 
                                BorderStyle="Solid" ToolTip="CC Email Address" tabIndex="7" MaxLength="260"></asp:textbox>
			            </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            <asp:label id="Label5" runat="server" Height="24px" Width="42px" 
                                BackColor="Transparent" ForeColor="Purple">Office</asp:label>
                        </td>
                        <td class="style4" align="left">
                            <asp:dropdownlist id="cmbOffice" runat="server" Height="24px" Width="173px" 
                                Font-Bold="True" ForeColor="Purple" DataMember="RefLocation" 
                                DataValueField="LocationID" tabIndex="8"></asp:dropdownlist>
                        </td>
                        <td class="style3" align="left">
			<asp:label id="Label8" runat="server" BackColor="Transparent" Width="67px" Height="24px" 
                                ForeColor="Purple">Contact #</asp:label>
			            </td>
                        <td class="style5" align="left">
			<asp:textbox id="txtPhoneNo" tabIndex="9" runat="server" BackColor="White" Width="168px" 
                                Font-Bold="True" ForeColor="Purple" BorderStyle="Solid" 
                                BorderColor="DarkViolet" MaxLength="50"></asp:textbox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
			<asp:label id="Label9" runat="server" BackColor="Transparent" Width="92px" Height="24px" 
                                ForeColor="Purple">User Category</asp:label>
			            </td>
                        <td class="style4" align="left">
                            <asp:dropdownlist id="cmbUserCategory" runat="server" Height="24px" 
                                Width="173px" Font-Bold="True" ForeColor="Purple" DataMember="RefLocation" 
                                DataValueField="LocationID" tabIndex="8"></asp:dropdownlist>
                        </td>
                        <td class="style3" align="left">
                            &nbsp;</td>
                        <td class="style5" align="left">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style7">
                            <asp:label id="Label3" runat="server" ForeColor="Purple" Height="24px" 
                                Width="72px" BackColor="Transparent">Description</asp:label>
                        </td>
                        <td class="style2" colspan="3">
                            <asp:textbox id="txtDescription" runat="server" ForeColor="Purple" 
                                Font-Bold="True" Height="27px" Width="509px" TextMode="MultiLine" 
                                BorderStyle="Solid" tabIndex="10"></asp:textbox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            <asp:checkbox id="chkAdmin" runat="server" Width="64px" Text="Admin" 
                                Font-Size="X-Small" tabIndex="11" style="height: 14px;"></asp:checkbox>
                        </td>
                        <td class="style4">
                            <asp:checkbox id="chkAccountDisabled" runat="server" Height="24px" 
                                Width="144px" Text="Account Disabled" Font-Size="X-Small" tabIndex="12"></asp:checkbox>
			            </td>
                        <td class="style3">
			<asp:CheckBox id="chkSendEmail" runat="server" Width="170px" Font-Size="X-Small" 
                                Text="Always Send Email to Manager" tabIndex="13" Height="16px"></asp:CheckBox>
			            </td>
                        <td class="style5">
			<asp:CheckBox id="chkUserOfActionRegister" runat="server" Width="181px" Font-Size="X-Small" 
                                Text="Action Register User" tabIndex="16"></asp:CheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="style7">
                            <asp:checkbox id="chkUserBlocked" runat="server" Height="20px" Width="78px" 
                                Text="UserBlocked" Font-Size="X-Small" tabIndex="14" 
                                style="margin-left: 3px; margin-right: 0px"></asp:checkbox>
                        </td>
                        <td class="style19">
                            <asp:checkbox id="chkPasswordExpire" runat="server" Height="8px" Width="132px" 
                                Text="Password Expire" Checked="True" Font-Size="X-Small" tabIndex="15"></asp:checkbox>
                        </td>
                        <td class="style3">
                            </td>
                        <td class="style19">
                            </td>
                    </tr>
                    <tr>
                        <td class="style15" align="right" colspan="4">
                            <asp:button id="cmdAdd" runat="server" Width="64px" Text="Add" tabIndex="17" 
                                onclick="cmdAdd_Click" ValidationGroup="UserAdd"></asp:button>
                            <asp:button id="cmdEdit" runat="server" Width="59px" Text="Edit" 
                                Enabled="False" tabIndex="18" onclick="cmdEdit_Click" 
                                ValidationGroup="UserAdd"></asp:button>
			<asp:Button id="cmdCancel" runat="server" Width="80px" Height="24px" Text="Cancel" 
                                Enabled="False" tabIndex="19" onclick="cmdCancel_Click" 
                                ValidationGroup="UserAdd"></asp:Button>
                            <asp:button id="cmdSave" 
                                runat="server" Width="75px" Text="Save" Enabled="False" tabIndex="20" 
                                onclick="cmdSave_Click" ValidationGroup="UserAdd"></asp:button>
                        </td>
                    </tr>
                    </table>
            </div>
          
            <p>
            <asp:TextBox ID="CheckAddEdit" runat="server" Visible="False" Width="107px" 
                    Height="22px"></asp:TextBox>
			<asp:TextBox id="txtEditPassword" runat="server" Width="96px" Height="24px" 
                    Visible="False"></asp:TextBox>
            </p>
</asp:Content>
