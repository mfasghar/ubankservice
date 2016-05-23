<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="pibas111uploadxl.aspx.cs" Inherits="ubank.pibas111uploadxl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main-div">
        <h1></h1>
        <p>Upload a xls file</p>
        <p><asp:FileUpload ID="FileUpload1" runat="server" /></p>
        <p><asp:Literal ID="litmsg" runat="server"></asp:Literal></p><br />
        <asp:Button ID="btnSubmit" CssClass="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
    </div>
</asp:Content>
