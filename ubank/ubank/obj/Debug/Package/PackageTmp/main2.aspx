<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="main2.aspx.cs" Inherits="ubank.main2" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        &nbsp;</p>
    <p>
        <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Names="Arial Black" Font-Size="Larger" ForeColor="#000099" Text="Web Portal :: U Micro Finance Bank Ltd."></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label3" runat="server" Font-Size="Small" ForeColor="#3366FF"></asp:Label>
    </p>
    <p>
        <asp:Label ID="Label6" runat="server" Font-Size="Small" ForeColor="#CC0066" Text="Login session will be expired in 10 minutes. "></asp:Label>
        <br />
        <asp:Label ID="lblComputerIP" runat="server" Text="lblComputerIP" Font-Size="Small" ForeColor="#009900"></asp:Label>
&nbsp;<br />
        <asp:Label ID="lblComputerName" runat="server" Text="lblComputerName" Font-Size="Small" ForeColor="#009933"></asp:Label>
        <br />
        <asp:Label ID="lblDomainLogin" runat="server" Text="lblDomainLogin" Font-Size="Small" ForeColor="#006600"></asp:Label>
    </p>
    <p>
        <asp:Timer ID="Timer1" runat="server" Interval="5000" ontick="Timer1_Tick">
        </asp:Timer>
    </p>
    <p>
        <asp:Label ID="Label4" runat="server" BackColor="#FFC080" BorderColor="#C00000" BorderStyle="Dotted" Font-Size="X-Small" ForeColor="#0000C0" style="Z-INDEX: 109; LEFT: 0px; POSITION: relative; TOP: 4px; height: 25px;" Width="100%">  Please close this window after completing the administrative task or logout your login</asp:Label>
    </p>
    <p>
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click1" ValidationGroup="Logoffmain">Log off</asp:LinkButton>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
