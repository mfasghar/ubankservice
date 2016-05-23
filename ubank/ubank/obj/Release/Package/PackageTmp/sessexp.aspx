<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sessexp.aspx.cs" Inherits="ubank.sessexp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel3" runat="server" Font-Size="Large" 
        HorizontalAlign="Center">
        <asp:Timer ID="Timer1" runat="server" Interval="10000" OnTick="Timer1_Tick">
        </asp:Timer>
        You are not loged on to the Web portal&nbsp;<br /> OR
        <br />
        Your login session has expired</asp:Panel>
    <h3>
        Why does my session expire?</h3>
    <p>
        Login sessions expire for&nbsp;four reasons.</p>
    <ol>
        <li >For security,&nbsp;web portal session <b>expires a maximum of&nbsp;ten&nbsp;minutes</b> &nbsp;after 
            you have logged in.&nbsp; </li>
        <li >If you do not accept the <b>cookies</b> set on login or your computer is not 
            configured to accept cookies, your session will expire almost immediately. We 
            use cookies (small pieces of site information) to assist us in user 
            authentication and in saving configuration information. Cookies are required for 
            Ubank web portal.</li>
        <li >If you see this message immediately after logging in, you should check the 
            following: </li>
        <li "><strong>You are not log on at WEB Portal</strong></li>
    </ol>
    <ul>
        <li >Check to see that your computer system time is accurate. Cookies are time 
            sensitive and may not work if your computer date is incorrect by a large amount.
        </li>
        <li ">Make sure that your browser is configured to accept cookies or that you agree to 
            accept cookies during the login process. </li>
        <li style="width: 608px">Turn off any third party programs or control panels that automatically reject 
            cookies. </li>
    </ul>
    <p>
        E<b>nter the your login and password</b></p>

</asp:Content>
