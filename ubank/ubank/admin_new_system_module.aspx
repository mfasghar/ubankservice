<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_new_system_module.aspx.cs" Inherits="ubank.admin_new_system_module" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 22px;
        }
        .auto-style2 {
            height: 39px;
        }
        .auto-style3 {
            height: 27px;
        }
        .auto-style4 {
            width: 117px;
        }
        .auto-style5 {
            height: 75px;
        }
        .auto-style6 {
            height: 74px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



    <table style="border: .5px solid #808080; width:100%;" border="1" cellpadding="1" cellspacing="2">
        <tr>
            <td colspan="4" align="center">
                <asp:Label ID="Label5" runat="server" Text="Add new SYSTEM Or New MODULE" Font-Size="Small" ForeColor="#3399FF"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="2">
                <asp:Label ID="Label6" runat="server" Text="Add New System" Font-Size="Small"></asp:Label>
            </td>
            <td class="auto-style1" align="left" colspan="2">
                <asp:Label ID="Label8" runat="server" Text="Add Module" Font-Size="Small"></asp:Label>
            </td>
        </tr>
        <tr>
            <td rowspan="2">
                <asp:Label ID="Label11" runat="server" Font-Size="Smaller" Text="Name Of System"></asp:Label>
            </td>
            <td rowspan="2" class="auto-style4">
                <asp:TextBox ID="system" runat="server" BorderStyle="Solid" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="Label9" runat="server" Text="Select System" Font-Size="Smaller"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="ProjectDes" DataValueField="ProjectID" Width="200px" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ProjectID], [ProjectDes] FROM [RefProjects]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label10" runat="server" Text="Add new Module" Font-Size="Smaller"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="module" runat="server" BorderStyle="Solid" Width="392px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                                              <asp:Button ID="add_system" Class="btn btn-primary" runat="server" Height="20px" tabIndex="10" Text="Add System"  ValidationGroup="addtask" Width="100px" BackColor="#0066FF" BorderColor="#333333" BorderStyle="Solid" ForeColor="White" OnClick="add_system_Click"  />
                                                    
                                                   
            </td>
            <td>&nbsp;</td>
            <td align="right">
                                              <asp:Button ID="add_module" Class="btn btn-primary" runat="server" Height="20px" tabIndex="10" Text="Add Module" ValidationGroup="addtask" Width="100px" BackColor="#0066FF" BorderColor="#333333" BorderStyle="Solid" ForeColor="White" OnClick="add_module_Click"  />
                                                    
                                                   
                                                </td>
        </tr>
        <tr>
            <td colspan="4" align="center" class="auto-style2">
                <asp:Label ID="Label7" runat="server" Text="Aleardy Added System and Modules" Font-Size="Small" ForeColor="#3399FF"></asp:Label>
            &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProjectID" DataSourceID="SqlDataSource1" ForeColor="#333333" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" InsertVisible="False" ReadOnly="True" SortExpression="ProjectID" />
                        <asp:BoundField DataField="ProjectDes" HeaderText="ProjectDes" SortExpression="ProjectDes" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ProjectID], [ProjectDes] FROM [RefProjects] WHERE ([ProjectID] &gt; @ProjectID)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="ProjectID" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td colspan="2">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProjectCatID" DataSourceID="SqlDataSource3" ForeColor="#333333" Width="100%">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="ProjectCatID" HeaderText="ProjectCatID" InsertVisible="False" ReadOnly="True" SortExpression="ProjectCatID" />
                        <asp:BoundField DataField="ProjectCatDesc" HeaderText="ProjectCatDesc" SortExpression="ProjectCatDesc" />
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ProjectCatID], [ProjectCatDesc] FROM [RefProjectCateg] WHERE ([ProjectID] = @ProjectID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="ProjectID" PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <asp:Label ID="Label12" runat="server" Text="Assinge User with System" Font-Size="Small" ForeColor="#3399FF"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style6">
                <asp:Label ID="Label13" runat="server" Text="Select User"></asp:Label>
            </td>
            <td class="auto-style6">
                <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource6" DataTextField="UserName" DataValueField="UserID" Width="179px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [UserID], [UserName] FROM [UserManager]"></asp:SqlDataSource>
            </td>
            <td colspan="2" class="auto-style6">
                </td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label14" runat="server" Text="Select System "></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4" DataTextField="ProjectDes" DataValueField="ProjectID" Height="32px" Width="182px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ProjectID], [ProjectDes] FROM [RefProjects]"></asp:SqlDataSource>
            </td>
            <td class="auto-style5">
                <asp:Label ID="Label15" runat="server" Text="Select Module"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource5" DataTextField="ProjectCatDesc" DataValueField="ProjectCatID" Height="30px" Width="184px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ProjectCatID], [ProjectCatDesc] FROM [RefProjectCateg] WHERE ([ProjectID] = @ProjectID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList2" Name="ProjectID" PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2" align="right">
                                              <asp:Button ID="add_system0" Class="btn btn-primary" runat="server" Height="19px" tabIndex="10" Text="Assinge Module"  Width="126px" BackColor="#0066FF" BorderColor="#333333" BorderStyle="Solid" ForeColor="White" OnClick="add_system0_Click" ValidationGroup="addtask"  />
                                                    
                                                   
            </td>
        </tr>
    </table>



</asp:Content>
