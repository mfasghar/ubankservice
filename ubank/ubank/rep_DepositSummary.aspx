<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rep_DepositSummary.aspx.cs" Inherits="ubank.rep_DepositSummary" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 36px;
        }
        .auto-style2 {
            height: 87px;
        }
        .auto-style3 {
            height: 36px;
            color: #3333FF;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style3" style="font-size: xx-large">
                    <strong>Branch wise Deposit Position</strong></td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="From Date"></asp:Label>
                    <asp:TextBox ID="txtDateFrom" runat="server" style="margin-left: 14px">01-Jan-2015</asp:TextBox>
&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" Text="To Date"></asp:Label>
                    <asp:TextBox ID="txtDateTo" runat="server" style="margin-left: 11px">25-Nov-2015</asp:TextBox>
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Run Report" />
                </td>
                <td class="auto-style1"></td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td colspan="3" class="auto-style2">
                    <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="true" ReportSourceID="CrystalReportSource1" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" ReuseParameterValuesOnRefresh="True" ToolPanelView="None" />
                    <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                        <Report FileName="CrystalReport1.rpt">
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
    
    </div>
    </form>
</body>
</html>
