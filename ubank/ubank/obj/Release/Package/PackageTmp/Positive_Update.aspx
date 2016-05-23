<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Positive_Update.aspx.cs" Inherits="ubank.Positive_Update" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 406px;
        }
        .auto-style2 {
            width: 162px;
        }
        .auto-style3 {
            width: 299px;
        }
        .auto-style4 {
            width: 104px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <table style="width:100%; font-size: small;">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label6" runat="server" Text="Select Enviroment"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ConnDesc" DataValueField="ConnCode" Height="16px" Width="209px" AutoPostBack="True">
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" InitialValue ="0"
                            ControlToValidate="DropDownList1" ErrorMessage="Please enter your Request Description" 
                            ForeColor="#FF3300" ValidationGroup="addtask">*</asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT * FROM [RefPibasCon]"></asp:SqlDataSource>
            </td>
            <td class="auto-style4">
                &nbsp;</td>
            <td class="auto-style1">
                &nbsp;</td>
            <td class="auto-style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label5" runat="server" Text="Date Last Disbursed"></asp:Label>
            </td>
            <td class="auto-style3">
                <asp:TextBox ID="from_date" runat="server"></asp:TextBox>
                <cc1:CalendarExtender ID="from_date_CalendarExtender" runat="server" BehaviorID="from_date_CalendarExtender" TargetControlID="from_date">
                </cc1:CalendarExtender>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" 
                    runat="server" ErrorMessage="Please Select Text" ControlToValidate="from_date" ValidationGroup="addtask">*</asp:RequiredFieldValidator>
            </td>
            <td class="auto-style4">
                <asp:LinkButton ID="load" runat="server" OnClick="load_Click" ValidationGroup="sybasereversal">Load Data</asp:LinkButton>
            </td>
            <td class="auto-style1">
                &nbsp;</td>
            <td class="auto-style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="5">
                <asp:Button ID="ExportToExcel" runat="server" Font-Size="Small"  Text="Export to Excel" ValidationGroup="sybasereversal" OnClick="ExportToExcel_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="5">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
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
              
            </td>
        </tr>
        </table>

</asp:Content>
