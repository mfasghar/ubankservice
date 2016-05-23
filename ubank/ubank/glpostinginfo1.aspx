<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="glpostinginfo1.aspx.cs" Inherits="ubank.glpostinginfo1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style2
        {
            width: 396px;
        }
        .auto-style4
        {
            height: 36px;
        }
        .auto-style6
        {
            height: 36px;
        }
        .auto-style7
        {
            height: 32px;
        }
        .auto-style8
        {
            height: 36px;
            width: 6px;
        }
        .auto-style9
        {
            width: 6px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 101%; font-size: x-small;">
        <tr>
            <td class="auto-style4">
                <asp:Label ID="lblDateFrom" runat="server" Text="As on Date"></asp:Label>
&nbsp;
                <asp:TextBox ID="txtFromDate" runat="server" Width="118px">20-Jan-2015</asp:TextBox>
                <cc1:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" BehaviorID="txtFromDate_CalendarExtender" TargetControlID="txtFromDate">
                </cc1:CalendarExtender>
            &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" Font-Size="X-Small" OnClick="LinkButton1_Click" ValidationGroup="LoadGLInfo">Load Information</asp:LinkButton>
            </td>
            <td class="auto-style8"></td>
            <td class="auto-style6">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7" colspan="3">
                <asp:Label ID="lblDiffInfo" runat="server" Font-Size="Small"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4" style="background-color: #6699FF; color: #FFFFFF; font-weight: 700; font-size: medium;">Sybase GL Accounts</td>
            <td class="auto-style8" style="background-color: #6699FF; color: #FFFFFF; font-weight: 700; font-size: medium;"></td>
            <td style="background-color: #6699FF; color: #FFFFFF; font-weight: 700; font-size: medium;" class="auto-style4">PIBAS GL Accounts</td>
        </tr>
        <tr>
            <td class="auto-style2" valign="top">
                <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AllowSorting="True" AutoGenerateColumns="False" Width="619px"  OnRowDataBound ="GridView1_RowDataBound" ShowFooter="True" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="GL Description" SortExpression="GL_CODE_DESCRIPTION">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GL_CODE_DESCRIPTION") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblDiff" runat="server" Font-Size="Small" Text="Difference"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("GL_CODE_DESCRIPTION") %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle Width="300px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="PIBAS GL Code" SortExpression="PIBASGL">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PIBASGL") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblCount" runat="server" Font-Size="Small" Text="Total Records"></asp:Label>
                                <br />
                                <asp:Label ID="lblNeg1" runat="server" Text="Label"></asp:Label>
                                <br />
                                lll
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("PIBASGL") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Sybase GL CODE" SortExpression="ID_GL_CODE">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ID_GL_CODE") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("ID_GL_CODE") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Amount" SortExpression="AMOUNT">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("AMOUNT") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("AMOUNT") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Status" SortExpression="STATUS">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("STATUS") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("STATUS") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView>
            </td>
            <td class="auto-style9" style="background-color: #CCCCCC">&nbsp;</td>
            <td valign="top">
                <asp:GridView ID="GridView2" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowSorting="True" Width="266px" Height="143px" ShowFooter="True" OnRowDataBound ="GridView2_RowDataBound">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:TemplateField HeaderText="PIBAS ACCOUNT" SortExpression="PIBASACCOUNT">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("PIBASACCOUNT") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblDiffAmount" runat="server" Font-Size="Small">Difference</asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("PIBASACCOUNT") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="AMOUNT" SortExpression="AMOUNT">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AMOUNT") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lblCount2" runat="server" Font-Size="Small"> Total</asp:Label>
                                <br />
                                <asp:Label ID="lblNeg" runat="server" Text="Negative"></asp:Label>
                                <br />
                                <asp:Label ID="lblPPos1" runat="server"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("AMOUNT") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <EmptyDataTemplate>
                        <br />
                        <span class="auto-style6" style="color: #FF0000; position: relative; vertical-align: middle; text-align: center;">
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        Contact with Application Administrator
                        <br />
                        <br />
                        Sybase GL Entries are not yet posted by GL Posting Service<br /> &nbsp;</span>
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
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
    </table>
</asp:Content>
