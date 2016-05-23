<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_new_problem.aspx.cs" Inherits="ubank.Add_new_problem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 36px;
        }
        .auto-style2 {
        }
        .auto-style3 {
            height: 36px;
            width: 171px;
        }
        .auto-style4 {
            height: 45px;
        }
        .auto-style5 {
            height: 27px;
        }
        .auto-style6 {
            height: 42px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table style="width:100%;">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label5" runat="server" Text="Add New Problem "></asp:Label>
            </td>
            <td colspan="2">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label6" runat="server" Text="Select System"></asp:Label>
            </td>
            <td colspan="2" class="auto-style1">
                <asp:DropDownList ID="system_name" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="ProjectDes" DataValueField="ProjectID" Width="202px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ProjectDes], [ProjectID] FROM [RefProjects]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Label7" runat="server" Text="Select Module"></asp:Label>
            </td>
            <td class="auto-style4">
                <asp:DropDownList ID="moudle" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="ProjectCatDesc" DataValueField="ProjectCatID" Width="202px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ProjectCatDesc], [ProjectCatID] FROM [RefProjectCateg] WHERE ([ProjectID] = @ProjectID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="system_name" Name="ProjectID" PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td class="auto-style5">
                <asp:Label ID="Label8" runat="server" Text="Problem Title"></asp:Label>
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="problem_title" runat="server" Width="198px"></asp:TextBox>
            </td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style6" colspan="2">
                <asp:LinkButton ID="LinkButt" runat="server" OnClick="LinkButton1_Click21" ValidationGroup="addtask"  >Add</asp:LinkButton>
            </td>
            <td class="auto-style6"></td>
        </tr>

        <tr>
            <td class="auto-style2" colspan="2">
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Reported_problem_ID" DataSourceID="SqlDataSource3" ForeColor="#333333" Width="480px">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Reported_problem_ID" HeaderText="Reported_problem_ID" InsertVisible="False" ReadOnly="True" SortExpression="Reported_problem_ID" />
                        <asp:BoundField DataField="Problem_description" HeaderText="Problem_description" SortExpression="Problem_description" />
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [Reported_problem_ID], [Problem_description] FROM [RefReported Problem] WHERE ([ProjectCatID] = @ProjectCatID)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="moudle" Name="ProjectCatID" PropertyName="SelectedValue" Type="Decimal" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>&nbsp;</td>
        </tr>

    </table>

</asp:Content>
