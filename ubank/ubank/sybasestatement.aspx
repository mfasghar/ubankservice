<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sybasestatement.aspx.cs" Inherits="ubank.sybasestatement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            height: 9px;
        }
        .auto-style2
        {
            width: 190px;
        }
        .auto-style3
        {
            height: 8px;
        }
        .auto-style4
        {
            width: 190px;
            height: 39px;
        }
        .auto-style5
        {
            height: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;</td>
            <td class="auto-style5">
                <asp:Label ID="Label6" runat="server" Text="Label"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            </td>
            <td colspan="2" class="auto-style5">
                <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style3" colspan="4"></td>
        </tr>
        <tr>
            <td class="auto-style1" colspan="4">
                <asp:FormView ID="FormView1" runat="server" DataKeyNames="ACNO" DataSourceID="SqlDataSource1" Width="917px">
                    <EditItemTemplate>
                        TRANSACTION_DATE:
                        <asp:TextBox ID="TRANSACTION_DATETextBox" runat="server" Text='<%# Bind("TRANSACTION_DATE") %>' />
                        <br />
                        VALUE_DATE:
                        <asp:TextBox ID="VALUE_DATETextBox" runat="server" Text='<%# Bind("VALUE_DATE") %>' />
                        <br />
                        IDTXN:
                        <asp:TextBox ID="IDTXNTextBox" runat="server" Text='<%# Bind("IDTXN") %>' />
                        <br />
                        NEWAMOUNT:
                        <asp:TextBox ID="NEWAMOUNTTextBox" runat="server" Text='<%# Bind("NEWAMOUNT") %>' />
                        <br />
                        BALANCE:
                        <asp:TextBox ID="BALANCETextBox" runat="server" Text='<%# Bind("BALANCE") %>' />
                        <br />
                        NAME:
                        <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                        <br />
                        ADDRESS:
                        <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                        <br />
                        AGENT_TYPE:
                        <asp:TextBox ID="AGENT_TYPETextBox" runat="server" Text='<%# Bind("AGENT_TYPE") %>' />
                        <br />
                        STR_USE_CASE:
                        <asp:TextBox ID="STR_USE_CASETextBox" runat="server" Text='<%# Bind("STR_USE_CASE") %>' />
                        <br />
                        ACNO:
                        <asp:TextBox ID="ACNOTextBox" runat="server" Text='<%# Bind("ACNO") %>' />
                        <br />
                        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        TRANSACTION_DATE:
                        <asp:TextBox ID="TRANSACTION_DATETextBox" runat="server" Text='<%# Bind("TRANSACTION_DATE") %>' />
                        <br />
                        VALUE_DATE:
                        <asp:TextBox ID="VALUE_DATETextBox" runat="server" Text='<%# Bind("VALUE_DATE") %>' />
                        <br />
                        IDTXN:
                        <asp:TextBox ID="IDTXNTextBox" runat="server" Text='<%# Bind("IDTXN") %>' />
                        <br />
                        NEWAMOUNT:
                        <asp:TextBox ID="NEWAMOUNTTextBox" runat="server" Text='<%# Bind("NEWAMOUNT") %>' />
                        <br />
                        BALANCE:
                        <asp:TextBox ID="BALANCETextBox" runat="server" Text='<%# Bind("BALANCE") %>' />
                        <br />
                        NAME:
                        <asp:TextBox ID="NAMETextBox" runat="server" Text='<%# Bind("NAME") %>' />
                        <br />
                        ADDRESS:
                        <asp:TextBox ID="ADDRESSTextBox" runat="server" Text='<%# Bind("ADDRESS") %>' />
                        <br />
                        AGENT_TYPE:
                        <asp:TextBox ID="AGENT_TYPETextBox" runat="server" Text='<%# Bind("AGENT_TYPE") %>' />
                        <br />
                        STR_USE_CASE:
                        <asp:TextBox ID="STR_USE_CASETextBox" runat="server" Text='<%# Bind("STR_USE_CASE") %>' />
                        <br />
                        ACNO:
                        <asp:TextBox ID="ACNOTextBox" runat="server" Text='<%# Bind("ACNO") %>' />
                        <br />
                        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        TRANSACTION_DATE:
                        <asp:Label ID="TRANSACTION_DATELabel" runat="server" Text='<%# Bind("TRANSACTION_DATE") %>' />
                        <br />
                        VALUE_DATE:
                        <asp:Label ID="VALUE_DATELabel" runat="server" Text='<%# Bind("VALUE_DATE") %>' />
                        <br />
                        IDTXN:
                        <asp:Label ID="IDTXNLabel" runat="server" Text='<%# Bind("IDTXN") %>' />
                        <br />
                        NEWAMOUNT:
                        <asp:Label ID="NEWAMOUNTLabel" runat="server" Text='<%# Bind("NEWAMOUNT") %>' />
                        <br />
                        BALANCE:
                        <asp:Label ID="BALANCELabel" runat="server" Text='<%# Bind("BALANCE") %>' />
                        <br />
                        NAME:
                        <asp:Label ID="NAMELabel" runat="server" Text='<%# Bind("NAME") %>' />
                        <br />
                        ADDRESS:
                        <asp:Label ID="ADDRESSLabel" runat="server" Text='<%# Bind("ADDRESS") %>' />
                        <br />
                        AGENT_TYPE:
                        <asp:Label ID="AGENT_TYPELabel" runat="server" Text='<%# Bind("AGENT_TYPE") %>' />
                        <br />
                        STR_USE_CASE:
                        <asp:Label ID="STR_USE_CASELabel" runat="server" Text='<%# Bind("STR_USE_CASE") %>' />
                        <br />
                        ACNO:
                        <asp:Label ID="ACNOLabel" runat="server" Text='<%# Bind("ACNO") %>' />
                        <br />

                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Width="463px">
                            <Columns>
                                <asp:BoundField DataField="TRANSACTION_DATE" HeaderText="TRANSACTION_DATE" SortExpression="TRANSACTION_DATE" />
                                <asp:BoundField DataField="VALUE_DATE" HeaderText="VALUE_DATE" SortExpression="VALUE_DATE" />
                                <asp:BoundField DataField="IDTXN" HeaderText="IDTXN" SortExpression="IDTXN" />
                                <asp:BoundField DataField="NEWAMOUNT" HeaderText="NEWAMOUNT" SortExpression="NEWAMOUNT" />
                                <asp:BoundField DataField="BALANCE" HeaderText="BALANCE" SortExpression="BALANCE" />
                                <asp:BoundField DataField="NAME" HeaderText="NAME" SortExpression="NAME" />
                                <asp:BoundField DataField="ADDRESS" HeaderText="ADDRESS" SortExpression="ADDRESS" />
                                <asp:BoundField DataField="AGENT_TYPE" HeaderText="AGENT_TYPE" SortExpression="AGENT_TYPE" />
                                <asp:BoundField DataField="STR_USE_CASE" HeaderText="STR_USE_CASE" SortExpression="STR_USE_CASE" />
                                <asp:BoundField DataField="ACNO" HeaderText="ACNO" SortExpression="ACNO" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SybaseConnectionLive %>" ProviderName="<%$ ConnectionStrings:SybaseConnectionLive.ProviderName %>" SelectCommand="Select  TRANSACTION_DATE, VALUE_DATE, IDTXN, NEWAMOUNT, BALANCE, NAME, ADDRESS ,AGENT_TYPE, STR_USE_CASE, ACNO  from cmsuser.CustStatTemp where ACNO  = ? order by IDTXN">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ACNOLabel" Name="?" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        kkk
                    </ItemTemplate>
                </asp:FormView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SybaseConnectionLive %>" ProviderName="<%$ ConnectionStrings:SybaseConnectionLive.ProviderName %>" SelectCommand="Select  TRANSACTION_DATE, VALUE_DATE, IDTXN, NEWAMOUNT, BALANCE, NAME, ADDRESS ,AGENT_TYPE, STR_USE_CASE, ACNO  from cmsuser.CustStatTemp order by IDTXN"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
</asp:Content>
