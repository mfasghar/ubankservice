<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Rep_Diff_of_DepositBalances.aspx.cs" Inherits="ubank.Rep_Diff_of_DepositBalances" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Text="Date From"></asp:Label>
                <asp:TextBox ID="txtDateFrom" runat="server" ValidationGroup="aaa1">01-Dec-2015</asp:TextBox>
                &nbsp;<asp:Label ID="Label6" runat="server" Text="Date To"></asp:Label>
                &nbsp;<asp:TextBox ID="txtDateTo" runat="server" ValidationGroup="aaa1">02-Dec-2015</asp:TextBox>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Run Report" Height="23px" Width="91px" ValidationGroup="aaa1" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" GroupTreeImagesFolderUrl="" Height="1202px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" ToolPanelView="None" ToolPanelWidth="200px" Width="1104px" PageZoomFactor="75" />
                <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                    <Report FileName="RptDepositposition.rpt">
                    </Report>
                </CR:CrystalReportSource>
                
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
