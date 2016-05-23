<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="compaint_list.aspx.cs" Inherits="ubank.compaint_list" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        
  
    <table style="width: 100%;">
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0"  style="margin-bottom: 150px" Width="933px">
                    <cc1:TabPanel runat="server" HeaderText="Indivisual Tasks" ID="TabPanel1">
                        <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" Class="nav nav-tabs" DataSourceID="SqlDataSource15" ForeColor="#333333" Height="160px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="complaint_id" Width="926px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    
                                    <asp:BoundField DataField="complaint_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="complaint_id" />
                                     <asp:BoundField DataField="Report_description" HeaderText="Channel" SortExpression="Report_description" />
                                    <asp:BoundField DataField="subject" HeaderText="System" SortExpression="subject" />
                                    <asp:BoundField DataField="category" HeaderText="Module" SortExpression="category" />
                                    <asp:BoundField DataField="date" HeaderText="Created Date" SortExpression="date" />
                                    <asp:BoundField DataField="Assigne_to" HeaderText="Assigne_to" SortExpression="Assigne_to" Visible="False" />
                                    <asp:BoundField DataField="priority" HeaderText="Priority" SortExpression="priority" />
                                    <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                                    <asp:BoundField DataField="desription" HeaderText="desription" SortExpression="desription" Visible="False" />
                                    <asp:BoundField DataField="remarks" HeaderText="remarks" SortExpression="remarks"  Visible="False"/>
                                    <asp:BoundField DataField="ProjectCatDesc" HeaderText="ProjectCatDesc" SortExpression="ProjectCatDesc" Visible="False" />
                                    <asp:BoundField DataField="Assign_By" HeaderText="Assinged By" SortExpression="UserID"  />
                                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status"  Visible="False"/>
                                    <asp:ButtonField CommandName="Select" Text="Details" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" BorderStyle="Groove" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource15" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" DeleteCommand="DELETE FROM [RefComplaints] WHERE [complaint_id] = @complaint_id" InsertCommand="INSERT INTO [RefComplaints] ([subject], [date], [Assigne_name], [priority], [location], [status], [url], [desription], [remarks]) VALUES (@subject, @date, @Assigne_name, @priority, @location, @status, @url, @desription, @remarks)" SelectCommand="SELECT DISTINCT RefComplaints.complaint_id, RefComplaints.subject, RefComplaints.category, RefComplaints.date, RefComplaints.Assigne_to, RefComplaints.priority, RefComplaints.location, RefComplaints.desription, RefComplaints.remarks, RefProjectCateg.ProjectCatDesc, RefComplaints.status, Reported_channel.Report_description, RefComplaints.Assign_By FROM RefComplaints INNER JOIN RefProjectCateg ON RefComplaints.ProjectCatID = RefProjectCateg.ProjectCatID INNER JOIN Reported_channel ON RefComplaints.Reported_channel_ID = Reported_channel.Reported_channel_ID WHERE (RefComplaints.Assigne_to = @Param1) AND (RefComplaints.status = 'Open')" UpdateCommand="UPDATE [RefComplaints] SET [subject] = @subject, [date] = @date, [Assigne_name] = @Assigne_name, [priority] = @priority, [location] = @location, [status] = @status, [url] = @url, [desription] = @desription, [remarks] = @remarks WHERE [complaint_id] = @complaint_id">
                                <DeleteParameters>
                                    <asp:Parameter Name="complaint_id" Type="Decimal" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="subject" Type="String" />
                                    <asp:Parameter Name="date" Type="DateTime" />
                                    <asp:Parameter Name="Assigne_name" Type="String" />
                                    <asp:Parameter Name="priority" Type="String" />
                                    <asp:Parameter Name="location" Type="String" />
                                    <asp:Parameter Name="status" Type="String" />
                                    <asp:Parameter Name="url" Type="String" />
                                    <asp:Parameter Name="desription" Type="String" />
                                    <asp:Parameter Name="remarks" Type="String" />
                                </InsertParameters>
                                <SelectParameters>
                                   <asp:SessionParameter Name="Param1" SessionField="UserID" />
                                </SelectParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="subject" Type="String" />
                                    <asp:Parameter Name="date" Type="DateTime" />
                                    <asp:Parameter Name="Assigne_name" Type="String" />
                                    <asp:Parameter Name="priority" Type="String" />
                                    <asp:Parameter Name="location" Type="String" />
                                    <asp:Parameter Name="status" Type="String" />
                                    <asp:Parameter Name="url" Type="String" />
                                    <asp:Parameter Name="desription" Type="String" />
                                    <asp:Parameter Name="remarks" Type="String" />
                                    <asp:Parameter Name="complaint_id" Type="Decimal" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                        </ContentTemplate>
                    </cc1:TabPanel>
                   
                    <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="Close Complaints">

                        <ContentTemplate>




                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="complaint_id" DataSourceID="SqlDataSource768886" ForeColor="#333333" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" Width="926px">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:BoundField DataField="complaint_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="complaint_id" />
                                    <asp:BoundField DataField="subject" HeaderText="Subject" SortExpression="subject" />
                                    <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                                    <asp:BoundField DataField="date" HeaderText="Closed Date" SortExpression="date" />
                                    <asp:BoundField DataField="Assigne_to" HeaderText="Assigne_to" SortExpression="Assigne_to" Visible="False"/>
                                    <asp:BoundField DataField="priority" HeaderText="Priority" SortExpression="priority" />
                                    <asp:BoundField DataField="location" HeaderText="Location" SortExpression="location" />
                                    <asp:BoundField DataField="desription" HeaderText="desription" SortExpression="desription" Visible="False"/>
                                    <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks" />
                                    <asp:BoundField DataField="ProjectCatDesc" HeaderText="ProjectCatDesc" SortExpression="ProjectCatDesc" Visible="False" />
                                    <asp:BoundField DataField="UserID" HeaderText="Assigned By" SortExpression="UserID" />
                                    <asp:BoundField DataField="status" HeaderText="status" SortExpression="status" Visible="False"/>
                                    <asp:ButtonField CommandName="Select" Text="Details" />
                                </Columns>
                                <EditRowStyle BackColor="#7C6F57" />
                                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#E3EAEB" />
                                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                                <SortedAscendingHeaderStyle BackColor="#246B61" />
                                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                                <SortedDescendingHeaderStyle BackColor="#15524A" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource768886" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT DISTINCT RefComplaints.complaint_id, RefComplaints.subject, RefComplaints.category, RefComplaints.date, RefComplaints.Assigne_to, RefComplaints.priority, RefComplaints.location, RefComplaints.desription, RefComplaints.remarks, RefProjectCateg.ProjectCatDesc, sirGroup.UserID, RefComplaints.status FROM RefComplaints INNER JOIN RefProjectCateg ON RefComplaints.ProjectCatID = RefProjectCateg.ProjectCatID LEFT OUTER JOIN sirGroup ON RefProjectCateg.ProjectCatID = sirGroup.ProjectCatID WHERE (RefComplaints.Assigne_to  = @Param1) AND (RefComplaints.status = 'Close')">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Param1" SessionField="UserID" />
                                </SelectParameters>
                            </asp:SqlDataSource>




                        </ContentTemplate>

                    </cc1:TabPanel>
                </cc1:TabContainer>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="session" runat="server" Text="Label" Visible="False"></asp:Label>
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
        
  
</asp:Content>
