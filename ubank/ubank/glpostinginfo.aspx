<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="glpostinginfo.aspx.cs" Inherits="ubank.glpostinginfo" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1
        {
            width: 477px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

 
    <asp:Label ID="Label5" runat="server" Font-Bold="True" Text="GL Posting Transactions"></asp:Label>
    <br />
    <table style="width: 100%;">
        <tr>
            <td>
                <asp:Label ID="Label6" runat="server" Text="Date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTranDateFrom" runat="server" ValidationGroup="GLPosting"></asp:TextBox>
                <asp:CalendarExtender ID="txtTranDateFrom_CalendarExtender" runat="server" BehaviorID="txtTranDateFrom_CalendarExtender" TargetControlID="txtTranDateFrom">
                </asp:CalendarExtender>
            </td>
            <td>To Date</td>
            <td>
                <asp:TextBox ID="txtDateTo" runat="server" ValidationGroup="GLPosting"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label7" runat="server" Text="Transaction Type"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="TransDep" DataValueField="transType" ValidationGroup="GLPosting" Width="200px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GLPostingConnectionString %>" SelectCommand="SELECT [transType], [TransDep] FROM [RefTransType]"></asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="LoadTransactons" ValidationGroup="GLPosting" OnClick="Button1_Click" />
            </td>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">LinkButton</asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1" style="font-size: x-small" valign="top">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID" DataSourceID="SqlDataSource1" Font-Size="X-Small" ForeColor="#333333" GridLines="None" Width="396px"  OnRowDataBound ="GridView1_RowDataBound" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowFooter="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:TemplateField>
                            <FooterTemplate>
                                <asp:Label ID="lblTotalDr" runat="server"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblTotalCr" runat="server"></asp:Label>
                                <br />
                                <br />
                                <asp:Label ID="lblTotalDiff" runat="server"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="TransDate" HeaderText="TransDate" SortExpression="TransDate" />
                        <asp:BoundField DataField="GLCode" HeaderText="GLCode" SortExpression="GLCode" />
                        <asp:BoundField DataField="GLDescription" HeaderText="GLDescription" SortExpression="GLDescription" />
                        <asp:TemplateField HeaderText="TransAmount" SortExpression="TransAmount">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TransAmount") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("TransAmount") %>'></asp:Label>
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
                        <td style="font-size: x-small" valign="top">
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" OnRowDataBound ="GridView2_RowDataBound" ShowFooter="True" >
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:TemplateField HeaderText="GL_CODE_DESCRIPTION" SortExpression="GL_CODE_DESCRIPTION">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("GL_CODE_DESCRIPTION") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <FooterTemplate>
                                            <asp:Label ID="lblTotalDr1" runat="server"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label ID="lblTotalCr1" runat="server"></asp:Label>
                                            <br />
                                            <br />
                                            <asp:Label ID="lblTotalDiff1" runat="server"></asp:Label>
                                        </FooterTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("GL_CODE_DESCRIPTION") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="PIBASACCOUNT" HeaderText="PIBASACCOUNT" SortExpression="PIBASACCOUNT" />
                                    <asp:TemplateField HeaderText="PIBASAMOUNT" SortExpression="PIBASAMOUNT">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PIBASAMOUNT") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("PIBASAMOUNT") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="ID_GL_CODE" HeaderText="ID_GL_CODE" SortExpression="ID_GL_CODE" />
                                    <asp:BoundField DataField="AMOUNT" HeaderText="AMOUNT" SortExpression="AMOUNT" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
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
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:SybaseConnectionLive %>" OnSelecting="SqlDataSource3_Selecting" ProviderName="<%$ ConnectionStrings:SybaseConnectionLive.ProviderName %>" SelectCommand="SELECT * FROM ( SELECT PLS.BBTRANSACTIONS.TOACCOUNTNUMBERTA PibasAccount, SUM(PLS.BBTRANSACTIONS.TRANSACTIONAMOUNT) PIBASAmount FROM PLS.BBTRANSACTIONS@pibas WHERE NARRATION LIKE 'Sybase%' AND To_date(TRANSACTIONDATE,'yyyy-mm-dd')  = ? GROUP BY PLS.BBTRANSACTIONS.TOACCOUNTNUMBERTA ) asx ,( SELECT GL_CODE_DESCRIPTION,ID_GL_CODE,MAX(ID_GL_HISTORY) RefrenceNO, SUM(AMOUNT) Amount FROM (SELECT gl.GL_CODE_DESCRIPTION,gl.ID_GL_CODE,glh.ID_GL_HISTORY ID_GL_HISTORY, CASE WHEN glh.DC_FLAG='D' THEN glh.AMOUNT*-1 ELSE glh.AMOUNT END AMOUNT,glh.DC_FLAG FROM pbxhbl.GENERAL_LEDGER gl INNER JOIN pbxhbl.GL_HISTORY glh ON glh.GL_CODE=gl.ID_GL_CODE WHERE to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') &gt;= trunc(to_date(?)-1)||'04.00.00.00 AM' AND to_timestamp(glh.DAT_CREATION,'DD-MON-RR HH.MI.SS.FF AM') &lt; trunc(to_date(?))||'04.00.00.00 AM' AND glh.DC_FLAG='C' ) GROUP BY GL_CODE_DESCRIPTION,ID_GL_CODE,DC_FLAG ) asx2, cmsuser.TBLGLINFO gl WHERE asx2.ID_GL_CODE = gl.SYBASEGLACCOUNT AND asx.PibasAccount = gl.PIBAS_GL_WITH_LOCATION">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="txtTranDateFrom" Name="?" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtTranDateFrom" Name="?" PropertyName="Text" />
                                    <asp:ControlParameter ControlID="txtTranDateFrom" Name="?" PropertyName="Text" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GLPostingConnectionString %>" SelectCommand="SELECT ID, GLCode, GLDescription, TransNO, TransAmount, TransDate, PTransStatus, PTransDetail, IsTransReversal, dateLastupdate, RealAmount, Naration FROM tblTransection WHERE (PTransStatus = @PTransStatus) AND (TransDate &gt;= @TransDate) AND (TransDate &lt; @TransDate2 + 1) " OnSelecting="SqlDataSource1_Selecting" >
                    <SelectParameters>
                        <asp:ControlParameter ControlID="DropDownList1" Name="PTransStatus" PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="txtTranDateFrom" Name="TransDate" PropertyName="Text" Type="DateTime" />
                        <asp:ControlParameter ControlID="txtTranDateFrom" Name="TransDate2" PropertyName="Text" Type="DateTime" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
</asp:Content>
