<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="validation_resolve.aspx.cs" Inherits="ubank.validation_resolve" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <script type = "text/javascript">
         function myFunction() {
             window.print();
         }
    </script>

    <table style="width:100%;">
        <tr>
            <td colspan="3">
                <asp:Label ID="malsent" runat="server" Font-Bold="False" Font-Size="Medium" Text="Your activity  on complaint is successfully done."></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <table id="table" style="border: thin solid #808080; width: 100%; height: 212px; text-align: left;" cellpadding="2" cellspacing="2">
                    <tr>
                        <td class="auto-style1" colspan="5">
                            <asp:Label ID="Label12" runat="server" Font-Size="Large" ForeColor="#666666" Text="Complaint Detail"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">
                            <asp:Label ID="Label5" runat="server" Text="Email From" Font-Size="Medium" ForeColor="#3333CC"></asp:Label>
                        </td>
                        <td class="auto-style2" colspan="4">
                            <asp:Label ID="from" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">
                            <asp:Label ID="date" runat="server" Text="Date" Font-Size="Medium" ForeColor="#3333CC"></asp:Label>
                        </td>
                        <td class="auto-style2" colspan="4">
                            <asp:Label ID="datee" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="email_to" runat="server" Text="To " Font-Size="Medium" ForeColor="#3333CC"></asp:Label>
                        </td>
                        <td class="auto-style5" colspan="4">
                            <asp:Label ID="emailfor" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">
                            <asp:Label ID="su" runat="server" Text="Subject" Font-Size="Medium" ForeColor="#3333CC"></asp:Label>
                        </td>
                        <td class="auto-style4">
                            <asp:Label ID="subjectname" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="auto-style4">
                            &nbsp;</td>
                        <td class="auto-style4" colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style10">
                            <asp:Label ID="Label8" runat="server" Text="Reported Channel" Font-Size="Medium" ForeColor="#3333CC"></asp:Label>
                        </td>
                        <td class="auto-style11">
                            <asp:Label ID="channelname" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="auto-style6" colspan="2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style10">
                            <asp:Label ID="Label10" runat="server" Text="System" Font-Size="Medium" ForeColor="#3333CC"></asp:Label>
                        </td>
                        <td class="auto-style11">
                            <asp:Label ID="system" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td class="auto-style6" colspan="2">
                            <asp:Label ID="Label7" runat="server" Text="Module" Font-Size="Medium" ForeColor="#3333CC"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="module" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style3">&nbsp;<asp:Label ID="Label13" runat="server" Font-Bold="True" Text="Dear "></asp:Label>
                            <asp:Label ID="user_name" runat="server" Text="Label" Font-Bold="True"></asp:Label>
                            ,</td>
                        <td class="auto-style12">
                        </td>
                        <td class="auto-style7" colspan="2">
                        </td>
                        <td class="auto-style4">
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style8" colspan="5">
                            <asp:Label ID="description" runat="server" Text="This Email has been forwarded to above mentioned person."></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9" colspan="5">
                            <asp:Label ID="Label11" runat="server" Text="This is an auto generated Email "></asp:Label>
                        </td>
                    </tr>
                    </table>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ValidationGroup="addtask">ViewComplaints</asp:LinkButton>
          
                
                  </td>
            
            
        </tr>
        <tr>
            <td>
          
                
               
          
                <asp:LinkButton ID="print" runat="server"  OnClientClick = "myFunction()"  >Print</asp:LinkButton>
                  </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>


</asp:Content>
