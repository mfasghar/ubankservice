<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="assignrights.aspx.cs" Inherits="ubank.assignrights" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style16
        {
            height: 11px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<table style="width:100%;">
        <tr>
            <td class="style13">
            </td>
            <td class="style13">
            </td>
            <td class="style13">
            </td>
            <td class="style13">
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:ListBox ID="ListBox1" runat="server" Height="255px" Width="286px">
                </asp:ListBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>--%>
    <TABLE cellSpacing="0" cellPadding="0" width="442" border="0" 
            ms_2d_layout="TRUE" style="margin-right: 0px; height: 423px;">
			<TR vAlign="top">
				<TD width="0" height="15"></TD>
				<TD rowSpan="2">
				
						<TABLE height="425" cellSpacing="0" cellPadding="0" border="0" 
                            ms_2d_layout="TRUE" style="width: 705px">
							<TR vAlign="top">
								<TD rowspan="5">
									<asp:ListBox id="ListBox1" runat="server" Width="210px" Height="346px" 
                                        onselectedindexchanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
                                    <asp:ListSearchExtender ID="ListBox1_ListSearchExtender" runat="server" 
                                        Enabled="True" TargetControlID="ListBox1">
                                    </asp:ListSearchExtender>
                                </TD>
							</TR>
							<TR vAlign="top">
								<TD colSpan="3"></TD>
								<TD>
									<asp:Label id="Label6" runat="server" Height="18px" Width="61px" BackColor="Transparent">User ID</asp:Label></TD>
								<TD colSpan="3">
									<asp:Label id="lblUserID" runat="server" Height="16px" Width="190px" Font-Bold="True" ForeColor="Navy" BackColor="Transparent">Selected User ID</asp:Label></TD>
							</TR>
							<TR vAlign="top">
								<TD colSpan="2">
									&nbsp;
									<asp:Button id="cmdSelectUser" runat="server" Height="120px" Width="35px" 
                                        Text=">>" onclick="cmdSelectUser_Click" ValidationGroup="AddValue"></asp:Button></TD>
								<TD colSpan="3">
									<asp:Label id="Label7" runat="server" BackColor="Transparent">User Name</asp:Label></TD>
								<TD colSpan="2">
									<asp:Label id="lblUserName" runat="server" Font-Bold="True" ForeColor="Navy" 
                                        BackColor="Transparent">Selected User Name</asp:Label></TD>
							</TR>
							<TR vAlign="top">
								<TD colSpan="2">
									&nbsp;</TD>
								<TD colSpan="5">
									<asp:Label id="lblMessage" runat="server" Width="470px" 
                                        Font-Bold="True" ForeColor="Purple" BackColor="Transparent" 
                                        style="margin-top: 0px"></asp:Label></TD>
							</TR>
							<TR vAlign="top">
								<TD class="style16"></TD>
								<TD colSpan="5" class="style16">
									&nbsp;</TD>
								<TD class="style16" align="right" valign="top">
									<asp:Button id="Button1" runat="server" Height="24px" Width="100px" 
                                        Text="Assign Rights" Enabled="False" onclick="Button1_Click" 
                                        ValidationGroup="AddValue"></asp:Button>&nbsp;<asp:Button 
                                        id="cmdCancel" runat="server" Height="24px" Width="100px" Text="Cancel" 
                                        Enabled="False"></asp:Button></TD>
							</TR>
							</TABLE>
				
				</TD>
			</TR>
			
		</TABLE>
</asp:Content>
