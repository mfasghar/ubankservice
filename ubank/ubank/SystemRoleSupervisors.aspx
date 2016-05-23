<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SystemRoleSupervisors.aspx.cs" Inherits="ubank.SystemRoleSupervisors" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<%@ Register namespace="AjaxControlToolkit" tagprefix="AjaxControlToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 210px;
        }
        .auto-style9
        {
            height: 21px;
            width: 25px;
        }
        .auto-style12
        {
            height: 21px;
            width: 359px;
        }
        .auto-style18
        {
            width: 25px;
        }
        .auto-style19
        {
            height: 26px;
            width: 25px;
        }
        .auto-style21
        {
            width: 359px;
        }
        .auto-style22
        {
            width: 359px;
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%; height: 586px;">
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SystemRole" DataValueField="SystemRoleID" Height="466px" Width="201px"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [SystemRoleID], [SystemRole] FROM [RefSystemRole] WHERE ([SystemRoleID] &gt; @SystemRoleID)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="SystemRoleID" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <br />
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Add New</asp:LinkButton>
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID,SystemRoleID" DataSourceID="SqlDataSource2" ShowFooter="True" Width="263px">
                    <Columns>
                        <asp:TemplateField HeaderText="UserID" SortExpression="UserID">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserID") %>'></asp:Label>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSourceLoad" DataTextField="UserName" DataValueField="UserID" SelectedValue='<%# Bind("UserID") %>' Width="200px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceLoad" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [UserID], [UserName] FROM [UserManager]"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="LevelID" SortExpression="LevelID">
                            <EditItemTemplate>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSourceEdit" DataTextField="LevelDesc" DataValueField="LevelID" SelectedValue='<%# Bind("LevelID") %>' Width="145px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceEdit" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LevelID], [LevelDesc] FROM [RefUserLevel] WHERE ([IsLevelIDActive] = @IsLevelIDActive)">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="True" Name="IsLevelIDActive" Type="Boolean" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSourceLoadLevel" DataTextField="LevelDesc" DataValueField="LevelID" SelectedValue='<%# Bind("LevelID") %>' Width="200px">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSourceLoadLevel" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LevelID], [LevelDesc] FROM [RefUserLevel]"></asp:SqlDataSource>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="SystemRoleID" HeaderText="SystemRoleID" ReadOnly="True" SortExpression="SystemRoleID" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:ButtonField CommandName="delete" Text="Delete" />
                        <asp:TemplateField ShowHeader="False">
                            <FooterTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" CommandName="Add" Text="New" ValidationGroup="InsertGroup"></asp:LinkButton>
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT UserID, LevelID, SystemRoleID FROM RefSystemRoleSupervisors WHERE (SystemRoleID = @SystemRoleID)" UpdateCommand="UPDATE RefSystemRoleSupervisors SET LevelID = @LevelID WHERE (SystemRoleID = @SystemRoleID) AND (UserID = @UserID)" DeleteCommand="DELETE FROM RefSystemRoleSupervisors WHERE (SystemRoleID = @SystemRoleID) AND (UserID = @UserID) AND (LevelID = @LevelID)">
                    <DeleteParameters>
                        <asp:Parameter Name="SystemRoleID" />
                        <asp:Parameter Name="UserID" />
                        <asp:Parameter Name="LevelID" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="SystemRoleID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LevelID" />
                        <asp:ControlParameter ControlID="ListBox1" Name="SystemRoleID" PropertyName="SelectedValue" />
                        <asp:Parameter Name="UserID" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:Panel ID="Panel1" runat="server" Height="289px" Width="355px" CssClass="modalPopup" BorderColor="Maroon" BorderStyle="Solid" BorderWidth="4px">
                    <table style="width:98%; height: 237px;">
                        <tr>
                            <td class="auto-style22"></td>
                            <td class="auto-style19">
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="17px" ImageUrl="~/pic/Delete_01.png" Width="16px" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style21" rowspan="2">
                                <asp:FormView ID="FormView1" runat="server" DataKeyNames="UserID,SystemRoleID" DataSourceID="SqlDataSource3" Height="119px" Width="333px" DefaultMode="Insert">
                                    <EditItemTemplate>
                                        UserID:
                                        <asp:Label ID="UserIDLabel1" runat="server" Text='<%# Eval("UserID") %>' />
                                        <br />
                                        LevelID:
                                        <asp:TextBox ID="LevelIDTextBox" runat="server" Text='<%# Bind("LevelID") %>' />
                                        <br />
                                        SystemRoleID:
                                        <asp:Label ID="SystemRoleIDLabel1" runat="server" Text='<%# Eval("SystemRoleID") %>' />
                                        <br />
                                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <table style="width:100%;">
                                            <tr>
                                                <td>UserID</td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1" DataTextField="UserID" DataValueField="UserID" SelectedValue='<%# Bind("UserID") %>' Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>LevelID</td>
                                                <td>
                                                    <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource2" DataTextField="LevelDesc" DataValueField="LevelID" SelectedValue='<%# Bind("LevelID") %>' Width="200px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp;</td>
                                                <td align="right">
                                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" OnClick="InsertButton_Click1" Text="Insert" ValidationGroup="InsertGroup" />
                                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                        </table>
                                        &nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [UserID], [LevelID] FROM [UserManager]"></asp:SqlDataSource>
                                        &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [LevelID], [LevelDesc] FROM [RefUserLevel] WHERE ([IsLevelIDActive] = @IsLevelIDActive)">
                                            <SelectParameters>
                                                <asp:Parameter DefaultValue="true" Name="IsLevelIDActive" Type="Boolean" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        UserID:
                                        <asp:Label ID="UserIDLabel" runat="server" Text='<%# Eval("UserID") %>' />
                                        <br />
                                        LevelID:
                                        <asp:Label ID="LevelIDLabel" runat="server" Text='<%# Bind("LevelID") %>' />
                                        <br />
                                        SystemRoleID:
                                        <asp:Label ID="SystemRoleIDLabel" runat="server" Text='<%# Eval("SystemRoleID") %>' />
                                        <br />
                                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                                    </ItemTemplate>
                                </asp:FormView>
                            </td>
                            <td class="auto-style19"></td>
                        </tr>
                        <tr>
                            <td class="auto-style18">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" DeleteCommand="DELETE FROM [RefSystemRoleSupervisors] WHERE [UserID] = @UserID AND [SystemRoleID] = @SystemRoleID" InsertCommand="INSERT INTO RefSystemRoleSupervisors(UserID, LevelID, SystemRoleID) VALUES (@UserID, @LevelID, @SystemRoleID)" SelectCommand="SELECT [UserID], [LevelID], [SystemRoleID] FROM [RefSystemRoleSupervisors] WHERE ([SystemRoleID] = @SystemRoleID)" UpdateCommand="UPDATE [RefSystemRoleSupervisors] SET [LevelID] = @LevelID WHERE [UserID] = @UserID AND [SystemRoleID] = @SystemRoleID">
                                    <DeleteParameters>
                                        <asp:Parameter Name="UserID" Type="String" />
                                        <asp:Parameter Name="SystemRoleID" Type="Decimal" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="UserID" Type="String" />
                                        <asp:Parameter Name="LevelID" Type="Decimal" />
                                        <asp:ControlParameter ControlID="ListBox1" Name="SystemRoleID" PropertyName="SelectedValue" Type="Decimal" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ListBox1" Name="SystemRoleID" PropertyName="SelectedValue" Type="Decimal" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="LevelID" Type="Decimal" />
                                        <asp:Parameter Name="UserID" Type="String" />
                                        <asp:Parameter Name="SystemRoleID" Type="Decimal" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </td>
                            <td class="auto-style9"></td>
                        </tr>
                    </table>
                </asp:Panel>
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Button ID="cmdCancel" runat="server" Height="27px" onclick="cmdCancel_Click" Text="X" Width="33px" />
               <asp:Button ID="btnShowModle" runat="server" Text="Button"  />
                <asp:ModalPopupExtender ID="btnShowModle_ModalPopupExtender" runat="server" BackgroundCssClass=".modalBackground" CancelControlID="cmdCancel" Drag="True" DropShadow="True" DynamicServicePath="" Enabled="True" OkControlID="cmdCancel" OnOkScript="InsertButton_Click1" PopupControlID="Panel1" TargetControlID="btnShowModle" PopupDragHandleControlID="Panel1">
                </asp:ModalPopupExtender>
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
