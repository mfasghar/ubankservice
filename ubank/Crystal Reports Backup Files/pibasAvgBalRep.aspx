<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pibasAvgBalRep.aspx.cs" Inherits="ubank.pibasAvgBalRep" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 194px;
        }
        .auto-style2
        {
            width: 242px;
            height: 27px;
        }
        .auto-style3
        {
            width: 194px;
            height: 27px;
        }
        .auto-style4
        {
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label5" runat="server" Text="Server"></asp:Label>
            </td>
            <td colspan="5">
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="ServarName" DataValueField="ServerID" Width="343px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT * FROM [OraServerInfo] WHERE ([IsActive] = @IsActive)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="true" Name="IsActive" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style3">
                <asp:Label ID="Label6" runat="server" Text="Amount Grater "></asp:Label>
            </td>
            <td class="auto-style2">
                <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
            </td>
            <td class="auto-style4" colspan="2">
                <asp:Label ID="Label8" runat="server" Text="Date from"></asp:Label>
            </td>
            <td class="auto-style4" colspan="2">
                <asp:TextBox ID="txtDateFrom" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label7" runat="server" Text="Account Type List"></asp:Label>
            </td>
            <td colspan="4">
                <asp:TextBox ID="txtAccTypeList" runat="server" Width="200px"></asp:TextBox>
            </td>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" ValidationGroup="RunReport" OnClick="LinkButton1_Click1">Run Report</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="1202px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="1104px" OnInit="CrystalReportViewer1_Init" />
                <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                    <Report FileName="pibasAvgBalRpt.rpt">
                    </Report>
                </CR:CrystalReportSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td colspan="2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
