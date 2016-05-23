<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="refprojects.aspx.cs" Inherits="ubank.refprojects" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
        width: 159px;
    }
        .auto-style2
        {
            width: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td class="auto-style1">
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ValidationGroup="FormView">Refresh</asp:LinkButton>
                <br />
                <br />
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceProjectList" DataTextField="ProjectDes" DataValueField="ProjectID" Height="246px" Width="226px"></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSourceProjectList" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT * FROM [RefProjects] WHERE ([ProjectID] &gt; @ProjectID)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="ProjectID" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td align="left" class="auto-style2" valign="top">&nbsp;</td>
            <td align="left" valign="top">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ProjectID" DataSourceID="SqlDataSource1" Height="197px" Width="540px">
                    <EditItemTemplate>
                        ProjectID:
                        <asp:Label ID="ProjectIDLabel1" runat="server" Text='<%# Eval("ProjectID") %>' />
                        <br />
                        <br />
                        ProjectDes:
                        <asp:TextBox ID="ProjectDesTextBox" runat="server" Text='<%# Bind("ProjectDes") %>' Width="150px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ProjectDesTextBox" ErrorMessage="Project Name is required" ValidationGroup="Update">*</asp:RequiredFieldValidator>
                        <br />
                        <br />
                        ProjectActive:
                        <asp:CheckBox ID="ProjectActiveCheckBox" runat="server" Checked='<%# Bind("ProjectActive") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <EmptyDataTemplate>
                        No project is selected from the list
                        <br />
                        Or<br /> Click on
                        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                        &nbsp;to define new project
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        ProjectID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="ProjectIDTextBox" runat="server" Text='<%# Bind("ProjectID") %>' Enabled="False" ReadOnly="True" />
                        <br />
                        <br />
                        ProjectDes:&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="ProjectDesTextBox" runat="server" Text='<%# Bind("ProjectDes") %>' Width="150px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ProjectDesTextBox" ErrorMessage="Project name is required" ValidationGroup="Insert">*</asp:RequiredFieldValidator>
                        <br />
                        <br />
                        ProjectActive:
                        <asp:CheckBox ID="ProjectActiveCheckBox" runat="server" Checked='<%# Bind("ProjectActive") %>' />
                        <br />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <br />
                        <br />
                        <br />
                        ProjectID:
                        <asp:Label ID="ProjectIDLabel" runat="server" Text='<%# Eval("ProjectID") %>' />
                        <br />
                        <br />
                        ProjectDes:
                        <asp:Label ID="ProjectDesLabel" runat="server" Text='<%# Bind("ProjectDes") %>' />
                        <br />
                        ProjectActive:
                        <asp:CheckBox ID="ProjectActiveCheckBox" runat="server" Checked='<%# Bind("ProjectActive") %>' Enabled="false" />
                        <br />
                        <br />
                        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" OnClientClick="return confirm('Are you certain you want to Delete selected project?');" />
                        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" DeleteCommand="DELETE FROM [RefProjects] WHERE [ProjectID] = @ProjectID" InsertCommand="INSERT INTO RefProjects(ProjectDes, ProjectActive) VALUES (@ProjectDes, @ProjectActive)" SelectCommand="SELECT * FROM [RefProjects] WHERE ([ProjectID] = @ProjectID)" UpdateCommand="UPDATE [RefProjects] SET [ProjectDes] = @ProjectDes, [ProjectActive] = @ProjectActive WHERE [ProjectID] = @ProjectID">
                    <DeleteParameters>
                        <asp:Parameter Name="ProjectID" Type="Decimal" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ProjectDes" Type="String" />
                        <asp:Parameter Name="ProjectActive" Type="Boolean" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="ProjectID" PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="ProjectDes" Type="String" />
                        <asp:Parameter Name="ProjectActive" Type="Boolean" />
                        <asp:Parameter Name="ProjectID" Type="Decimal" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>
</asp:Content>
