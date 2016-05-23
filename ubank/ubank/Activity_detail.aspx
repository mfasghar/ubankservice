<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Activity_detail.aspx.cs" Inherits="ubank.Activity_detail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

   
    <style type="text/css">
        .auto-style1
        {
            height: 16px;
            }
        .auto-style16 {
            width: 181px;
        }
        .auto-style17 {
        }
        .auto-style18 {
            height: 32px;
        }
        .auto-style19 {
        }
        .auto-style20 {
            height: 32px;
            width: 83px;
        }
        </style>

   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


      <div class="page-header" >
    <h1>Support Incident Records
          </h1>
          <h1 style="text-align: center; empty-cells: hide;">
        <asp:FormView ID="FormView2" runat="server"   CaptionAlign="Bottom" CellPadding="4"  DataKeyNames="complaint_id" DataSourceID="SqlDataSource2" Font-Size="Medium" Width="922px" ForeColor="#333333" >
        <EditItemTemplate>
            complaint_id:
            <asp:Label ID="complaint_idLabel1" runat="server" Text='<%# Eval("complaint_id") %>' />
            <br />
            subject:
            <asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("subject") %>' />
            <br />
            desription:
            <asp:TextBox ID="desriptionTextBox" runat="server" Text='<%# Bind("desription") %>' />
            <br />
            Assigne_to:
            <asp:TextBox ID="Assigne_toTextBox" runat="server" Text='<%# Bind("Assigne_to") %>' />
            <br />
            Assign_By:
            <asp:TextBox ID="Assign_ByTextBox" runat="server" Text='<%# Bind("Assign_By") %>' />
            <br />
            date:
            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
            <br />
            Problem_description:
            <asp:TextBox ID="Problem_descriptionTextBox" runat="server" Text='<%# Bind("Problem_description") %>' />
            <br />
            Report_description:
            <asp:TextBox ID="Report_descriptionTextBox" runat="server" Text='<%# Bind("Report_description") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <InsertItemTemplate>
            subject:
            <asp:TextBox ID="subjectTextBox" runat="server" Text='<%# Bind("subject") %>' />
            <br />
            desription:
            <asp:TextBox ID="desriptionTextBox" runat="server" Text='<%# Bind("desription") %>' />
            <br />
            Assigne_to:
            <asp:TextBox ID="Assigne_toTextBox" runat="server" Text='<%# Bind("Assigne_to") %>' />
            <br />
            Assign_By:
            <asp:TextBox ID="Assign_ByTextBox" runat="server" Text='<%# Bind("Assign_By") %>' />
            <br />
            date:
            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
            <br />
            Problem_description:
            <asp:TextBox ID="Problem_descriptionTextBox" runat="server" Text='<%# Bind("Problem_description") %>' />
            <br />
            Report_description:
            <asp:TextBox ID="Report_descriptionTextBox" runat="server" Text='<%# Bind("Report_description") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td class="auto-style16" style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">Reported Channel:</td>
                    <td class="auto-style17" style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="Report_descriptionLabel" runat="server" Text='<%# Bind("Report_description") %>' />
                    </td>
                    <td style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">date:</td>
                    <td style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16" style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">Problem description:</td>
                    <td class="auto-style17" style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="Problem_descriptionLabel" runat="server" Text='<%# Bind("Problem_description") %>' />
                    </td>
                    <td style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">Assigne_to:</td>
                    <td style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="Assigne_toLabel" runat="server" Text='<%# Bind("Assigne_to") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16" style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">complaint_id:</td>
                    <td class="auto-style17" style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="complaint_idLabel" runat="server" Text='<%# Eval("complaint_id") %>' />
                    </td>
                    <td style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">Assign_By:</td>
                    <td style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="Assign_ByLabel" runat="server" Text='<%# Bind("Assign_By") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16" style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">subject:</td>
                    <td class="auto-style17" style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="subjectLabel" runat="server" Text='<%# Bind("subject") %>' />
                    </td>
                    <td style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">&nbsp;</td>
                    <td style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style16" style="font-size: small; font-weight: bold; color: #333333; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">desription:</td>
                    <td class="auto-style17" colspan="3" style="font-size: small; font-weight: normal; color: #000080; text-align: left; border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; empty-cells: hide">
                        <asp:Label ID="desriptionLabel" runat="server" Text='<%# Bind("desription") %>' />
                    </td>
                </tr>
            </table>
            <br />
           

        </ItemTemplate>
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        </asp:FormView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT RefComplaints.complaint_id, RefComplaints.subject, RefComplaints.desription, RefComplaints.Assigne_to, RefComplaints.Assign_By, RefComplaints.date, [RefReported Problem].Problem_description, Reported_channel.Report_description FROM RefComplaints INNER JOIN [RefReported Problem] ON RefComplaints.Reported_problem_ID = [RefReported Problem].Reported_problem_ID INNER JOIN Reported_channel ON RefComplaints.Reported_channel_ID = Reported_channel.Reported_channel_ID WHERE (RefComplaints.complaint_id = @complaint_id)">
            <SelectParameters>
                <asp:SessionParameter Name="complaint_id" SessionField="id" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>
        <table style="width:100%;">
           

                <div>

                      
             <tr >
                <td align="left" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; word-spacing: normal; text-align: left; font-size: large; font-weight: bold; color: #0099FF;" colspan="3">
                    change current status</td>

               
            </tr>

             <tr >
                <td align="left" class="auto-style19">
                    <asp:Label ID="Label1" runat="server" Text="Activity" Font-Size="Small" Font-Bold="False"></asp:Label>

                </td>

               
                <td align="left" colspan="2">
                    &nbsp;<asp:DropDownList ID="activity" runat="server" DataSourceID="SqlDataSource3" DataTextField="ActivityDes" DataValueField="ActivityID" Font-Size="Small" Height="20px" Width="398px"></asp:DropDownList>

                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT [ActivityID], [ActivityDes] FROM [RefActivity]"></asp:SqlDataSource>

                </td>

               
            </tr>

            <tr>

                 <td align="left" class="auto-style19"> 

                    
                    <asp:Label ID="Label2" runat="server" Text="Description" Font-Size="Small" Font-Bold="False"></asp:Label>
                    
                </td>

                 <td align="left" colspan="2"> 

                    
                   <asp:TextBox ID="TextBox1" runat="server" Width="559px" Height="64px" TextMode="MultiLine" Font-Size="Small" ></asp:TextBox>

                </td>

            </tr>


            <tr align="center" >
                
                <td align="right" class="auto-style20">

                    
                    <asp:Label ID="Label321" runat="server" Text="Assigne To" Font-Size="Small" Font-Bold="False" Visible="False"></asp:Label>
                    
                </td>
                
                <td align="left"  >

                     <asp:DropDownList ID="assinge_to" runat="server" DataSourceID="SqlDataSource4" DataTextField="UserID" DataValueField="UserID" Font-Size="Small" Height="20px" Width="398px" Visible="False"></asp:DropDownList>

                     <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT sirGroup.UserID, RefComplaints.ProjectCatID, RefComplaints.complaint_id FROM sirGroup INNER JOIN RefComplaints ON sirGroup.ProjectCatID = RefComplaints.ProjectCatID WHERE (RefComplaints.complaint_id = @complaint_id)">
                         <SelectParameters>
                             <asp:SessionParameter Name="complaint_id" SessionField="id" />
                         </SelectParameters>
                     </asp:SqlDataSource>
                </td>
                
                <td align="right" class="auto-style18">

                     </td>
                
            
                   </tr>


            <tr align="center" >
                
                <td align="right" class="auto-style1" colspan="3">

                     <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ValidationGroup="addtask" Font-Size="Small">Submit</asp:LinkButton>
                </td>
                </div>
                
            
                   </tr>


            <tr align="center" >
                
                <td align="left" class="auto-style1" style="border-bottom-style: solid; border-bottom-width: thin; border-bottom-color: #C0C0C0; word-spacing: normal; text-align: left; font-size: large; font-weight: bold; color: #0099FF;" colspan="3">

                     Complaint History</td>
                
            
                   </tr>
            <tr align="left">
              
                <td align="left" class="auto-style19" colspan="3">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" Font-Size ="Small" Width="805px" CaptionAlign="Left">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" VerticalAlign="Middle"  />
                        <Columns>
                            <asp:BoundField DataField="complaint_id" HeaderText="complaint_id" SortExpression="complaint_id" >
                            </asp:BoundField>
                            <asp:BoundField DataField="ActivityDes" HeaderText="ActivityDes" SortExpression="ActivityDes" >
                            </asp:BoundField>
                            <asp:BoundField DataField="Activity_description" HeaderText="Activity_description" SortExpression="Activity_description" />
                            <asp:BoundField DataField="Activity_time" HeaderText="Activity_time" SortExpression="Activity_time" />
                            <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:strConn %>" SelectCommand="SELECT RefActivityDetails.complaint_id, RefActivity.ActivityDes, RefActivityDetails.Activity_description, RefActivityDetails.Activity_time, UserManager.UserName FROM RefActivityDetails INNER JOIN RefActivity ON RefActivityDetails.ActivityID = RefActivity.ActivityID INNER JOIN UserManager ON RefActivityDetails.Activity_performed_by = UserManager.UserID WHERE (RefActivityDetails.complaint_id = @complaint_id)">
                        <SelectParameters>
                            <asp:SessionParameter Name="complaint_id" SessionField="id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
              
            </tr>
            <tr>
                <td align="left" class="auto-style19">
                    &nbsp;</td>
                <td align="left" class="auto-style12" colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
          </h1>
    </div>


    </asp:Content>
