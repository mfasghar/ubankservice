<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="actionregupdate.aspx.cs" Inherits="ubank.actionregupdate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

    .auto-style2
    {
        height: 24px;
    }
        .auto-style3
        {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <table >
        <tr valign="top">
            <td>
                <table id="Table1" >
                    <tr>
                        <td >
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="DarkRed">Action Register - Update Status</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4" Font-Size="Small" OnItemCommand="CommandFire" OnPageIndexChanged="MyDataGrid" OnSortCommand="MDataGrid_Sort" PagerStyle-HorizontalAlign="Right" PagerStyle-Mode="NumericPages" PagerStyle-NextPageText="Next" PagerStyle-PrevPageText="Prev" PageSize="4" Width="927px" ForeColor="#333333" GridLines="None">
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <ItemStyle BackColor="#EFF3FB" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
                                <AlternatingItemStyle BackColor="White" />
                                <Columns>
                                    <asp:ButtonColumn CommandName="SelectRec" HeaderText="Select Actity" Text="Select"></asp:ButtonColumn>
                                </Columns>
                                <PagerStyle ForeColor="White" HorizontalAlign="Center" NextPageText="Next" PrevPageText="Prev" BackColor="#2461BF" />
                            </asp:DataGrid>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblmsg" runat="server" ForeColor="DarkRed" Width="433px">Click on “”Select”” button to update the task</asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <asp:CheckBox ID="chk1" runat="server" AutoPostBack="true" Font-Name="Verdana" Font-Size="8pt" Text="Show numeric page navigation buttons" />
                        </td>
                    </tr>
                    <tr>
                        <td ">
                                <asp:Label ID="lblHiddenUserID" runat="server" Height="12px" Visible="False" Width="104px"></asp:Label>
                            </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    
</asp:Content>
