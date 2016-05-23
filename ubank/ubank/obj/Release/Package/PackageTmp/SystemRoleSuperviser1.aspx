<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SystemRoleSuperviser1.aspx.cs" Inherits="ubank.SystemRoleSuperviser1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 268px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" valign="top">
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1list" DataTextField="SystemRole" DataValueField="SystemRoleID" Height="345px" Width="248px"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource1list" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [SystemRoleID], [SystemRole] FROM [RefSystemRole] WHERE (([IsSystemRoleActive] = @IsSystemRoleActive) AND ([SystemRoleID] &gt; @SystemRoleID))">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="true" Name="IsSystemRoleActive" Type="Boolean" />
                        <asp:Parameter DefaultValue="0" Name="SystemRoleID" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td valign="top">
                <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1insert"   OnItemInserted ="AfterinsertRefresh" Width="309px" >
                    <EditItemTemplate>
                        LevelID:
                        <asp:TextBox ID="LevelIDTextBox" runat="server" Text='<%# Bind("LevelID") %>' />
                        <br />
                        UserID:
                        <asp:TextBox ID="UserIDTextBox" runat="server" Text='<%# Bind("UserID") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <table style="width:100%;">
                            <tr>
                                <td>UserID</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1ins" DataTextField="UserID" DataValueField="UserID" SelectedValue='<%# Bind("UserID") %>' Width="200px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1ins" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [UserID], [UserName] FROM [UserManager] WHERE ([AccountDisabled] = @AccountDisabled)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="False" Name="AccountDisabled" Type="Boolean" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>LevelID</td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource1inslevel" DataTextField="LevelDesc" DataValueField="LevelID" SelectedValue='<%# Bind("LevelID") %>' Width="200px">
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SqlDataSource1inslevel" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LevelID], [LevelDesc] FROM [RefUserLevel] WHERE (([IsLevelIDActive] = @IsLevelIDActive) AND ([LevelID] &gt; @LevelID))">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="true" Name="IsLevelIDActive" Type="Boolean" />
                                            <asp:Parameter DefaultValue="0" Name="LevelID" Type="Decimal" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td align="right">&nbsp;
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="InsGroup" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource1insert" runat="server"  ConnectionString="<%$ ConnectionStrings:strConn %>" InsertCommand="INSERT INTO RefSystemRoleSupervisors(SystemRoleID, UserID, LevelID) VALUES (@SystemRoleID, @UserID, @LevelID)" SelectCommand="SELECT LevelID, UserID FROM RefSystemRoleSupervisors WHERE (SystemRoleID = @SystemRoleID)" >
                    <InsertParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="SystemRoleID" PropertyName="SelectedValue" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="SystemRoleID" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="UserID,LevelID" DataSourceID="SqlDataSource11" ForeColor="#333333" GridLines="None" Height="93px" Width="453px" AllowSorting="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="UserID" SortExpression="UserID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSourceEditUserID" DataTextField="UserName" DataValueField="UserID" Width="200px" SelectedValue='<%# Bind("UserID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceEditUserID" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [UserID], [UserName] FROM [UserManager]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSourceread" DataTextField="UserName" DataValueField="UserID" SelectedValue='<%# Bind("UserID") %>' Width="200px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceread" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [UserID], [UserName] FROM [UserManager]"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LevelID" SortExpression="LevelID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1LevelEdit" DataTextField="LevelDesc" DataValueField="LevelID" Width="200px" SelectedValue='<%# Bind("LevelID") %>'>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1LevelEdit" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LevelID], [LevelDesc] FROM [RefUserLevel]"></asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList6" runat="server" DataSourceID="SqlDataSource1redl" DataTextField="LevelDesc" DataValueField="LevelID" SelectedValue='<%# Bind("LevelID") %>' Width="200px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1redl" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LevelID], [LevelDesc] FROM [RefUserLevel] WHERE ([LevelID] &gt; @LevelID)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="0" Name="LevelID" Type="Decimal" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"  OnClientClick="return confirm('Are you certain you want to Delete?');" ></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
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
                <asp:SqlDataSource ID="SqlDataSource11" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" DeleteCommand="DELETE FROM RefSystemRoleSupervisors WHERE (SystemRoleID = @SystemRoleID) AND (UserID = @UserID) AND (LevelID = @LevelID)" SelectCommand="SELECT [UserID], [LevelID] FROM [RefSystemRoleSupervisors] WHERE ([SystemRoleID] = @SystemRoleID)" UpdateCommand="UPDATE RefSystemRoleSupervisors SET LevelID = @LevelID WHERE (SystemRoleID = @SystemRoleID) AND (UserID = @UserID)">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="SystemRoleID" PropertyName="SelectedValue" />
                        <asp:Parameter Name="UserID" />
                        <asp:Parameter Name="LevelID" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="SystemRoleID" PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LevelID" />
                        <asp:Parameter Name="SystemRoleID" />
                        <asp:Parameter Name="UserID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
