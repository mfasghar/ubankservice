<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="defaultAdd.aspx.cs" Inherits="ubank.defaultAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 459px;
        }
        .auto-style2 {
            width: 99px;
        }
    </style>
    </asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%; font-size: xx-small;">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label5" runat="server" Text="Select Enviroment"></asp:Label>
            </td>
            <td class="auto-style1">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ConnDesc" DataValueField="ConnCode" Height="20px" Width="185px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" InitialValue ="0"
                            ControlToValidate="DropDownList1" ErrorMessage="Please enter your Request Description" 
                            ForeColor="#FF3300" ValidationGroup="addtask">*</asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT * FROM [RefPibasCon]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="2">
                &nbsp;<asp:Button ID="ExportToExcel" runat="server" Font-Size="Small"  Text="Export to Excel" ValidationGroup="sybasereversal" OnClick="ExportToExcel_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
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
