<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="editGLpostingTime.aspx.cs" Inherits="ubank.editGLpostingTime" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 165px;
        }
        .auto-style2
        {
            width: 165px;
            height: 23px;
        }
        .auto-style3
        {
            height: 23px;
        }
        .auto-style4
        {
            width: 165px;
            height: 22px;
        }
        .auto-style5
        {
            height: 22px;
        }
        .auto-style6
        {
            width: 10px;
        }
        .auto-style7
        {
            height: 23px;
            width: 10px;
        }
        .auto-style8
        {
            height: 22px;
            width: 10px;
        }
        .auto-style9
        {
            width: 165px;
            height: 27px;
        }
        .auto-style10
        {
            height: 27px;
        }
        .auto-style11
        {
            width: 10px;
            height: 27px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width:100%;">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:FormView ID="FormView1" runat="server">
                    <EditItemTemplate>
                        <table style="width:98%;">
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label5" runat="server" Text="ServerName"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ServerName") %>'></asp:TextBox>
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label6" runat="server" Text="SMTPPort"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label7" runat="server" Text="UserName"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label9" runat="server" Text="ToEmail"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ToEmail") %>'></asp:TextBox>
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label10" runat="server" Text="ServerID"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ServerID") %>'></asp:TextBox>
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label11" runat="server" Text="Connection"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox7" runat="server" Height="84px" Text='<%# Bind("Connection") %>' TextMode="MultiLine" Width="540px"></asp:TextBox>
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label12" runat="server" Text="DownloadFilePath"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("DownloadFilePath") %>'></asp:TextBox>
                                </td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label13" runat="server" Text="TimeInterval"></asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("TimeInterval") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label14" runat="server" Text="SourceUrl"></asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("SourceUrl") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label15" runat="server" Text="LogFolderPath"></asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("LogFolderPath") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label16" runat="server" Text="strAmount"></asp:Label>
                                </td>
                                <td class="auto-style3" colspan="2">
                                    <asp:TextBox ID="TextBox12" runat="server" Text='<%# Bind("strAmount") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label17" runat="server" Text="StartTime"></asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="TextBox13" runat="server" Text='<%# Bind("StartTime") %>'></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style9">
                                    <asp:Label ID="Label18" runat="server" Text="PibasString"></asp:Label>
                                </td>
                                <td class="auto-style10" colspan="2">
                                    <asp:TextBox ID="TextBox14" runat="server" Height="84px" Text='<%# Bind("PibasString") %>' TextMode="MultiLine" Width="540px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">
                                    <asp:Label ID="Label19" runat="server" Text="SybaseString"></asp:Label>
                                </td>
                                <td class="auto-style5" colspan="2">
                                    <asp:TextBox ID="TextBox15" runat="server" Height="84px" Text='<%# Bind("SybaseString") %>' TextMode="MultiLine" Width="540px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" ValidationGroup="FrmEdit">Update</asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton4" runat="server">Cancel</asp:LinkButton>
                                </td>
                                <td>&nbsp;</td>
                                <td class="auto-style6">&nbsp;</td>
                            </tr>
                        </table>
                    </EditItemTemplate>
                    <ItemTemplate>
 
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label5" runat="server" Text="ServerName"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label20" runat="server" Text='<%# Bind("ServerName") %>'></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label6" runat="server" Text="SMTPPort"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label21" runat="server" Text='<%# Bind("SMTPPort")  %>'></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label7" runat="server" Text="UserName"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label22" runat="server" Text='<%# Bind("UserName")  %>'></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label23" runat="server" Text='<%# Bind("Password")  %>'></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label9" runat="server" Text="ToEmail"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label24" runat="server" Text='<%# Bind("ToEmail")  %>'></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label10" runat="server" Text="ServerID"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label25" runat="server" Text='<%# Bind("ServerID")  %>'></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label11" runat="server" Text="Connection"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label34" runat="server" Text='<%# Bind("Connection")  %>'></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label12" runat="server" Text="DownloadFilePath"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label27" runat="server" Text='<%# Bind("DownloadFilePath")  %>'></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label13" runat="server" Text="TimeInterval"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label28" runat="server" Text='<%# Bind("TimeInterval")  %>'></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label14" runat="server" Text="SourceUrl"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label29" runat="server" Text='<%# Bind("SourceUrl")  %>'></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label15" runat="server" Text="LogFolderPath"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label30" runat="server" Text='<%# Bind("LogFolderPath")  %>'></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style2">
                                    <asp:Label ID="Label16" runat="server" Text="strAmount"></asp:Label>
                                </td>
                                <td class="auto-style3">
                                    <asp:Label ID="Label31" runat="server" Text='<%# Bind("strAmount")  %>'></asp:Label>
                                </td>
                                <td class="auto-style3"></td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label17" runat="server" Text="StartTime"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("StartTime") %>'></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:Label ID="Label18" runat="server" Text="PibasString"></asp:Label>
                                </td>
                                <td>
                                    <asp:Label ID="Label32" runat="server" Text='<%# Bind("PibasString")  %>'></asp:Label>
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style4">
                                    <asp:Label ID="Label19" runat="server" Text="SybaseString"></asp:Label>
                                </td>
                                <td class="auto-style5">
                                    <asp:Label ID="Label33" runat="server" Text='<%# Bind("SybaseString")  %>'></asp:Label>
                                </td>
                                <td class="auto-style5"></td>
                            </tr>
                            <tr>
                                <td class="auto-style1">
                                    <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" ValidationGroup="FrmEdit">Edit</asp:LinkButton>
                                </td>
                                <td>&nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
 
                </ItemTemplate>

                </asp:FormView>
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"
                     OnRowCancelingEdit="GridView1_RowCancelingEdit"
            OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" >
            <FooterStyle BackColor="#5D7B9D" ForeColor="#8C4510"     />
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField ShowHeader="False">
                            <EditItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="GEditz"></asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" ValidationGroup="GEditz"></asp:LinkButton>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" ValidationGroup="GEditz"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
