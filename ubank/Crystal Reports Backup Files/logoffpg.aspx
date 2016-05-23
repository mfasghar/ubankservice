<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="logoffpg.aspx.cs" Inherits="ubank.logoffpg" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   
    <asp:Panel ID="Panel4" runat="server">
        <br />
        <br />
        <br />
        <br />
        <br />
        <asp:Panel ID="Panel5" runat="server" HorizontalAlign="Center">
            <asp:Label ID="Label5" runat="server" 
                Text="You have been logged out successfully"></asp:Label>
            <br />
            <br />
            <asp:Timer ID="Timer1" runat="server" Interval="3000" ontick="Timer1_Tick">
            </asp:Timer>
        </asp:Panel>
</asp:Panel>
   
</asp:Content>
