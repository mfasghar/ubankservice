<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="incident_confirmation.aspx.cs" Inherits="ubank.incident_confirmation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 113px;
        }
        .auto-style4 {
            width: 249px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="complaint_id" DataSourceID="SqlDataSource1" Width="940px">
        <EditItemTemplate>
            complaint_id:
            <asp:Label ID="complaint_idLabel1" runat="server" Text='<%# Eval("complaint_id") %>' />
            <br />
            subject:
            <asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("subject") %>' />
            <br />
            category:
            <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
            <br />
            date:
            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
            <br />
            Assigne_to:
            <asp:TextBox ID="Assigne_toTextBox" runat="server" Text='<%# Bind("Assigne_to") %>' />
            <br />
            priority:
            <asp:TextBox ID="priorityTextBox" runat="server" Text='<%# Bind("priority") %>' />
            <br />
            location:
            <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
            <br />
            status:
            <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
            <br />
            url:
            <asp:TextBox ID="urlTextBox" runat="server" Text='<%# Bind("url") %>' />
            <br />
            desription:
            <asp:TextBox ID="desriptionTextBox" runat="server" Text='<%# Bind("desription") %>' />
            <br />
            remarks:
            <asp:TextBox ID="remarksTextBox" runat="server" Text='<%# Bind("remarks") %>' />
            <br />
            ProjectCatID:
            <asp:TextBox ID="ProjectCatIDTextBox" runat="server" Text='<%# Bind("ProjectCatID") %>' />
            <br />
            ActivityID:
            <asp:TextBox ID="ActivityIDTextBox" runat="server" Text='<%# Bind("ActivityID") %>' />
            <br />
            Assign_By:
            <asp:TextBox ID="Assign_ByTextBox" runat="server" Text='<%# Bind("Assign_By") %>' />
            <br />
            Reported_problem_ID:
            <asp:TextBox ID="Reported_problem_IDTextBox" runat="server" Text='<%# Bind("Reported_problem_ID") %>' />
            <br />
            Reported_channel_ID:
            <asp:TextBox ID="Reported_channel_IDTextBox" runat="server" Text='<%# Bind("Reported_channel_ID") %>' />
            <br />
            emp_id:
            <asp:TextBox ID="emp_idTextBox" runat="server" Text='<%# Bind("emp_id") %>' />
            <br />
            emp_designation:
            <asp:TextBox ID="emp_designationTextBox" runat="server" Text='<%# Bind("emp_designation") %>' />
            <br />
            emp_name:
            <asp:TextBox ID="emp_nameTextBox" runat="server" Text='<%# Bind("emp_name") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            subject:
            <asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("subject") %>' />
            <br />
            category:
            <asp:TextBox ID="categoryTextBox" runat="server" Text='<%# Bind("category") %>' />
            <br />
            date:
            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
            <br />
            Assigne_to:
            <asp:TextBox ID="Assigne_toTextBox" runat="server" Text='<%# Bind("Assigne_to") %>' />
            <br />
            priority:
            <asp:TextBox ID="priorityTextBox" runat="server" Text='<%# Bind("priority") %>' />
            <br />
            location:
            <asp:TextBox ID="locationTextBox" runat="server" Text='<%# Bind("location") %>' />
            <br />
            status:
            <asp:TextBox ID="statusTextBox" runat="server" Text='<%# Bind("status") %>' />
            <br />
            url:
            <asp:TextBox ID="urlTextBox" runat="server" Text='<%# Bind("url") %>' />
            <br />
            desription:
            <asp:TextBox ID="desriptionTextBox" runat="server" Text='<%# Bind("desription") %>' />
            <br />
            remarks:
            <asp:TextBox ID="remarksTextBox" runat="server" Text='<%# Bind("remarks") %>' />
            <br />
            ProjectCatID:
            <asp:TextBox ID="ProjectCatIDTextBox" runat="server" Text='<%# Bind("ProjectCatID") %>' />
            <br />
            ActivityID:
            <asp:TextBox ID="ActivityIDTextBox" runat="server" Text='<%# Bind("ActivityID") %>' />
            <br />
            Assign_By:
            <asp:TextBox ID="Assign_ByTextBox" runat="server" Text='<%# Bind("Assign_By") %>' />
            <br />
            Reported_problem_ID:
            <asp:TextBox ID="Reported_problem_IDTextBox" runat="server" Text='<%# Bind("Reported_problem_ID") %>' />
            <br />
            Reported_channel_ID:
            <asp:TextBox ID="Reported_channel_IDTextBox" runat="server" Text='<%# Bind("Reported_channel_ID") %>' />
            <br />
            emp_id:
            <asp:TextBox ID="emp_idTextBox" runat="server" Text='<%# Bind("emp_id") %>' />
            <br />
            emp_designation:
            <asp:TextBox ID="emp_designationTextBox" runat="server" Text='<%# Bind("emp_designation") %>' />
            <br />
            emp_name:
            <asp:TextBox ID="emp_nameTextBox" runat="server" Text='<%# Bind("emp_name") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style2" style="font-family: 'Times New Roman'; font-size: medium; font-weight: normal; color: #000080">Complaint ID: </td>
                    <td class="auto-style4" style="font-family: 'Times New Roman', Times, serif; font-size: small; color: #808080">
                        <asp:Label ID="complaint_idLabel" runat="server" Text='<%# Eval("complaint_id") %>' />
                    </td>
                    <td class="auto-style2" style="font-family: 'Times New Roman'; font-size: medium; font-weight: normal; color: #000080">Date:</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: small; color: #808080">
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="font-family: 'Times New Roman'; font-size: medium; font-weight: normal; color: #000080">Assign By: </td>
                    <td class="auto-style4" style="font-family: 'Times New Roman', Times, serif; font-size: small; color: #808080">
                        <asp:Label ID="Assign_ByLabel" runat="server" Text='<%# Bind("Assign_By") %>' />
                    </td>
                    <td class="auto-style2" style="font-family: 'Times New Roman'; font-size: medium; font-weight: normal; color: #000080">status:</td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: small; color: #808080">
                        <asp:Label ID="statusLabel" runat="server" Text='<%# Bind("status") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="font-family: 'Times New Roman'; font-size: medium; font-weight: normal; color: #000080">Reported To:</td>
                    <td class="auto-style4" style="font-family: 'Times New Roman', Times, serif; font-size: small; color: #808080">
                        <asp:Label ID="emp_nameLabel" runat="server" Text='<%# Bind("emp_name") %>' />
                    </td>
                    <td class="auto-style2" style="font-family: 'Times New Roman'; font-size: medium; font-weight: normal; color: #000080">Designation: </td>
                    <td style="font-family: 'Times New Roman', Times, serif; font-size: small; color: #808080">
                        <asp:Label ID="emp_designationLabel" runat="server" Text='<%# Bind("emp_designation") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2" style="font-family: 'Times New Roman'; font-size: medium; font-weight: normal; color: #000080">Description:</td>
                    <td colspan="3" style="font-family: 'Times New Roman', Times, serif; font-size: small; color: #808080">
                        <asp:Label ID="desriptionLabel" runat="server" Text='<%# Bind("desription") %>' />
                    </td>
                </tr>
            </table>
            <br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT * FROM [RefComplaints] WHERE ([complaint_id] = @complaint_id)">
        <SelectParameters>
            <asp:SessionParameter Name="complaint_id" SessionField="comlaint_id" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
    Your Complaint has been registered now.<br />
    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ValidationGroup="addtask">Register New Complaint</asp:LinkButton>
</asp:Content>
