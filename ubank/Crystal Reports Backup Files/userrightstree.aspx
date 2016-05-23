<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="userrightstree.aspx.cs" Inherits="ubank.userrightstree" %>
<%@ Register namespace="AjaxControlToolkit" tagprefix="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style13
        {
            width: 41px;
            height: 314px;
        }
        .style14
        {
            height: 314px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table __designer:mapid="1">
        <tr __designer:mapid="2">
            <td __designer:mapid="3" rowspan="2" 
                style="vertical-align: top; width: 204px; text-align: left">
                <asp:ListBox ID="ListBox1" runat="server" AccessKey="l" BackColor="Black" 
                    ForeColor="Yellow" Height="460px" ToolTip="Alt + l" Width="225px">
                </asp:ListBox>
            </td>
            <td __designer:mapid="6" style="width: 41px">
                <asp:Button ID="cmdSelectUser" runat="server" AccessKey="r" Height="40px" 
                    OnClick="cmdSelectUser_Click" TabIndex="1" Text="&gt;&gt;" ToolTip="Alt + &gt;" 
                    ValidationGroup="ChangeRights" Width="38px" />
            </td>
            <td __designer:mapid="8" style="height: 23px; width: 512px; overflow: auto;">
                <table id="Table3" __designer:mapid="9" border="1" cellpadding="1" 
                    cellspacing="1" height="75" style="width: 483px">
                    <tr __designer:mapid="a">
                        <td __designer:mapid="b" style="height: 6px">
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" ForeColor="Navy">User Name</asp:Label>
                        </td>
                        <td __designer:mapid="d" style="width: 187px; height: 6px;">
                            <asp:Label ID="lblUserName" runat="server" Font-Bold="True" ForeColor="#004000" 
                                Width="195px">Selected User Name</asp:Label>
                        </td>
                        <td __designer:mapid="f" style="height: 6px; width: 166px;">
                            <asp:Button ID="cmdCancel" runat="server" AccessKey="c" 
                                OnClick="cmdCancel_Click" TabIndex="6" Text="Cancel" ToolTip="Alt + C" 
                                ValidationGroup="ChangeRights" />
                        </td>
                    </tr>
                    <tr __designer:mapid="11">
                        <td __designer:mapid="12" style="height: 14px">
                            <asp:Label ID="Label6" runat="server" Font-Bold="True" ForeColor="Navy" 
                                Height="18px" Width="59px">User ID</asp:Label>
                        </td>
                        <td __designer:mapid="14" style="width: 187px; height: 14px">
                            <asp:Label ID="lblUserID" runat="server" Font-Bold="True" ForeColor="#004000" 
                                Height="18px" Width="230px">Selected User ID</asp:Label>
                        </td>
                        <td __designer:mapid="16" style="height: 14px; width: 166px;">
                            <asp:Button ID="cmdUpdateAll" runat="server" AccessKey="u" 
                                OnClick="cmdUpdateAll_Click" TabIndex="5" Text="Update All" ToolTip="Alt + U" 
                                ValidationGroup="ChangeRights" Width="144px" />
                        </td>
                    </tr>
                    <tr __designer:mapid="18">
                        <td __designer:mapid="19" style="height: 13px">
                            <asp:Button ID="cmdExpandTree" runat="server" AccessKey="e" 
                                OnClick="cmdExpandTree_Click" TabIndex="2" Text="Expand Tree" ToolTip="Alt + E" 
                                ValidationGroup="ChangeRights" />
                        </td>
                        <td __designer:mapid="1b" style="width: 187px; height: 13px">
                            &nbsp;<asp:Button ID="cmdcollapseTree" runat="server" AccessKey="o" 
                                OnClick="cmdcollapseTree_Click" TabIndex="3" Text="Collapse Tree" 
                                ToolTip="Alt + O" ValidationGroup="ChangeRights" />
                        </td>
                        <td __designer:mapid="1d" style="height: 13px; width: 166px;">
                        </td>
                    </tr>
                </table>
                <asp:Label ID="lblMessage" runat="server" Font-Bold="True" ForeColor="Purple" 
                    Height="21px" Width="511px"></asp:Label>
            </td>
        </tr>
        <tr __designer:mapid="1f">
            <td __designer:mapid="20" class="style13">
            </td>
            <td __designer:mapid="21" align="left" class="style14" valign="top">
                <asp:TreeView ID="TreeView1" runat="server" AccessKey="t" ExpandDepth="0" 
                    ExpandImageToolTip="" ImageSet="Arrows" LineImagesFolder="~/TreeLineImages" 
                    NodeIndent="50" NodeWrap="True" ShowCheckBoxes="Leaf" ShowLines="True" 
                    TabIndex="4" ToolTip="Alt + T" Width="504px">
                    <ParentNodeStyle Font-Bold="True" ForeColor="#004000" />
                    <SelectedNodeStyle Font-Bold="False" Font-Overline="False" />
                    <HoverNodeStyle BorderColor="Lime" />
                    <NodeStyle BorderStyle="None" />
                </asp:TreeView>
            </td>
        </tr>
        <tr __designer:mapid="2d">
            <td __designer:mapid="2e" style="width: 204px; height: 21px">
            </td>
            <td __designer:mapid="2f" style="width: 41px; height: 21px">
            </td>
            <td __designer:mapid="30" style="overflow: auto; width: 512px; height: 23px">
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
