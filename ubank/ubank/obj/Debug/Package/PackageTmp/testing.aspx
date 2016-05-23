<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="testing.aspx.cs" Inherits="ubank.testing" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <style type="text/css">
    .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=90);
        opacity: 0.8;
    }
    .modalPopup
    {
        background-color: #FFFFFF;
        border-width: 3px;
        border-style: solid;
        border-color: black;
        padding-top: 10px;
        padding-left: 10px;
        width: 300px;
        height: 140px;
    }
</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    



    <asp:LinkButton ID="LinkButton1" runat="server">LinkButton</asp:LinkButton>
    <cc1:ModalPopupExtender ID="LinkButton1_ModalPopupExtender" runat="server" TargetControlID="LinkButton1" PopupControlID="Panel1"> 
    </cc1:ModalPopupExtender>

     <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" style = "display:none">
    This is an ASP.Net AJAX ModalPopupExtender Example<br />
         <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
         <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox><br />
    <asp:Button ID="btnClose" runat="server" Text="Close" OnClick="poup" ValidationGroup="addtask" />
    </asp:Panel>

    

</asp:Content>
