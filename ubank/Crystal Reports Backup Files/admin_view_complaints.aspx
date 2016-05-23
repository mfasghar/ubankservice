<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admin_view_complaints.aspx.cs" Inherits="ubank.admin_view_complaints" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="855px">
        <cc1:TabPanel runat="server" HeaderText="Open complaints" ID="TabPanel1">
            <ContentTemplate>

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="complaint_id" DataSourceID="SqlDataSource1" ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="complaint_id" HeaderText="complaint_id" InsertVisible="False" ReadOnly="True" SortExpression="complaint_id" />
                        <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                        <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                        <asp:BoundField DataField="Assigne_to" HeaderText="Assigne_to" SortExpression="Assigne_to" />
                        <asp:BoundField DataField="priority" HeaderText="priority" SortExpression="priority" />
                        <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
                        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" Visible="False" />
                        <asp:BoundField DataField="url" HeaderText="url" SortExpression="url" Visible="False" />
                        <asp:BoundField DataField="desription" HeaderText="desription" SortExpression="desription" Visible="False" />
                        <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks" Visible="False" />
                        <asp:BoundField DataField="ProjectCatID" HeaderText="ProjectCatID" SortExpression="ProjectCatID" Visible="False" />
                        <asp:BoundField DataField="ActivityID" HeaderText="ActivityID" SortExpression="ActivityID" Visible="False" />
                        <asp:BoundField DataField="Assign_By" HeaderText="Assign_By" SortExpression="Assign_By" />
                        <asp:BoundField DataField="Reported_problem_ID" HeaderText="Reported_problem_ID" SortExpression="Reported_problem_ID" Visible="False" />
                        <asp:BoundField DataField="Reported_channel_ID" HeaderText="Reported_channel_ID" SortExpression="Reported_channel_ID" Visible="False" />
                        <asp:ButtonField CommandName="Select" Text="Details" />
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

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT * FROM [RefComplaints] WHERE ([status] = @status)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Open" Name="status" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </ContentTemplate>
        </cc1:TabPanel>
        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="close Complaints">
            <ContentTemplate>



                <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="complaint_id" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" DataSourceID="SqlDataSource564" ForeColor="#333333">


                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="complaint_id" HeaderText="complaint_id" InsertVisible="False" ReadOnly="True" SortExpression="complaint_id" />
                        <asp:BoundField DataField="subject" HeaderText="subject" SortExpression="subject" />
                        <asp:BoundField DataField="category" HeaderText="category" SortExpression="category" />
                        <asp:BoundField DataField="date" HeaderText="date" SortExpression="date" />
                        <asp:BoundField DataField="Assigne_to" HeaderText="Assigne_to" SortExpression="Assigne_to" />
                        <asp:BoundField DataField="priority" HeaderText="priority" SortExpression="priority" />
                        <asp:BoundField DataField="location" HeaderText="location" SortExpression="location" />
                        <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" Visible="False"/>
                        <asp:BoundField DataField="url" HeaderText="url" SortExpression="url"  Visible="False"/>
                        <asp:BoundField DataField="desription" HeaderText="desription" SortExpression="desription"  Visible="False"/>
                        <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks"  Visible="False" />
                        <asp:BoundField DataField="ProjectCatID" HeaderText="ProjectCatID" SortExpression="ProjectCatID"  Visible="False" />
                        <asp:BoundField DataField="ActivityID" HeaderText="ActivityID" SortExpression="ActivityID" Visible="False" />
                        <asp:BoundField DataField="Assign_By" HeaderText="Assign_By"  SortExpression ="Assign_By" />
                        <asp:BoundField DataField="Reported_problem_ID" HeaderText="Reported_problem_ID" SortExpression="Reported_problem_ID"  Visible="False"/>
                        <asp:BoundField DataField="Reported_channel_ID" HeaderText="Reported_channel_ID" SortExpression="Reported_channel_ID"  Visible="False"/>
                        <asp:ButtonField CommandName="Select" Text="Details" />
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



                <asp:SqlDataSource ID="SqlDataSource564" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT DISTINCT * FROM [RefComplaints] WHERE ([status] = @status)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Close" Name="status" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>



            </ContentTemplate>
        </cc1:TabPanel>
    </cc1:TabContainer>
</asp:Content>
