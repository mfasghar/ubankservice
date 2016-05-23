<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="requeststatusonname.aspx.cs" Inherits="ubank.requeststatusonname" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 294px;
        }
        .auto-style2
        {
            width: 294px;
            height: 61px;
        }
        .auto-style3
        {
            height: 61px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td class="auto-style2">
                <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
                 <asp:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" 
                                runat="server" Enabled="True" TargetControlID="TextBox1" WatermarkText="Search Name" WatermarkCssClass="WaterMarkText">
                            </asp:TextBoxWatermarkExtender>
                <asp:ImageButton ID="ImageButton1" runat="server" Height="24px" ImageUrl="~/pic/refreshblackflat.png" ValidationGroup="Search" Width="23px" />
            </td>
            <td class="auto-style3">&nbsp;</td>
            <td class="auto-style3"></td>
        </tr>
        <tr>
            <td aria-orientation="vertical" class="auto-style1" style="vertical-align: top; text-align: left">
                <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="UserName" DataValueField="AppID" Height="399px" Width="231px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"></asp:ListBox>
                <asp:ListSearchExtender ID="ListBox1_ListSearchExtender" runat="server" Enabled="True" TargetControlID="ListBox1" PromptCssClass="SearchText">
                </asp:ListSearchExtender>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [AppID], [UserName] FROM [Application] WHERE ([UserName] LIKE '%' + @UserName + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" Name="UserName" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td colspan="2" headers="Request status" style="vertical-align: top; text-align: left">
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" EnableDatabaseLogonPrompt="False" EnableParameterPrompt="False" GroupTreeImagesFolderUrl="" Height="1202px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" ToolPanelView="None" ToolPanelWidth="200px" Visible="False" Width="1104px" />
                <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                    <Report FileName="printuserrequest.rpt">
                    </Report>
                </CR:CrystalReportSource>
            </td>
        </tr>
    </table>
</asp:Content>
