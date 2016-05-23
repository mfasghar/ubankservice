<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="inquiretid.aspx.cs" Inherits="ubank.inquiretid" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
        }
        .auto-style2
        {
            width: 37px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%; height: 202px;">
        <tr>
            <td class="auto-style2">
                <asp:Label ID="Label5" runat="server" Text="TID"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server">0</asp:TextBox>
            &nbsp;<asp:Button ID="Button1" runat="server" Text="View Request" ValidationGroup="itd" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="3">
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="1104px" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" ReuseParameterValuesOnRefresh="True" ToolPanelView="None" />
                <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                    <Report FileName="printuserrequest.rpt">
                    </Report>
                </CR:CrystalReportSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="3">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
