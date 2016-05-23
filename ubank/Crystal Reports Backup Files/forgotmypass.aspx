<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="forgotmypass.aspx.cs" Inherits="ubank.forgotmypass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 633px;
        }
        .auto-style2
        {
            width: 633px;
            height: 2px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <table style="width: 641px">
        <tr>
            <td style="font-size: x-small; color: #808080" class="auto-style1">Enter your login and we will send your password at your official email address.
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" Font-Size="X-Small" ForeColor="#FF3300" style="margin-left: 19px; margin-right: 20px; margin-top: 12px; margin-bottom: 19px" ValidationGroup="ForgotPass" Width="489px" />
                <br />
                <asp:Label ID="lblError" runat="server" Font-Size="X-Small" ForeColor="#FF3300"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label5" runat="server" Text="Login ID" Font-Size="X-Small"></asp:Label>
                *<asp:TextBox ID="UserIDTextBox" runat="server" Width="209px" Font-Size="Small"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UserIDTextBox" ErrorMessage="User Login ID is required" ToolTip="email Address is required" ValidationGroup="ForgotPass">*</asp:RequiredFieldValidator>
                &nbsp;&nbsp; </td>
        </tr>
        <tr>
            <td align="right" class="body" style="width: 633px">
                <asp:Button ID="Button1" runat="server" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Double" Font-Size="X-Small" Height="20px" onclick="Button1_Click" style="margin-right: 6px" Text="Send" ValidationGroup="ForgotPass" Width="65px" />
                &nbsp;<asp:Button ID="Button2" runat="server" BackColor="#CCCCCC" BorderColor="Silver" BorderStyle="Double" Font-Size="X-Small" Height="20px" onclick="Button2_Click" style="margin-right: 3px" Text="Cancel" Width="65px" />
                &nbsp;</td>
        </tr>
    </table>
       
</asp:Content>
