<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="logs1.aspx.cs" Inherits="ubank.logs1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
        .auto-style2 {
            height: 48px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <table style="width:100%;">
        <tr>
            <td class="auto-style1" colspan="3" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="X-Large" Font-Underline="False" ForeColor="#999999" Text="SMS Logs"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label6" runat="server" Text="Date From"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" BehaviorID="TextBox1_CalendarExtender" TargetControlID="TextBox1" />
                <asp:Label ID="Label7" runat="server" Text="Date To"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" BehaviorID="TextBox2_CalendarExtender" TargetControlID="TextBox2" />
&nbsp;<asp:Button ID="Button1" runat="server" Text="Extract Logs" ValidationGroup="extractlogs" />
            </td>
            <td class="auto-style2">&nbsp;</td>
            <td class="auto-style2"></td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MSISDN" HeaderText="MSISDN" SortExpression="MSISDN" />
                        <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                        <asp:BoundField DataField="sDateTime" HeaderText="Date and Time" SortExpression="sDateTime" />
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
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT SmsStatus.Descp AS Status, UserManager.UserName, SMSLog.Message, SMSLog.Msisdn AS MSISDN, SMSLog.SMSDateTime AS sDateTime FROM SMSLog INNER JOIN UserManager ON SMSLog.UserId = UserManager.UserID INNER JOIN SmsStatus ON SMSLog.StatusID = SmsStatus.StatusID WHERE (SMSLog.SMSDateTime &gt;= @FromDate) AND (SMSLog.SMSDateTime &lt;= @Todate)">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="FromDate" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" Name="Todate" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
