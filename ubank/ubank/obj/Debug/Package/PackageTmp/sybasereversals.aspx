<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sybasereversals.aspx.cs" Inherits="ubank.sybasereversals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            color: #3366FF;
            font-weight: bold;
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%; font-size: xx-small;">
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Date from"></asp:Label>
            &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="sybasereversal">Load Data</asp:LinkButton>
            &nbsp;</td>
            <td>
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td colspan="4" class="auto-style1">
                Sybase Reversals
                <asp:Button ID="ExportToExcel" runat="server" Font-Size="Small" OnClick="ExportToExcel_Click" Text="Export to Excel" ValidationGroup="sybasereversal" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SybaseConnectionLive %>" ProviderName="<%$ ConnectionStrings:SybaseConnectionLive.ProviderName %>"
                     SelectCommand="SELECT * FROM pbxhbl.REVERSAL_STATUS rs
                        inner join cmsuser.VIEW_TRANSACTION_REPORT vr on rs.ID_TXN=vr.TID
                        inner join cmsuser.VIEW_TRANSACTION_REPORT vrr on rs.ID_REVERSED_TXN=vrr.TID

                        WHERE ID_REVERSED_TXN   in (
                        SELECT ID_TXN FROM pbxhbl.HBL_TRANSACTIONS hbl
                        WHERE hbl.ID_USE_CASE = 9174 and hbl.DAT_CREATION &gt; sysdate
                        )">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
