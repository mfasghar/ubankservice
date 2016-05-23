<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewComplaints.aspx.cs" Inherits="ubank.ViewComplaints" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

     <div class="page-header" >
    <h1 style="text-align: center">Support Incident Records</h1>
    </div>
    
   
                                        <table class="table table-hover" id="Table3" align="center" border="0" height="188" width="790" style="font-family: Aharoni; font-size: medium; color: #808080" frame="above">
                                            <tr>
                                                <td height="40" width="200">
                                                    <asp:Label ID="Label19" runat="server" Font-Size="Small">Title\Task</asp:Label>
                                                    </td>
                                                <td class="auto-style2">


                                                    <asp:Label ID="title" runat="server" Text="title"></asp:Label>


                                                </td>
                                                
                                                <td height="40" class="auto-style6">
                                                    <asp:Label ID="Label1" runat="server" Font-Size="Small">Assigned By</asp:Label>
                                                </td>
                                                <td height="40" class="auto-style7">
                                                    <asp:Label ID="assinged_by" runat="server" Text="Label"></asp:Label>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td height="40" width="200">
                                                    <asp:Label ID="Label2" runat="server" Font-Size="Small">Sub-Category</asp:Label>
                                                </td>
                                                <td height="40" class="auto-style2">
                                                    <asp:Label ID="category" runat="server" Text="Label"></asp:Label>
                                                </td>
                                                <td height="40" class="auto-style6">
                                                    <asp:Label ID="Label6" runat="server" Font-Size="Small">Request Date</asp:Label>
                                                </td>
                                                <td height="40" class="auto-style7">
                                                    <asp:Label ID="date" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="style1" width="200">
                                                    <asp:Label ID="Label7" runat="server" Font-Size="Small">Location</asp:Label>
                                                </td>
                                                <td align="left" class="auto-style5">
                                                    <asp:Label ID="location" runat="server" Text="Label"></asp:Label>
                                                </td>
                                                
                                                <td class="style1">
                                                    &nbsp;</td>
                                            </tr>
                                             <tr>


                                            <td class="style1"  width="200">
                                                    <asp:Label ID="Label5" runat="server" Font-Size="Small" Height="35px" Width="109px">Request Description</asp:Label>
                                                

                                                     <td class="style1">
                                                         <asp:Label ID="description" runat="server" Text="Label"></asp:Label>
                                                 </td>
                                            </tr>
                                            <tr>
                                                <td height="40" width="200">
                                                    <asp:Label ID="Label4" runat="server" Font-Size="Small" Height="22px" Width="103px">Priority</asp:Label>
                                                </td>
                                                <td height="40" class="auto-style2">
                                                    <asp:Label ID="priority" runat="server" Text="Label"></asp:Label>
                                                </td>
                                                <td height="40" class="auto-style6">
                                                    <asp:Label ID="Label12" runat="server" Font-Size="Small">Assigne To</asp:Label>
                                                </td>
                                                <td height="40" class="auto-style7">
                                                    <asp:Label ID="Assinge" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                           
                                            <tr>
                                                <td width="200" class="auto-style1">
                                                    <asp:Label ID="Label13" runat="server" Font-Size="Small">Remarks</asp:Label>
                                                </td>
                                                <td >
                                                   
                                                
                                                    <asp:DropDownList ID="activity_name" Class="dropdown-menu" runat="server" DataSourceID="SqlDataSource44" DataTextField="ActivityDes" DataValueField="ActivityID" AutoPostBack="True">
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource44" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ActivityID], [ActivityDes] FROM [RefActivity]"></asp:SqlDataSource>
                                                </td>
                                                
                                            </tr>
                                            <tr>
                                                <td width="200"></td>
                                                <td class="auto-style2"></td>
                                                <td class="auto-style6"></td>
                                                <td align="center" >
                                                    <asp:Button ID="resolve" Class="btn btn-primary" runat="server" Font-Size="Small" Height="22px" tabIndex="10" Text="Resolve" OnClick="Button2_Click"  ValidationGroup="addtask" BackColor="#0066CC" Font-Bold="True" ForeColor="White"  />
                                                    
                                                   
                                                </td>
                                                
                                                    </tr>

                                           

                                        </table>
                                  

    </asp:Content>
