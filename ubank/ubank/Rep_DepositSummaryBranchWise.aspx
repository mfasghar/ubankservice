<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rep_DepositSummaryBranchWise.aspx.cs" Inherits="ubank.Rep_DepositSummaryBranchWise" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {}
        .auto-style2 {
            height: 22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
    <tr>
        <td class="auto-style1" colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="From Date"></asp:Label>
                    <asp:TextBox ID="txtDateFrom" runat="server" style="margin-left: 14px" ValidationGroup="aaaa1">01-Dec-2015</asp:TextBox>
&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Text="To Date"></asp:Label>
                    <asp:TextBox ID="txtDateTo" runat="server" style="margin-left: 11px" ValidationGroup="aaaa1">02-Dec-2015</asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Run Report" ValidationGroup="aaaa1" />
                </td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style1" colspan="3">
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" GroupTreeImagesFolderUrl="" Height="962px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" ToolPanelView="None" ToolPanelWidth="200px" Width="1344px" />
            <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                <Report FileName="Rep_DepositSummaryBranchWiserpt.rpt">
                </Report>
            </CR:CrystalReportSource>
        </td>
    </tr>
    <tr>
        <td class="auto-style2"></td>
        <td class="auto-style2"></td>
        <td class="auto-style2"></td>
    </tr>
</table>
</asp:Content>
