<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add_channels.aspx.cs" Inherits="ubank.Add_channels" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
  
   
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    

     

    <fieldset>
    <legend>Add New Channel</legend>
    <label>Channel Name</label>&nbsp;
        <asp:TextBox ID="channel_name" runat="server" BorderColor="#999999" BorderStyle="Solid"></asp:TextBox>
    <span class="help-block">
        <br />
        <br />
        Enter the name of new channel.</span>
   
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ValidationGroup="addtask"  >Add</asp:LinkButton>
    </fieldset>
  
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Reported_channel_ID" DataSourceID="SqlDataSource1" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Reported_channel_ID" HeaderText="Reported_channel_ID" InsertVisible="False" ReadOnly="True" SortExpression="Reported_channel_ID" />
            <asp:BoundField DataField="Report_description" HeaderText="Report_description" SortExpression="Report_description" />
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

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT * FROM [Reported_channel]"></asp:SqlDataSource>

</asp:Content>
