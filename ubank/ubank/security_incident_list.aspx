<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="security_incident_list.aspx.cs" Inherits="ubank.security_incident_list" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="complaint_id" DataSourceID="SqlDataSource1" ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="complaint_id" HeaderText="Complaint ID" InsertVisible="False" ReadOnly="True" SortExpression="complaint_id" />
            <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
            <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
            <asp:BoundField DataField="date" HeaderText="Date" SortExpression="date" />
            <asp:BoundField DataField="Assigne_to" HeaderText="Assigne To" SortExpression="Assigne_to"  />
            <asp:BoundField DataField="priority" HeaderText="Priority" SortExpression="priority" />
            <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
            <asp:BoundField DataField="desription" HeaderText="desription" SortExpression="desription" Visible="false" />
            <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks" Visible="false"/>
            <asp:BoundField DataField="ProjectCatDesc" HeaderText="ProjectCatDesc" SortExpression="ProjectCatDesc" Visible="false"/>
            <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" />
            <asp:BoundField DataField="Assign_By" HeaderText="Assign_By" SortExpression="Assign_By" Visible="false"/>
              <asp:BoundField DataField="emp_name" HeaderText="emp_name" SortExpression="emp_name"  />
              <asp:ButtonField CommandName="Select" Text="Details" />
                 
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT DISTINCT RefComplaints.complaint_id, RefComplaints.subject, RefComplaints.category, RefComplaints.date, RefComplaints.Assigne_to, RefComplaints.priority, RefComplaints.location, RefComplaints.desription, RefComplaints.remarks, RefProjectCateg.ProjectCatDesc, RefComplaints.status, RefComplaints.Assign_By, RefComplaints.emp_name FROM RefComplaints INNER JOIN RefProjectCateg ON RefComplaints.ProjectCatID = RefProjectCateg.ProjectCatID "></asp:SqlDataSource>
</asp:Content>
